//
//  ViewController.m
//  10-JSON保存到文件中
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

    // 把json数据保存到文件
    // @(18) 的作用就是将基本数据类型 int 18 转换为对象 NSNumber，因为：
    // NSDictionary/NSArray 只能存储对象
    // 基本数据类型（int、float、BOOL）不是对象
    // @() 提供了便捷的装箱语法
    // NSDictionary *dic = @{@"name" : @"zhangsan", @"age" : @(18)};
    // NSData *data = [NSJSONSerialization dataWithJSONObject:dic
    //                                                options:0
    //                                                  error:NULL];

    // [data writeToFile:@"/Users/xuhai/Desktop/111.json" atomically:YES];

    // 读取JSON文件
    NSData *data =
        [NSData dataWithContentsOfFile:@"/Users/xuhai/Desktop/111.json"];

    id json = [NSJSONSerialization JSONObjectWithData:data
                                              options:0
                                                error:NULL];
    NSLog(@"%@", json);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
