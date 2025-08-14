//
//  HMGreenViewController.m
//  07-通过 storyboard使用导航控制器
//
//  Created by Romeo on 15/11/30.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import "HMGreenViewController.h"

@interface HMGreenViewController ()

@end

@implementation HMGreenViewController

#pragma mark - 返回到红色控制器
- (IBAction)back2Red:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
