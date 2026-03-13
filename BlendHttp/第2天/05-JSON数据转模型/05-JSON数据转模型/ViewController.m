//
//  ViewController.m
//  05-JSON数据转模型
//
//  Created by Apple on 15/10/20.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"
#import "HMMessage.h"
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
                    // 解析数据  JSON反序列化
                    NSError *error;

                    // 0 表示使用默认选项（不可变对象）
                    // 其他选项：
                    // NSJSONReadingMutableContainers - 创建可变容器
                    // NSJSONReadingMutableLeaves -
                    // 创建可变叶子节点（iOS7后无效）
                    // NSJSONReadingAllowFragments - 允许解析非完整JSON
                    NSDictionary *dic =
                        [NSJSONSerialization JSONObjectWithData:data
                                                        options:0
                                                          error:&error];
                    if (error) {
                        NSLog(@"JSON解析错误 %@", error);
                        return;
                    }
                    // 字典转模型
                    HMMessage *msg = [HMMessage messageWithDic:dic];
                    NSLog(@"%@", msg);

                } else {
                    NSLog(@"服务器内部错误");
                }
              }];
}

@end
