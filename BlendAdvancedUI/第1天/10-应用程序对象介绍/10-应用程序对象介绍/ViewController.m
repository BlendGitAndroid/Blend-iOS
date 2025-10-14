//
//  ViewController.m
//  10-应用程序对象介绍
//
//  Created by Romeo on 15/11/29.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (IBAction)btnClick:(UIButton *)sender {
/**
 1. UIApplication 类型的对象 主要是执行应用级别的操作
 2. 应用程序对象的获取 [UIApplication sharedApplication]
 */
    UIApplication *app = [UIApplication sharedApplication];
    
//    UIApplication *app2 = [UIApplication sharedApplication];
//    
//    NSLog(@"\n%@ \n %@", app, app2);
    
    
    /**
      set to 0 to hide. default is 0. In iOS 8.0 and later, your application must register for user notifications using -[UIApplication registerUserNotificationSettings:] before being able to set the icon badge.
     */
    // 应用头像上的数字 默认情况下为0 ,没有数字
    // 如果不是0 就会显示出来
    
    // 需要注册一个通知，并取得用户同意
    UIUserNotificationCategory *category = [[UIUserNotificationCategory alloc] init];
    NSSet *set = [NSSet setWithObject:category];
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:set];

    
    [app registerUserNotificationSettings:settings];
    
    app.applicationIconBadgeNumber = 10;
    
    // 联网状态指示器
    app.networkActivityIndicatorVisible = YES;
    
    // openURL: 打电话/发短信/邮件/跳转到其他应用里面
    
    // View controller-based status bar appearance，需要在info.plist文件中新增该
    // 属性并设置为该属性为NO
    // 状态栏的管理，全局统一的状态栏管理，不需要依靠下面的perfersStatusBarHidden方法来操作
    app.statusBarHidden = YES;
    
}

//- (BOOL)prefersStatusBarHidden {
//
//    return YES;
//}








@end
