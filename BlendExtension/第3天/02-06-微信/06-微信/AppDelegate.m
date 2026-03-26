//
//  AppDelegate.m
//  06-微信
//
//  Created by dream on 15/12/12.
//  Copyright © 2015年 dream. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

#pragma mark 此方法用于处理应用间跳转的
- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:
                (NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options {
    // 1. 获取跟控制器, 执行跳转
    UINavigationController *nav =
        (UINavigationController *)[UIApplication sharedApplication]
            .keyWindow.rootViewController;
    // 主控制器
    UIViewController *mainVC = nav.childViewControllers[0];

    // 2. 回到根控制器
    [nav popToRootViewControllerAnimated:YES];

    // 1. 获取 URL
    NSString *URLStr = url.absoluteString;

    NSLog(@"URLStr: %@", URLStr);

    // 2. 判断是否包含指定的关键词
    if ([URLStr containsString:@"session"]) {
        // 如果包含了 session 关键词, 可以跳转到好友列表控制器
        [mainVC performSegueWithIdentifier:@"session" sender:nil];

        // 3. 根据关键词跳转指定的界面

    } else if ([URLStr containsString:@"timeline"]) {
        // 如果包含了 timeline 关键词, 可以跳转到朋友圈控制器

        // 3. 根据关键词跳转指定的界面
        [mainVC performSegueWithIdentifier:@"timeline" sender:nil];
    }

    return YES;
}

@end
