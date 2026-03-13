//
//  ViewController.m
//  03-JSON
//
//  Created by Apple on 15/10/20.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/demo.json"];
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
                    // 解析数据   data  JSON形式的字符串

                    // JSON序列化  把对象转换成JSON形式的字符串
                    // JSON的反序列化      把JSON形式的字符串转换成OC中的对象

                    NSError *error;

                    // 解析的JSON字符串，返回的OC对象可能是数组或字典
                    // json 变量的类型是 id，具体运行时类型取决于 JSON 结构，最常见的是 NSDictionary 或 NSArray。
                    // 返回的数据，即是可变的，还是不可变的，取决于 options 参数的设置。
                    // NSJSONReadingOptions options = 0; 不可变的数组和字典
                    // NSJSONReadingMutableContainers = (1UL << 0),  // 容器可变
                    id json = [NSJSONSerialization JSONObjectWithData:data
                                                              options:0
                                                                error:&error];
                    if (error) {
                        NSLog(@"解析JSON出错 %@", error);
                        return;
                    }

                    //            NSLog(@"%@",[json class]);
                    //            //解析
                    //            NSLog(@"--%@",[json[@"message"] class]);

                    NSLog(@"%@", json);

                    //            NSJSONReadingMutableContainers = (1UL << 0),
                    //            容器可变 NSJSONReadingMutableLeaves = (1UL <<
                    //            1),  叶子可变，但是iOS7以后不起作用
                    //            NSJSONReadingAllowFragments = (1UL << 2)
                    //            允许不是JSON形式的字符串

                } else {
                    NSLog(@"服务器内部错误");
                }
              }];
}

@end
