//
//  HMDownloader.m
//  02-下载文件
//
//  Created by Apple on 15/10/25.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMDownloader.h"

// 只有报刊杂志类型的应用才能使用NSURLConnectionDownloadDelegate，否则的话文件不会保存
// #import <NewsstandKit/NewsstandKit.h>
@interface HMDownloader () <NSURLConnectionDownloadDelegate>

@end

@implementation HMDownloader
- (void)download:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    // NSURLConnection 下载过程是在当前线程的消息循环中下载的
    // 调用后会在这个类中下载
    // 也就是这里是在主线程中下载的
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request
                                                            delegate:self];
}

// 代理方法
// 下载进度
- (void)connection:(NSURLConnection *)connection
          didWriteData:(long long)bytesWritten
     totalBytesWritten:(long long)totalBytesWritten
    expectedTotalBytes:(long long)expectedTotalBytes {
    // bytesWritten         本次下载了多少字节
    // totalBytesWritten    总共下载了多少字节
    // expectedTotalBytes   文件的大小
    float process = totalBytesWritten * 1.0 / expectedTotalBytes;
    NSLog(@"下载进度 %f", process);
    //    NSLog(@"%@",[NSThread currentThread]);
}
// 续传文件
- (void)connectionDidResumeDownloading:(NSURLConnection *)connection
                     totalBytesWritten:(long long)totalBytesWritten
                    expectedTotalBytes:(long long)expectedTotalBytes {
}
// 下载完成
- (void)connectionDidFinishDownloading:(NSURLConnection *)connection
                        destinationURL:(NSURL *)destinationURL {
    NSLog(@"下载完成 %@", destinationURL);
}
// 处理错误
- (void)connection:(NSURLConnection *)connection
    didFailWithError:(NSError *)error {
    NSLog(@"下载出错 %@", error);
}

@end
