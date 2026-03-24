//
//  ViewController.m
//  01-Session的演示
//
//  Created by Apple on 15/10/26.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self dataTask3];
}

// 发送post请求
- (void)dataTask3 {
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/php/login.php"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"post";
    NSString *body = @"username=123&password=123";
    request.HTTPBody = [body dataUsingEncoding:NSUTF8StringEncoding];

    [[[NSURLSession sharedSession]
        dataTaskWithRequest:request
          completionHandler:^(NSData *_Nullable data,
                              NSURLResponse *_Nullable response,
                              NSError *_Nullable error) {
            id json = [NSJSONSerialization JSONObjectWithData:data
                                                      options:0
                                                        error:NULL];
            NSLog(@"%@", json);
          }] resume];
}

// 简化的代码
- (void)dataTask2 {
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/demo.json"];

    [[[NSURLSession sharedSession]
          dataTaskWithURL:url
        completionHandler:^(NSData *_Nullable data,
                            NSURLResponse *_Nullable response,
                            NSError *_Nullable error) {
          id json = [NSJSONSerialization JSONObjectWithData:data
                                                    options:0
                                                      error:NULL];
          NSLog(@"%@", json);
        }] resume];
}

// 获取JSON
- (void)dataTask1 {
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/demo.json"];

    NSURLSession *session = [NSURLSession sharedSession];
    // 任务默认都是挂起的
    NSURLSessionDataTask *dataTask =
        [session dataTaskWithURL:url
               completionHandler:^(NSData *_Nullable data,
                                   NSURLResponse *_Nullable response,
                                   NSError *_Nullable error) {
                 id json = [NSJSONSerialization JSONObjectWithData:data
                                                           options:0
                                                             error:NULL];
                 NSLog(@"%@", json);
               }];
    // 开始任务
    [dataTask resume];
}

@end
