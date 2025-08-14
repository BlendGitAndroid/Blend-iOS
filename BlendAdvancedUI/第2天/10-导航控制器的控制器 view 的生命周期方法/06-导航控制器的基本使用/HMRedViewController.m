//
//  HMRedViewController.m
//  06-导航控制器的基本使用
//
//  Created by Romeo on 15/11/30.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import "HMRedViewController.h"
#import "HMGreenViewController.h"

@interface HMRedViewController ()

@end

@implementation HMRedViewController

- (IBAction)go2GreenVc:(UIButton *)sender {
    
    // 1.创建绿色控制器
    HMGreenViewController *greenVc = [[HMGreenViewController alloc] init];
    
    // 2.跳转
//    self.navigationController 获取当前控制器的导航控制器
    [self.navigationController pushViewController:greenVc animated:YES];
    
}



@end
