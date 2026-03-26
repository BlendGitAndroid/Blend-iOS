//
//  ViewController.m
//  07-网易新闻
//
//  Created by dream on 15/12/12.
//  Copyright © 2015年 dream. All rights reserved.
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
    // 跳转的原理
    // 每个应用程序都可注册一些标识符, 只要程序运行过一次,
    // 系统就会记住标识符和这个程序之间的关系

    // iOS中是根据协议头来识别应用程序的

    // URL:
    // 协议头: http:// https:// ftp:// file://
    // 路径: www.baidu.com /  www.itcast.cn

    // URL Scheme : 相当于协议头
    // 1. 需要添加URL Scheme : 项目--> tagert --> info --> URL Types --> 添加
    // (不需要加"://")
    // 2. 需要调用方法来跳转

    NSURL *url = [NSURL URLWithString:@"weixin5://"];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
    }
}

- (IBAction)timelineClick:(id)sender {
    NSURL *url = [NSURL URLWithString:@"weixin5://timeline.news"];
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
}

- (IBAction)sessionClick:(id)sender {
    NSURL *url = [NSURL URLWithString:@"weixin5://session.news"];
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
}

@end
