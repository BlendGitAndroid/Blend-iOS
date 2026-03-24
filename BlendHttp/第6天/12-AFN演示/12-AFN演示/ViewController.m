//
//  ViewController.m
//  12-AFN演示
//
//  Created by Apple on 15/10/26.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"
#import "AFHTTPRequestOperationManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self post2];
}
- (void)post2 {
    // 获取要上传文件的路径
    NSURL *url1 = [[NSBundle mainBundle] URLForResource:@"06.jpg"
                                          withExtension:nil];
    NSURL *url2 = [[NSBundle mainBundle] URLForResource:@"01.jpg"
                                          withExtension:nil];

    [[AFHTTPRequestOperationManager manager]
        POST:@"http://127.0.0.1/php/upload/upload-m.php"
        parameters:@{@"username" : @"zhangsan"}
        // 发送文件，AFN会把文件封装成一个二进制数据，放在请求体中发送给服务器
        constructingBodyWithBlock:^(id<AFMultipartFormData> _Nonnull formData) {
          // 上传文件,userfile[]是服务器接收文件的字段，url1和url2是要上传文件的路径
          // name 参数的作用：
          // ✅ 字段标识符：告诉服务器这个文件对应哪个表单字段
          // ✅ 服务器接收：服务器通过这个名称获取上传的文件，也就是为了区分不同的文件，比如上传文件时，服务器可能会有多个字段来接收不同类型的文件，比如头像、背景图等，通过 name 参数可以区分这些字段
          // ✅ 数据组织：不同的 name 可以上传不同类型/用途的文件
          // ✅ 数组支持：使用 [] 后缀支持多文件上传
          [formData appendPartWithFileURL:url1 name:@"userfile[]" error:nil];
          [formData appendPartWithFileURL:url2 name:@"userfile[]" error:nil];
        }
        success:^(AFHTTPRequestOperation *_Nonnull operation,
                  id _Nonnull responseObject) {
          NSLog(@"%@", responseObject);
        }
        failure:^(AFHTTPRequestOperation *_Nullable operation,
                  NSError *_Nonnull error) {
          NSLog(@"%@", error);
        }];
}

// 演示post请求
- (void)post1 {
    [[AFHTTPRequestOperationManager manager]
        POST:@"http://127.0.0.1/php/login.php"
        parameters:@{@"username" : @"abcd", @"password" : @"lalala"}
        success:^(AFHTTPRequestOperation *_Nonnull operation,
                  id _Nonnull responseObject) {
          NSLog(@"%@", responseObject);
        }
        failure:^(AFHTTPRequestOperation *_Nullable operation,
                  NSError *_Nonnull error) {
          NSLog(@"%@", error);
        }];
}

// 发送get请求，传参数
- (void)get2 {
    [[AFHTTPRequestOperationManager manager]
        GET:@"http://127.0.0.1/php/login.php"
        parameters:@{@"username" : @"abc", @"password" : @"123"}
        success:^(AFHTTPRequestOperation *_Nonnull operation,
                  id _Nonnull responseObject) {
          NSLog(@"%@", responseObject);
        }
        failure:^(AFHTTPRequestOperation *_Nullable operation,
                  NSError *_Nonnull error) {
          NSLog(@"%@", error);
        }];
}
// 发送get请求
- (void)get1 {

    [[AFHTTPRequestOperationManager manager] GET:@"http://127.0.0.1/demo.json"
        parameters:nil
        success:^(AFHTTPRequestOperation *_Nonnull operation,
                  id _Nonnull responseObject) {
          NSLog(@"%@", responseObject);
          // 这里拿到的responseObject是一个字典，因为AFN默认会把服务器返回的json数据解析成字典
          NSLog(@"%@", [responseObject class]);
        }
        failure:^(AFHTTPRequestOperation *_Nullable operation,
                  NSError *_Nonnull error) {
          NSLog(@"%@", error);
        }];
}

@end
