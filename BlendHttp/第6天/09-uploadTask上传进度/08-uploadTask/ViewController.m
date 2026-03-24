//
//  ViewController.m
//  08-uploadTask
//
//  Created by Apple on 15/10/26.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSURLSessionTaskDelegate>
@property(nonatomic, strong) NSURLSession *session;
@end

@implementation ViewController
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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self uploadTask1];
}
// 上传文件，获取上传进度
- (void)uploadTask1 {
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/uploads/123.jpg"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"put";
    // 设置账号和密码
    // Authorization: Basic YWRtaW46MTIzNDU2
    // YWRtaW46MTIzNDU2  admin:123456
    [request setValue:[self getAuth:@"admin" pwd:@"123456"]
        forHTTPHeaderField:@"Authorization"];

    // 本地文件
    NSURL *fileUrl = [[NSBundle mainBundle] URLForResource:@"01.jpg"
                                             withExtension:nil];

    //    [[self.session uploadTaskWithRequest:request fromFile:fileUrl]
    //    resume];
    // uploadTaskWithRequest 是 NSURLSession
    // 中用于创建上传任务的方法，用于将数据或文件上传到服务器。
    // NSURLSessionUploadTask 继承自 NSURLSessionDataTask
    // 专门用于处理文件上传任务
    // 支持大文件上传、进度跟踪、后台上传等功能
    [[self.session uploadTaskWithRequest:request
                                fromFile:fileUrl
                       completionHandler:^(NSData *_Nullable data,
                                           NSURLResponse *_Nullable response,
                                           NSError *_Nullable error) {
                         //        NSString *str = [[NSString alloc]
                         //        initWithData:data
                         //        encoding:NSUTF8StringEncoding];
                         NSLog(@"--上传完成%@", response);
                       }] resume];
}

// 代理方法

// 上传进度
- (void)URLSession:(NSURLSession *)session
                        task:(NSURLSessionTask *)task
             didSendBodyData:(int64_t)bytesSent
              totalBytesSent:(int64_t)totalBytesSent
    totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend {

    float progress = totalBytesSent * 1.0 / totalBytesExpectedToSend;
    NSLog(@"上传进度 %f", progress);
}
- (void)URLSession:(NSURLSession *)session
                    task:(NSURLSessionTask *)task
    didCompleteWithError:(NSError *)error {
    NSLog(@"上传完成");
}

// 上传文件
- (void)uploadTask {
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/uploads/123.jpg"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"put";
    // 设置账号和密码
    // Authorization: Basic YWRtaW46MTIzNDU2
    // YWRtaW46MTIzNDU2  admin:123456
    [request setValue:[self getAuth:@"admin" pwd:@"123456"]
        forHTTPHeaderField:@"Authorization"];

    // 本地文件
    NSURL *fileUrl = [[NSBundle mainBundle] URLForResource:@"head2.png"
                                             withExtension:nil];

    [[[NSURLSession sharedSession]
        uploadTaskWithRequest:request
                     fromFile:fileUrl
            completionHandler:^(NSData *_Nullable data,
                                NSURLResponse *_Nullable response,
                                NSError *_Nullable error) {
              NSString *str =
                  [[NSString alloc] initWithData:data
                                        encoding:NSUTF8StringEncoding];

              NSLog(@"--%@", str);
            }] resume];
}

// 获取授权的字符串
- (NSString *)getAuth:(NSString *)name pwd:(NSString *)pwd {
    // 拼字符串  admin:123456
    NSString *tmpStr = [NSString stringWithFormat:@"%@:%@", name, pwd];
    // base64编码
    tmpStr = [self base64Encode:tmpStr];

    // Basic YWRtaW46MTIzNDU2
    return [NSString stringWithFormat:@"Basic %@", tmpStr];
}

// base64编码
- (NSString *)base64Encode:(NSString *)str {
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:0];
}

@end
