//
//  ViewController.m
//  07-PList的解析
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

    //    NSArray *array = [NSArray arrayWithContentsOfFile:<#(nonnull NSString
    //    *)#>]

    //    NSJSONSerialization
    //    NSPropertyListSerialization

    // 用于解析plist文件的类，它提供了一个类方法，可以将plist文件中的数据解析成OC对象
    // NSData *data = [NSData dataWithContentsOfFile:path];

    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/videos.plist"];
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
                    id plist =
                        [NSPropertyListSerialization propertyListWithData:data
                                                                  options:0
                                                                   format:0
                                                                    error:NULL];
                    NSLog(@"%@", plist);
                    NSLog(@"%@", [plist class]);
                } else {
                    NSLog(@"服务器内部错误");
                }
              }];
}

@end
