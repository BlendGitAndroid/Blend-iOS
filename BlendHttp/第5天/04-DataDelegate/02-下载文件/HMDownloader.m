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
// 二进制数据累加
@property(nonatomic, strong) NSMutableData *mutableData;
@end

@implementation HMDownloader

- (NSMutableData *)mutableData {
    if (_mutableData == nil) {
        _mutableData = [NSMutableData data];
    }
    return _mutableData;
}

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
    // 当前下载的大小，不断的累积
    self.currentFileSize += data.length;

    // 下载添加会越来越多，导致内存爆炸
    [self.mutableData appendData:data];

    float process = self.currentFileSize * 1.0 / self.expectedContentLength;
    NSLog(@"%f", process);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"下载完成");
    [self.mutableData writeToFile:@"/Users/Apple/Desktop/111111.hm"
                       atomically:YES];
}

// 处理错误
- (void)connection:(NSURLConnection *)connection
    didFailWithError:(NSError *)error {
    NSLog(@"下载出错 %@", error);
}

@end
