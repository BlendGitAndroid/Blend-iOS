//
//  HMDownloader.m
//  02-下载文件
//
//  Created by Apple on 15/10/25.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMDownloader.h"

@interface HMDownloader () <NSURLConnectionDataDelegate>
// 文件的总大小
@property(nonatomic, assign) long long expectedContentLength;
// 总共下载的文件大小
@property(nonatomic, assign) long long currentFileSize;

@end

@implementation HMDownloader

- (void)download:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    // NSURLConnection 下载过程是在当前线程的消息循环中下载的
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request
                                                            delegate:self];
}

// 代理方法
// 下载进度

// 接收到响应头
- (void)connection:(NSURLConnection *)connection
    didReceiveResponse:(NSURLResponse *)response {
    // 文件总大小
    self.expectedContentLength = response.expectedContentLength;
}

// 一点一点接收数据
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // 当前下载的大小
    self.currentFileSize += data.length;

    float process = self.currentFileSize * 1.0 / self.expectedContentLength;
    NSLog(@"%f", process);

    // 保存文件
    [self saveFile:data];
}
- (void)saveFile:(NSData *)data {
    // 保存文件的路径
    NSString *filePath = @"/Users/Apple/Desktop/111111.hm";
    // 如果文件不存在，返回的是nil
    NSFileHandle *fileHandle =
        [NSFileHandle fileHandleForWritingAtPath:filePath];
    if (fileHandle == nil) {
        // 如果文件不存在，会自动创建
        [data writeToFile:filePath atomically:YES];
    } else {
        // 让offset指向文件的末尾
        [fileHandle seekToEndOfFile];

        [fileHandle writeData:data];
        // 关闭文件，每次写完数据都要关闭文件，否则会占用系统资源
        [fileHandle closeFile];
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"下载完成");
    //    [self.mutableData writeToFile:@"/Users/Apple/Desktop/111111.hm"
    //    atomically:YES];
}

// 处理错误
- (void)connection:(NSURLConnection *)connection
    didFailWithError:(NSError *)error {
    NSLog(@"下载出错 %@", error);
}

@end
