//
//  ViewController.m
//  02-距离传感器
//
//  Created by dream on 15/12/22.
//  Copyright © 2015年 dream. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1. 开启距离传感器
    [UIDevice currentDevice].proximityMonitoringEnabled = YES;
    
    //2. 注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(proximityStateDidChangeNotification) name:UIDeviceProximityStateDidChangeNotification object:nil];
}

#pragma mark 通知的方法
- (void)proximityStateDidChangeNotification {
    //3. 获取通知的值
    if ([UIDevice currentDevice].proximityState) {
        NSLog(@"有逗比靠近");
    } else {
        NSLog(@"逗比被吓跑了");
    }
}

@end
