//
//  HMBlueViewController.m
//  07-通过 storyboard使用导航控制器
//
//  Created by Romeo on 15/11/30.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import "HMBlueViewController.h"

@interface HMBlueViewController ()

@end

@implementation HMBlueViewController

#pragma mark - 返回到制定控制器
- (IBAction)back2ZhiDing:(id)sender {
    
    // 1.获取指定的控制器
    NSArray *vcs = self.navigationController.viewControllers;
    
    // 2.返回到指定控制器
    [self.navigationController popToViewController:vcs[0] animated:YES];
    
    
}



@end
