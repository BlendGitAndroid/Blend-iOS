//
//  ViewController.m
//  09-JSON序列化
//
//  Created by Apple on 15/10/23.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"
#import "HMVideo.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // 1 自己拼json形式的字符串，比较困难
    //    NSString *jsonStr = @"{\"name\":\"zhangsan\",\"age\":18}";
    //    [self postJSON:[jsonStr dataUsingEncoding:NSUTF8StringEncoding]];

    // 2 字典
    //    NSDictionary *dic = @{@"name":@"zhangsan",@"age":@(18)};
    //    //JSON序列化
    //    NSData *data = [NSJSONSerialization dataWithJSONObject:dic options:0
    //    error:NULL];
    //    [self postJSON:data];

    // 3 数组
    //    NSArray *array = @[
    //                      @{@"name":@"zhangsan",@"age":@(18)},
    //                      @{@"name":@"lisi",@"age":@(19)}
    //                      ];
    //    //JSON序列化
    //    NSData *data = [NSJSONSerialization dataWithJSONObject:array options:0
    //    error:NULL]; [self postJSON:data];

    // 4 自定义对象进行JSON序列化
    //    HMVideo *v1 = [[HMVideo alloc] init];
    //    v1.videoName = @"ll-001.avi";
    //    v1.size = 500;
    //    v1.author = @"lilei";
    //    //KVC给对象内部的成员变量赋值
    //    [v1 setValue:@(NO) forKey:@"_isYellow"];
    //
    //
    ////    NSLog(@"%@",v1);
    //    //自定义对象不能进行JSON序列化， 必须先把自定义对象转换成字典或数组
    ////    if (![NSJSONSerialization isValidJSONObject:v1]) {
    ////        NSLog(@"sorry，对象不能进行json序列化");
    ////        return;
    ////    }
    //
    //    //把自定义对象转换成字典 KVC
    //    NSDictionary *dic = [v1
    //    dictionaryWithValuesForKeys:@[@"videoName",@"size",@"author",@"_isYellow"]];
    //
    //    NSData *data = [NSJSONSerialization dataWithJSONObject:dic options:0
    //    error:NULL]; [self postJSON:data];

    // 5 把自定义对象的数组 进行JSON序列化
    HMVideo *v1 = [[HMVideo alloc] init];
    v1.videoName = @"ll-001.avi";
    v1.size = 500;
    v1.author = @"lilei";
    // KVC给对象内部的成员变量赋值
    [v1 setValue:@(YES) forKey:@"_isYellow"];

    HMVideo *v2 = [[HMVideo alloc] init];
    v2.videoName = @"hmm-001.avi";
    v2.size = 500;
    v2.author = @"韩梅梅";
    // KVC给对象内部的成员变量赋值
    // KVC 是 Foundation 框架提供的机制
    // 允许通过字符串键名来访问对象的属性和实例变量
    // 绕过正常的属性访问方法，直接操作内部数据
    [v2 setValue:@(NO) forKey:@"_isYellow"];

    NSArray *array = @[ v1, v2 ];

    // 判断下一个对象能否进行JSON序列化，必须是数组或字典，且数组或字典内部的元素必须是字符串、数字、布尔值、null、数组或字典
    //    if (![NSJSONSerialization isValidJSONObject:array]) {
    //        NSLog(@"sorry,不能进行JSON序列化");
    //        return;
    //    }

    // 把自定义对象的数组，所有的对象都转换成字典
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:2];
    for (HMVideo *video in array) {
        // 把自定义对象转换成字典 KVC
        NSDictionary *dic = [video dictionaryWithValuesForKeys:@[
            @"videoName", @"size", @"author", @"_isYellow"
        ]];
        [mArray addObject:dic];
    }

    NSData *data = [NSJSONSerialization dataWithJSONObject:mArray
                                                   options:0
                                                     error:NULL];
    [self postJSON:data];
}

- (void)postJSON:(NSData *)data {
    NSURL *url =
        [NSURL URLWithString:@"http://127.0.0.1/php/upload/postjson.php"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // 设置post
    request.HTTPMethod = @"post";
    request.HTTPBody = data; // 直接是二进制数据

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
                    NSString *str =
                        [[NSString alloc] initWithData:data
                                              encoding:NSUTF8StringEncoding];
                    NSLog(@"%@", str);
                } else {
                    NSLog(@"服务器内部错误");
                }
              }];
}

@end
