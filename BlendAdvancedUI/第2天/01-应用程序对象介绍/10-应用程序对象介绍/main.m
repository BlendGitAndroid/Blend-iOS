//
//  main.m
//  10-应用程序对象介绍
//
//  Created by Romeo on 15/11/29.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
/**
 Even though an integer return type is specified, this function never returns.
 Availability
 虽然指定返回值类型为int,但是这个方法永远不会返回
 */
/**
 应用启动过程:
    1>　入口，main.m main 函数
    2>  创建自动释放池
    3>  执行UIApplicationMain 永远不会返回,保证程序不会销毁
    4>  第三个参数 nil : 相当于应用程序类字符串 @"UIApplication"  创建一个应用程序对象
    5>  根据第四个参数:创建应用程序代理对象,并且将这个代理对象设置为应用程序对象的代理.
    6>  将应用程序代理对象内的window实例化,并且设置为应用程序的keyWindow[主窗口].
    7>  最后加载配置文件中指定的storyboard[Main.storyboard]文件中带箭头的控制器
 */

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, @"UIApplication", NSStringFromClass([AppDelegate class]));
    }
}
