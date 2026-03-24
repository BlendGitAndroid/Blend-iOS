//
//  ViewController.m
//  08-uploadTask
//
//  Created by Apple on 15/10/26.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSURLSessionTaskDelegate>
@property(weak, nonatomic) IBOutlet UIImageView *imageView;
@property(nonatomic, strong) NSURLSession *session;
@end

@implementation ViewController
// 懒加载
- (NSURLSession *)session {
    if (_session == nil) {
        NSURLSessionConfiguration *config =
            [NSURLSessionConfiguration defaultSessionConfiguration];
        //  [request setValue:[self getAuth:@"admin" pwd:@"123456"]
        //  forHTTPHeaderField:@"Authorization"];

        // 在这里统一设置HTTP请求头，所有通过这个session发出的请求都会带上这个请求头
        config.HTTPAdditionalHeaders =
            @{@"Authorization" : [self getAuth:@"admin" pwd:@"123456"]};

        // delegateQueue 的作用：
        // 决定 NSURLSessionDelegate 方法在哪个队列执行
        // 影响 UI 更新的方式和性能表现
        _session = [NSURLSession
            sessionWithConfiguration:config
                            delegate:self
                       delegateQueue:[NSOperationQueue mainQueue]];
    }
    return _session;
}

- (void)dealloc {
    NSLog(@"dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 上传 获取上传进度
    [self uploadTask1];
}
// 下载图片，并显示到界面
- (void)getImage {
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/uploads/head6.png"];
    // 创建session 指定的队列，决定了回调的block执行的线程
    [[self.session downloadTaskWithURL:url
                     completionHandler:^(NSURL *_Nullable location,
                                         NSURLResponse *_Nullable response,
                                         NSError *_Nullable error) {
                       // 回到主线程更新UI
                       //        dispatch_async(dispatch_get_main_queue(), ^{

                       NSData *data = [NSData dataWithContentsOfURL:location];
                       self.imageView.image = [UIImage imageWithData:data];
                       //        });
                     }] resume];
}

// 删除文件
- (void)deleteFile {
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/uploads/head1.png"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"delete";
    // 设置账号和密码
    //    [request setValue:[self getAuth:@"admin" pwd:@"123456"]
    //    forHTTPHeaderField:@"Authorization"];

    [[[NSURLSession sharedSession]
        dataTaskWithRequest:request
          completionHandler:^(NSData *_Nullable data,
                              NSURLResponse *_Nullable response,
                              NSError *_Nullable error) {
            NSString *str =
                [[NSString alloc] initWithData:data
                                      encoding:NSUTF8StringEncoding];
            // 204 状态码  执行成功，什么都不返回
            NSLog(@"-- %@", str);
            NSLog(@"%@", response);
          }] resume];
}

// 上传文件，获取上传进度
- (void)uploadTask1 {
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/uploads/123.jpg"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"put";
    // 设置账号和密码
    // Authorization: Basic YWRtaW46MTIzNDU2
    // YWRtaW46MTIzNDU2  admin:123456
    //    [request setValue:[self getAuth:@"admin" pwd:@"123456"]
    //    forHTTPHeaderField:@"Authorization"];

    // 本地文件
    NSURL *fileUrl = [[NSBundle mainBundle] URLForResource:@"01.jpg"
                                             withExtension:nil];

    //    [[self.session uploadTaskWithRequest:request fromFile:fileUrl]
    //    resume];
    [[self.session uploadTaskWithRequest:request
                                fromFile:fileUrl
                       completionHandler:^(NSData *_Nullable data,
                                           NSURLResponse *_Nullable response,
                                           NSError *_Nullable error) {
                         //        NSString *str = [[NSString alloc]
                         //        initWithData:data
                         //        encoding:NSUTF8StringEncoding];
                         NSLog(@"--上传完成%@", response);

                         // 让session对象无效，去除delegate的强引用-解决循环引用的问题

                         // 取消操作  session一旦
                         // invalidate之后，session无法再次使用
                         //        [self.session invalidateAndCancel];
                         //        //下载完成，再使session无效
                         ////        [self.session finishTasksAndInvalidate];
                         //        self.session = nil;
                       }] resume];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // 正确清理网络资源和避免内存泄漏
    [self.session finishTasksAndInvalidate];
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
