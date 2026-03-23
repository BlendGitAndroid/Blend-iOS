//
//  HMDownloader.m
//  02-下载文件
//
//  Created by Apple on 15/10/25.
//  Copyright © 2015年 heima. All rights reserved.
//

// 断点续传 思路
// 1 判断是否存在文件，如果文件不存在 从0开始下载
// 2 如果文件存在
// 判断本地的文件大小 == 服务器文件大小  不需要下载
// 判断本地的文件大小 <  服务器文件大小  从当前位置开始下载
// 判断本地的文件大小 >  服务器文件大小  删除文件，从0开始下载

#import "HMDownloader.h"

@interface HMDownloader () <NSURLConnectionDataDelegate>
// 文件的总大小
@property(nonatomic, assign) long long expectedContentLength;
// 总共下载的文件大小
@property(nonatomic, assign) long long currentFileSize;

@property(nonatomic, strong) NSOutputStream *stream;

// 要保存文件的路径
@property(nonatomic, copy) NSString *filePath;

@property(nonatomic, strong) NSURLConnection *conn;
// 回调的block
@property(nonatomic, copy) void (^successBlock)(NSString *path);
@property(nonatomic, copy) void (^processBlock)(float process);
@property(nonatomic, copy) void (^errorBlock)(NSError *error);

@property(nonatomic, copy) NSString *urlString;
@end

@implementation HMDownloader

// 暂停下载
- (void)pause {
    [self.conn cancel];
    // 取消自定义操作，也就是取消NSOperation的执行
    [self cancel];
}

// 重写main方法
// NSOperation 通常在后台线程执行
// 后台线程默认没有 AutoreleasePool
// 如果不创建，临时对象无法自动释放，造成内存泄漏
- (void)main {
    // 自动释放池用于管理临时对象的内存
    // 当池被销毁时，会向池中所有对象发送 release 消息
    @autoreleasepool {
        NSURL *url = [NSURL URLWithString:self.urlString];

        // 下载之前，获取服务器文件的大小和名称
        [self getServerFileInfo:url];

        if (self.isCancelled) {
            return;
        }

        // 获取本地文件的大小，并且和服务器文件比较
        self.currentFileSize = [self checkLocalFileInfo];
        if (self.currentFileSize == -1) {
            //        NSLog(@"您已经下载完成，请不要重复下载");

            if (self.successBlock) {
                dispatch_async(dispatch_get_main_queue(), ^{
                  self.successBlock(self.filePath);
                });
            }

            return;
        }

        if (self.isCancelled) {
            return;
        }

        // 请求头
        // Range:bytes=x-y  从x个字节下载到y个字节
        // Range:bytes=x-   从x个字节下到最后
        // Range:bytes=-y   从头下到第y个字节
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];

        [request setValue:[NSString stringWithFormat:@"bytes=%lld-",
                                                     self.currentFileSize]
            forHTTPHeaderField:@"Range"];

        // NSURLConnection 下载过程是在当前线程的消息循环中下载的
        // 设置connection的代理。下载过程是在当前线程的消息循环中下载的
        NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request
                                                                delegate:self];
        self.conn = conn;

        [[NSRunLoop currentRunLoop] run];
    }
}

// 下载文件
+ (instancetype)downloader:(NSString *)urlString
              successBlock:(void (^)(NSString *path))successBlock
              processBlock:(void (^)(float process))processBlock
                errorBlock:(void (^)(NSError *error))errorBlock {
    //
    HMDownloader *downloader = [self new];
    downloader.successBlock = successBlock;
    downloader.processBlock = processBlock;
    downloader.errorBlock = errorBlock;
    downloader.urlString = urlString;

    return downloader;
}

// 获取服务器文件的大小和名称
- (void)getServerFileInfo:(NSURL *)url {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"head";

    NSURLResponse *response = nil;
    [NSURLConnection sendSynchronousRequest:request
                          returningResponse:&response
                                      error:NULL];

    self.expectedContentLength = response.expectedContentLength;
    self.filePath = [NSTemporaryDirectory()
        stringByAppendingPathComponent:response.suggestedFilename];
}

// 获取本地文件的大小，并且和服务器文件比较
// 1 判断文件是否存在，如果文件不存在 返回0  从开始位置下载
// 2 本地文件的大小
// 3 本地文件的大小  服务器文件大小比较
// 本地文件的大小 == 服务器文件大小比较  返回-1  已经下载完毕
// 本地文件的大小 <  服务器文件大小比较  返回fileSize
// 本地文件的大小 >  服务器文件大小比较  删除文件，返回0  从开始位置下载
- (long long)checkLocalFileInfo {
    long long fileSize = 0;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:self.filePath]) {
        // 如果文件存在，比较服务器文件大小
        // 本地文件的大小
        NSDictionary *attrs = [fileManager attributesOfItemAtPath:self.filePath
                                                            error:NULL];
        fileSize = attrs.fileSize;

        if (fileSize == self.expectedContentLength) {
            fileSize = -1;
        }
        if (fileSize > self.expectedContentLength) {
            //
            fileSize = 0;

            // 删除文件
            [fileManager removeItemAtPath:self.filePath error:NULL];
        }
    }

    return fileSize;
}

// 代理方法
// 下载进度

// 接收到响应头
- (void)connection:(NSURLConnection *)connection
    didReceiveResponse:(NSURLResponse *)response {
    // 创建流
    self.stream = [NSOutputStream outputStreamToFileAtPath:self.filePath
                                                    append:YES];
    // 打开流
    [self.stream open];
}

// 一点一点接收数据
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // 当前下载的大小
    self.currentFileSize += data.length;

    float process = self.currentFileSize * 1.0 / self.expectedContentLength;
    //    NSLog(@"%f",process);

    // 保存数据
    [self.stream write:data.bytes maxLength:data.length];

    if (self.processBlock) {
        self.processBlock(process);
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    //    NSLog(@"下载完成");
    //    [self.mutableData writeToFile:@"/Users/Apple/Desktop/111111.hm"
    //    atomically:YES];
    // 关闭流
    [self.stream close];

    if (self.successBlock) {
        // 回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
          self.successBlock(self.filePath);
        });
    }
}

// 处理错误
- (void)connection:(NSURLConnection *)connection
    didFailWithError:(NSError *)error {
    //    NSLog(@"下载出错 %@",error);

    if (self.errorBlock) {
        self.errorBlock(error);
    }
}

@end
