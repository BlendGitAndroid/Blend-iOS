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

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    /**
     UIRemoteNotificationTypeNone    = 0,
     UIRemoteNotificationTypeBadge   = 1 << 0,
     UIRemoteNotificationTypeSound   = 1 << 1,
     UIRemoteNotificationTypeAlert   = 1 << 2,
     */

    /**
     UIUserNotificationTypeNone    = 0,
     UIUserNotificationTypeBadge   = 1 << 0,
     UIUserNotificationTypeSound   = 1 << 1,
     UIUserNotificationTypeAlert   = 1 << 2,
     */

    /**
     iOS8和iOS7通知对比
     1. 多了一个授权的方法UIUserNotificationSettings
     2. 以前的方法中Remove换成了User
     */

    // 1.  注册远程推送 --> 就是将UDID , Bundle ID  发给苹果

    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 1. 设置要注册的通知类型 iOS8以后配置授权的
        UIUserNotificationType type = UIUserNotificationTypeBadge |
                                      UIUserNotificationTypeSound |
                                      UIUserNotificationTypeAlert;

        // 2. 请求授权
        UIUserNotificationSettings *settings =
            [UIUserNotificationSettings settingsForTypes:type categories:nil];

        // 3. 注册授权请求
        [[UIApplication sharedApplication]
            registerUserNotificationSettings:settings];

        // 4. 注册远程通知
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    } else {
        // 如果是iOS8以前
        // 1. 设置要注册的通知类型
        UIRemoteNotificationType type = UIRemoteNotificationTypeBadge |
                                        UIRemoteNotificationTypeSound |
                                        UIRemoteNotificationTypeAlert;

        // 2. 注册远程通知
        [[UIApplication sharedApplication]
            registerForRemoteNotificationTypes:type];
    }

    // 判断是否有远程推送的值
    //    if (launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey]) {
    //        // 获取通知的值, 进行处理
    //
    //        NSDictionary *userInfo =
    //        launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey][@"userInfo"];
    //
    //        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,
    //        375, 200)]; label.text = userInfo.description; label.numberOfLines
    //        = 0; [self.window.rootViewController.view addSubview:label];
    //
    //    }

    return YES;
}

#pragma mark 远程推送注册完毕, 服务器返回Token时, 就会调用此方法
// 2. 获取Token

// d97bb415 b60cf0f6 cb65d159 723ae81d d72ef745 9a338cae 4507090c 967ba762
// Token --> 一台手机上一个程序获取之后是不会变的. Bundle ID UDID
- (void)application:(UIApplication *)application
    didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSLog(@"deviceToken: %@", deviceToken);

    // 3. 将来要在这里将Token 发送给自己的服务器做保存
}

#pragma mark 接受远程推送的消息
// 远程推送和本地推送一样
// 都需要在两个地方做代码的处理
// 1. 接受到通知时的方法中
// 2. 启动时的代理方法中做设置

// 我们能否只写一次收到通知的逻辑处理代码呢?
- (void)application:(UIApplication *)application
    didReceiveRemoteNotification:(NSDictionary *)userInfo {

    // 要判断用户是否在前台
    if (application.applicationState == UIApplicationStateActive) {
        NSLog(@"不要自动跳转/ 给用户提示");
        return;
    }

    NSLog(@"userInfo: %@", userInfo);
    // 1. 获取推送的值
    NSInteger count = [userInfo[@"aps"][@"badge"] intValue];

    // 2.1 设置相关的属性
    application.applicationIconBadgeNumber = count;

    // 2.2 获取消息内容
    NSString *contenStr = userInfo[@"aps"][@"alert"];
    NSLog(@"contenStr : %@", contenStr);
    // 将来自己对这个字符串做截取操作, 处理相关的业务逻辑

    // 3. 将来需要取消角标的数字, 是根据用户是否做了某些操作, 来标记数字角标的值
}

#pragma mark 接受远程推送的消息
// 前台/后台/应用程序退出  三种情况下都可以收到消息
// 需要配置一个值, 在项目--> Target
// 如果实现了此方法, 那么上面的方法将会弃用, 此时,
// 也就不需要在程序启动的代理方法中写代码了
- (void)application:(UIApplication *)application
    didReceiveRemoteNotification:(NSDictionary *)userInfo
          fetchCompletionHandler:
              (void (^)(UIBackgroundFetchResult))completionHandler {
    NSLog(@"userInfo: %@", userInfo);

    // 1. 获取通知的值进行逻辑处理
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 375, 200)];
    label.text = userInfo.description;
    label.numberOfLines = 0;
    [self.window.rootViewController.view addSubview:label];

    // 2. 调用block, 应该传入一个结果值
    /**
     UIBackgroundFetchResultNewData,
     UIBackgroundFetchResultNoData,
     UIBackgroundFetchResultFailed
     */
    completionHandler(UIBackgroundFetchResultNewData);
}

@end
