//
//  AppDelegate.m
//  02-远程推送
//
//  Created by dream on 15/12/18.
//  Copyright © 2015年 dream. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //1. 设置要注册的通知类型 iOS8以后配置授权的
    UIUserNotificationType type = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    
    //2. 请求授权
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type categories:nil];
    
    //3. 注册授权请求
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    
    //4. 注册远程通知
    [[UIApplication sharedApplication] registerForRemoteNotifications];

    
    // 判断是否有远程推送的值
    if (launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey]) {
        // 获取通知的值, 进行处理
        
        NSDictionary *userInfo = launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey];
        
        UITextView *label = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
        label.text = [NSString stringWithFormat:@"userInfo:%@",launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey]];
        label.backgroundColor = [UIColor redColor];
        [self.window.rootViewController.view addSubview:label];
        
    }
    
    return YES;
}

#pragma mark 远程推送注册完毕, 服务器返回Token时, 就会调用此方法
//2. 获取Token
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    NSLog(@"deviceToken: %@", deviceToken);
}

#pragma mark 接受远程推送的消息
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    NSLog(@"userInfo: %@",userInfo);
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 375, 200)];
    label.text = userInfo.description;
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor redColor];
    [self.window.rootViewController.view addSubview:label];
}

@end
