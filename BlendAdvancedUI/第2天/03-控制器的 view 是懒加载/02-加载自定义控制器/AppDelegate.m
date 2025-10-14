//
//  AppDelegate.m
//  02-加载自定义控制器
//
//  Created by Romeo on 15/11/30.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import "AppDelegate.h"
#import "HMViewController.h"

@interface AppDelegate ()

@end


/**
* 通过查看项目代码，我找到了控制器view懒加载项目运行后界面显示红色的原因：

1. 1.
   关键原因 ：AppDelegate.m中覆盖了HMViewController设置的背景色
2. 2.
   执行流程分析 ：
   - 在AppDelegate.m中，代码首先创建了HMViewController实例： HMViewController *hmVc = [[HMViewController alloc] init];
   - 紧接着直接访问了 hmVc.view 属性并设置其背景色为红色： hmVc.view.backgroundColor = [UIColor redColor];
   - 这一访问触发了UIViewController的view懒加载机制，系统会调用 loadView 和 viewDidLoad 方法
   - 在 viewDidLoad 方法中，HMViewController确实将背景色设置为了绿色： self.view.backgroundColor = [UIColor greenColor];
   - 但在AppDelegate中，在设置完rootViewController之前，再次设置了view的背景色为红色，这覆盖了HMViewController中的设置
3. 3.
   技术要点 ：这很好地展示了UIViewController的view懒加载机制 - 只有当第一次访问view属性时，才会触发loadView和viewDidLoad方法的调用。
*/
@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 1.创建窗口并且指定大小
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    // 2.设置窗口的根控制器
    // 2.1创建控制器
    HMViewController *hmVc = [[HMViewController alloc] init];
    
    hmVc.view.backgroundColor = [UIColor redColor];
    
    // 2.2设置为窗口的根控制器
    self.window.rootViewController = hmVc;
    
    
    // 3.将窗口作为应用程序的主窗口 并 可见[Visible]
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
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
