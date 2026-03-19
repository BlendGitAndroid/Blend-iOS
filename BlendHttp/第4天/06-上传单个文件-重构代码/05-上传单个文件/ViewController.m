//
//  ViewController.m
//  05-上传单个文件
//
//  Created by Apple on 15/10/23.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //    @"http://127.0.0.1/php/upload/upload.php"
    // 上传文件
    //    [self uploadFile];
    // 从沙盒中获取文件，这里是从Supporting Files中获取的
    // Supporting Files中的文件会被复制到沙盒中,所以可以通过NSBundle来获取路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"06.jpg"
                                                     ofType:nil];

    [self uploadFile:@"http://127.0.0.1/php/upload/upload.php"
           fieldName:@"userfile"
            filePath:path];
}

#define kBOUNDARY @"abc"

// web服务器默认都会有最大上传限制，超过这个限制就会报错
// 上传单个文件
- (void)uploadFile:(NSString *)urlString
         fieldName:(NSString *)fieldName
          filePath:(NSString *)filePath {
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // 设置post
    request.HTTPMethod = @"post";
    // 设置请求头 Content-Type:multipart/form-data;
    // boundary=----WebKitFormBoundarykERdvnmjDlWxWzHF
    [request setValue:[NSString
                          stringWithFormat:@"multipart/form-data; boundary=%@",
                                           kBOUNDARY]
        forHTTPHeaderField:@"Content-Type"];

    // 设置请求体
    request.HTTPBody = [self makeBody:fieldName filePath:filePath];

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
                    id json = [NSJSONSerialization JSONObjectWithData:data
                                                              options:0
                                                                error:NULL];
                    NSLog(@"%@", json);
                } else {
                    NSLog(@"服务器内部错误");
                }
              }];
}

//------WebKitFormBoundarykERdvnmjDlWxWzHF
// Content-Disposition: form-data; name="userfile"; filename="01.jpg"
// Content-Type: image/jpeg
//
// 文件的二进制数据
//------WebKitFormBoundarykERdvnmjDlWxWzHF--
// Content-Disposition中的"userfile" 就是给这个文件上传字段起的一个名字，方便服务器识别和处理。

// 搞个Body--请求体
- (NSData *)makeBody:(NSString *)fieldName filePath:(NSString *)filePath {
    NSMutableData *mData = [NSMutableData data];
    // 第一部分
    NSMutableString *mString = [NSMutableString string];
    [mString appendFormat:@"--%@\r\n", kBOUNDARY];
    // [filePath lastPathComponent]用于获取文件名
    // application/octet-stream 表示二进制数据流（任意的二进制文件）
    [mString
        appendFormat:
            @"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n",
            fieldName, [filePath lastPathComponent]];
    [mString appendString:@"Content-Type: application/octet-stream\r\n"];
    [mString appendString:@"\r\n"];

    [mData appendData:[mString dataUsingEncoding:NSUTF8StringEncoding]];
    // 第二部分
    // 加载文件， 从指定的文件路径读取文件内容，并将其转换为 NSData 对象
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    //
    [mData appendData:data];

    // 第三部分
    NSString *end = [NSString stringWithFormat:@"\r\n--%@--", kBOUNDARY];
    [mData appendData:[end dataUsingEncoding:NSUTF8StringEncoding]];
    return mData.copy;
}

@end
