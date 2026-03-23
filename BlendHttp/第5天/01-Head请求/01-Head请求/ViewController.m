//
//  ViewController.m
//  01-Head请求
//
//  Created by Apple on 15/10/25.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //**作为方法的参数的含义

    // Do any additional setup after loading the view, typically from a nib.
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/abc.hm"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"head";

    // NULL  nil 的区别
    // NULL的本质是：((void*)0)  其实就是空地址，将0强转成了（void*）
    // nil 的本质是 NULL，
    // [NSNull null];  //数组中可以存储空值
    // nil → Objective-C 对象指针的"空"
    // NULL → C 指针的"空"
    // NSNull → 集合中表示"空值"的对象，在数组中或者字典中表示空
    // 原则：什么类型的指针就用对应的空值表示

    //    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    //    [dic setObject:nil forKey:@"k1"];
    //    [dic setObject:nil forKey:@"k2"];
    //
    //    [dic setObject:[NSNull null] forKey:@"k3"];
    //    NSLog(@"%@",dic);

    // 发送同步请求
    // 设置同步请求的返回参数
    NSURLResponse *response = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
                                                     error:NULL];
    NSLog(@"-- %@", data);
    NSLog(@"%@", response);

    // 发送异步请求

    //    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/abc.hm"];
    //    NSMutableURLRequest *request = [NSMutableURLRequest
    //    requestWithURL:url];
    request.HTTPMethod = @"head";

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
                    NSLog(@"-- %@", data);
                    NSLog(@"response head : %@", response);

                    // 服务器返回的文件大小
                    NSLog(@"%zd", response.expectedContentLength);

                    // 服务器返回的文件名
                    NSLog(@"fileName:%@", response.suggestedFilename);

                } else {
                    NSLog(@"服务器内部错误");
                }
              }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 当参数是地址的时候，  输出结果  -- 输出参数
    int m;
    int m1;
    [self getMaxAndMin:@[ @(100), @(200), @(99), @(250), @(110) ]
                   max:&m
                   min:&m1];

    NSLog(@"max : %d   min: %d", m, m1);

    NSString *s = nil;
    [self demo:&s];
    NSLog(@"%@", s);
}

- (void)demo:(NSString **)str {
    *str = @"abc"; // 修改了str指针指向的地址中的值
}

// 求数组中的最大值，最小值，(平均值)
//
- (void)getMaxAndMin:(NSArray *)array max:(int *)max min:(int *)min {
    // 假设数组中的第一个数是最大值
    *max = [array[0] intValue]; // 修改了max指针指向的地址中的值
    *min = [array[0] intValue]; // 修改了min指针指向的地址中的值
    for (NSNumber *num in array) {
        //         ↑
        // 这个 * 是类型声明的一部分，表示 "num 是指向 NSNumber 的指针"
        // 不是指针操作符
        if (*max < num.intValue) {
            *max = num.intValue;
        }

        if (*min > num.intValue) {
            *min = num.intValue;
        }
    }
}

// "声明看类型，使用看层级"

// 声明时：* 是类型的一部分，表示"指针类型"
// 使用时：* 是操作符，表示"解引用一层"

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
