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

@property(nonatomic, strong) NSOutputStream *stream;

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

    // 创建流，流就是比如水管
    self.stream =
        [NSOutputStream outputStreamToFileAtPath:@"/Users/Apple/Desktop/2222.hm"
                                          append:YES];
    // 打开流
    [self.stream open];
}

// 一点一点接收数据
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // 当前下载的大小
    self.currentFileSize += data.length;

    float process = self.currentFileSize * 1.0 / self.expectedContentLength;
    NSLog(@"%f", process);

    // 使用流保存数据
    // buffer - 指向要写入数据的字节数组指针
    // len - 要写入的最大字节数
    // 返回值 - 实际写入的字节数
    [self.stream write:data.bytes maxLength:data.length];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"下载完成");
    // 关闭流
    [self.stream close];
}

// 处理错误
- (void)connection:(NSURLConnection *)connection
    didFailWithError:(NSError *)error {
    NSLog(@"下载出错 %@", error);
}

@end
