//
//  ViewController.m
//  06-JSONKit
//
//  Created by Apple on 15/10/20.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"
#import "JSONKit.h"
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
                    // 解析数据

                    id json = [[JSONDecoder decoder] objectWithData:data];
                    NSLog(@"%@", json);
                    NSLog(@"%@", [json class]);
                } else {
                    NSLog(@"服务器内部错误");
                }
              }];
}

@end
