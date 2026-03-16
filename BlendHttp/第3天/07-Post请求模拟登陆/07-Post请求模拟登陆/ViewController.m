//
//  ViewController.m
//  07-Post请求模拟登陆
//
//  Created by Apple on 15/10/22.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self post];
}

- (void)post {
    NSString *strUrl = @"http://127.0.0.1/php/login.php";

    NSURL *url = [NSURL URLWithString:strUrl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // 发送post请求
    request.HTTPMethod = @"post";
    // 设置请求体
    NSString *body = @"username=123&password=abc";
    // 把字符串转换成NSData对象
    // 为什么要转换？
    // HTTP 协议要求：网络传输必须是二进制数据（NSData）
    // 字符串不能直接传输：NSString 需要先编码成字节数据
    request.HTTPBody = [body dataUsingEncoding:NSUTF8StringEncoding];

    [NSURLConnection
        sendAsynchronousRequest:request
                          queue:[NSOperationQueue mainQueue]
              completionHandler:^(NSURLResponse *_Nullable response,
                                  NSData *_Nullable data,
                                  NSError *_Nullable connectionError) {
                if (connectionError) {
                    NSLog(@"连接错误 %@", connectionError);
                    return;
                }

                //
                NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                if (httpResponse.statusCode == 200 ||
                    httpResponse.statusCode == 304) {
                    // 解析数据
                    NSDictionary *dic =
                        [NSJSONSerialization JSONObjectWithData:data
                                                        options:0
                                                          error:NULL];
                    NSLog(@"%@", dic);
                } else {
                    NSLog(@"服务器内部错误");
                }
              }];
}

@end
