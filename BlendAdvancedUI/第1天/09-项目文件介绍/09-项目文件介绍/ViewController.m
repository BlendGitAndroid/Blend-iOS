//
//  ViewController.m
//  09-项目文件介绍
//
//  Created by Romeo on 15/11/29.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    HMTool SU
    // 获取项目的info.plist文件
    NSDictionary *dict = [NSBundle mainBundle].infoDictionary;
    
    HMLog(@"%@", dict);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
