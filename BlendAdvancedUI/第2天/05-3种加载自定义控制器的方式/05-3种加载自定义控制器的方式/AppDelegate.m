//
//  AppDelegate.m
//  05-3种加载自定义控制器的方式
//
//  Created by Romeo on 15/11/30.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import "AppDelegate.h"
#import "HMTableViewController.h"
#import "HMXibViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 1.创建 window
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    // 2.设置窗口的根控制器
////    > 需要先创建自定义控制器类
////    > 指定 xib 文件
//    // a 名称没有规律
////    HMXibViewController *xibVc = [[HMXibViewController alloc] initWithNibName:@"HMMMD" bundle:nil];
//    
//    // b 名称与控制器的类名相似
////    HMXibViewController *xibVc = [[HMXibViewController alloc] init];
//    
//    // c 名称与控制器雷鸣完全一致
//    HMXibViewController *xibVc = [[HMXibViewController alloc] init];
//    
//    self.window.rootViewController = xibVc;
    [self code];

    // 3.将窗口作为主窗口并可见
    [self.window makeKeyAndVisible];
    
    
    
    return YES;
}

#pragma mark - 通过纯代码创建控制器
- (void)code {
    
    HMTableViewController *tableVc = [[HMTableViewController alloc] init];
    self.window.rootViewController = tableVc;
    
}

#pragma mark - 通过 storyboard 创建控制器
- (void)storyboard {
    // A.加载 storyboard 文件
    UIStoryboard *hmboard = [UIStoryboard storyboardWithName:@"HMStoryboard" bundle:nil];
    
    // B.从 storyboard 文件中实例化控制器
    //    UIViewController *hmVc = [hmboard instantiateInitialViewController];
    //    self.window.rootViewController = hmVc;
    
    // 这个blue就是storyboardId，一个storyboard有多个controller，则通过这个id来区分加载哪一个controller
    UIViewController *hmVc2 = [hmboard instantiateViewControllerWithIdentifier:@"blue"];
    self.window.rootViewController = hmVc2;
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
