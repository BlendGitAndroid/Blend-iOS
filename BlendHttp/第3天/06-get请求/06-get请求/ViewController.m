//
//  ViewController.m
//  06-get请求
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

    [self get];
}

- (void)get {
    NSString *name = @"张三";
    NSString *pwd = @"zhang";

    NSString *strUrl =
        [NSString stringWithFormat:
                      @"http://127.0.0.1/php/login.php?username=%@&password=%@",
                      name, pwd];
    // 对汉字或者空格做百分号转义
    // 将 URL 中的特殊字符转换为百分号编码格式，确保 URL 能够正确传输。
    // 这是网络编程中的标准做法，特别是在处理包含中文或特殊字符的 URL 时必须使用。
    strUrl = [strUrl stringByAddingPercentEncodingWithAllowedCharacters:
                         [NSCharacterSet URLQueryAllowedCharacterSet]];

    // 当地址中出现空格或者汉字 url返回nil
    NSURL *url = [NSURL URLWithString:strUrl];

    NSURLRequest *request = [NSURLRequest requestWithURL:url];
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
