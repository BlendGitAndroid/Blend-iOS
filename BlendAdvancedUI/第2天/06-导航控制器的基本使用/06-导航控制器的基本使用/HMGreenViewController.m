//
//  HMGreenViewController.m
//  06-导航控制器的基本使用
//
//  Created by Romeo on 15/11/30.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import "HMGreenViewController.h"
#import "HMBlueViewController.h"

@interface HMGreenViewController ()

@end

@implementation HMGreenViewController


- (IBAction)back2RedVc:(id)sender {
    
    // 返回上一级
    [self.navigationController popViewControllerAnimated:YES];
    
}



#pragma mark - 跳转到蓝色控制器
- (IBAction)go2BlueVc:(id)sender {
    
    // 1. 创建蓝色控制器
    HMBlueViewController *blueVc = [[HMBlueViewController alloc] init];
    
    // 2. 执行跳转
    [self.navigationController pushViewController:blueVc animated:YES];
    
    
}




@end
