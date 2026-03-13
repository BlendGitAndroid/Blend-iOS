//
//  ViewController.m
//  01-发送请求
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

    // 第一种方式  获取网络数据  无法设置请求头  无法控制缓存  无法设置超时时长
    //    NSURL *url = [NSURL URLWithString:@"http://192.168.11.11/demo.json"];
    //    NSData *data = [NSData dataWithContentsOfURL:url];
    //    NSString *str = [[NSString alloc] initWithData:data
    //    encoding:NSUTF8StringEncoding]; NSLog(@"---%@",str);

    //    NSURLRequestUseProtocolCachePolicy = 0, //使用http协议的缓存策略
    //
    //    NSURLRequestReloadIgnoringLocalCacheData = 1, //忽略本地缓存
    //    加载最新数据

    //    NSURLRequestReturnCacheDataElseLoad = 2,
    //    //如果有缓存，返回缓存数据，否则重新加载
    //    NSURLRequestReturnCacheDataDontLoad = 3,
    //    //返回缓存数据，没有缓存也不加载网络数据

    // 第二种方式 获取网络数据
    // 通过NSURLRequest对象来获取网络数据，可以设置请求头，控制缓存，设置超时时长
    // NSMutableURLRequest表示可变的请求对象，可以设置请求头，控制缓存，设置超时时长
    // 默认的请求对象NSURLRequest是不可变的，无法设置请求头，控制缓存，设置超时时长
    // 默认的缓存策略是是NSURLRequestUseProtocolCachePolicy，默认的超时时长是60秒
    // NSURLRequestUseProtocolCachePolicy表示使用http协议的缓存策略，NSURLRequestReloadIgnoringLocalCacheData表示忽略本地缓存，加载最新数据，NSURLRequestReturnCacheDataElseLoad表示如果有缓存，返回缓存数据，否则重新加载，NSURLRequestReturnCacheDataDontLoad表示返回缓存数据，没有缓存也不加载网络数据
    NSURL *url = [NSURL URLWithString:@"http://192.168.111.11/demo.json"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:0
                                                       timeoutInterval:15];

    // 默认缓存策略 NSURLRequestUseProtocolCachePolicy   超时时长60秒
    //    [NSMutableURLRequest requestWithURL:url];

    // 设置请求头，拼写好http协议的请求头字段，值可以随意设置
    [request setValue:@"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) "
                      @"AppleWebKit/537.36 (KHTML, like Gecko) "
                      @"Chrome/42.0.2311.152 Safari/537.36"
        forHTTPHeaderField:@"User-Agent"];

    [NSURLConnection
        sendAsynchronousRequest:request
                          queue:[NSOperationQueue mainQueue]
              completionHandler:^(NSURLResponse *_Nullable response,
                                  NSData *_Nullable data,
                                  NSError *_Nullable connectionError) {
                // 获取服务器的响应体
                NSString *str =
                    [[NSString alloc] initWithData:data
                                          encoding:NSUTF8StringEncoding];
                NSLog(@"--%@", str);
                NSLog(@"error: %@", connectionError);
              }];
}

@end
