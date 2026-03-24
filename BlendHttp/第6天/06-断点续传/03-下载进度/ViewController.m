//
//  ViewController.m
//  03-下载进度
//
//  Created by Apple on 15/10/26.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSURLSessionDownloadDelegate>
@property(nonatomic, strong) NSURLSession *session;

@property(nonatomic, strong) NSURLSessionDownloadTask *downloadTask;

@property(nonatomic, strong) NSData *resumeData;
@property(weak, nonatomic) IBOutlet UIProgressView *progressView;
@end

@implementation ViewController
// 开始下载
- (IBAction)start:(id)sender {
    [self download];
}
/// Users/Apple/Library/Developer/CoreSimulator/Devices/76983D98-3508-4A09-A39A-6C9F5AD94E1F/data/Containers/Data/Application/BA7695D2-E268-4C88-B9B4-3853FD8F7B35/tmp/123.tmp

/// Users/Apple/Library/Developer/CoreSimulator/Devices/76983D98-3508-4A09-A39A-6C9F5AD94E1F/data/Containers/Data/Application/5805FEA3-CC16-4BD9-B093-479D202B3A70/tmp/123.tmp

// 暂停下载
- (IBAction)pause:(id)sender {
    // 取消下载任务并生成续传数据的方法，它是断点续传的核心
    [self.downloadTask
        cancelByProducingResumeData:^(NSData *_Nullable resumeData) {
          // 保存续传的数据
          self.resumeData = resumeData;

          // 把续传数据保存到沙盒中
          NSString *path = [NSTemporaryDirectory()
              stringByAppendingPathComponent:@"123.tmp"];
          [self.resumeData writeToFile:path atomically:YES];
          NSLog(@"%@", path);
          // 变成nil
          self.downloadTask = nil;
          //        NSLog(@"%@",resumeData);
        }];
}
// 继续下载
- (IBAction)resume:(id)sender {

    if (self.downloadTask != nil) {
        return;
    }

    // 从沙盒中获取续传数据
    NSString *path =
        [NSTemporaryDirectory() stringByAppendingPathComponent:@"123.tmp"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        self.resumeData = [NSData dataWithContentsOfFile:path];
    }

    if (self.resumeData == nil) {
        return;
    }

    self.downloadTask =
        [self.session downloadTaskWithResumeData:self.resumeData];
    [self.downloadTask resume];
    self.resumeData = nil;
}

// 懒加载
- (NSURLSession *)session {
    if (_session == nil) {
        NSURLSessionConfiguration *config =
            [NSURLSessionConfiguration defaultSessionConfiguration];

        _session = [NSURLSession
            sessionWithConfiguration:config
                            delegate:self
                       delegateQueue:[NSOperationQueue mainQueue]];
    }
    return _session;
}

// 开始下载
- (void)download {
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/abc.hm"];

    NSURLSessionDownloadTask *downloadTask =
        [self.session downloadTaskWithURL:url];
    self.downloadTask = downloadTask;
    [downloadTask resume];

    //    [[self.session downloadTaskWithURL:url] resume];
}

// 代理方法

// 下载完成
- (void)URLSession:(NSURLSession *)session
                 downloadTask:(NSURLSessionDownloadTask *)downloadTask
    didFinishDownloadingToURL:(NSURL *)location {
    NSLog(@"%@", [NSThread currentThread]);
    NSLog(@"下载完成 ： %@", location);
}
// 续传的方法
// 当使用 resumeData 恢复下载时，这个方法会被调用
- (void)URLSession:(NSURLSession *)session
          downloadTask:(NSURLSessionDownloadTask *)downloadTask
     didResumeAtOffset:(int64_t)fileOffset
    expectedTotalBytes:(int64_t)expectedTotalBytes {
    NSLog(@"续传");
}
// 获取进度的方法
- (void)URLSession:(NSURLSession *)session
                 downloadTask:(NSURLSessionDownloadTask *)downloadTask
                 didWriteData:(int64_t)bytesWritten
            totalBytesWritten:(int64_t)totalBytesWritten
    totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    float process = totalBytesWritten * 1.0 / totalBytesExpectedToWrite;
    NSLog(@"下载进度: %f", process);
    self.progressView.progress = process;
}
@end
