//
//  HMNavigationController.m
//  07-彩票-基本框架
//
//  Created by Romeo on 15/12/15.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMNavigationController.h"

@interface HMNavigationController ()

@end

@implementation HMNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 创建导航栏外观配置
    if (@available(iOS 13.0, *)) {
        UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
        
        // 1. 设置背景颜色
        [appearance configureWithOpaqueBackground];
        appearance.backgroundColor = [UIColor redColor];
        
        // 2. 设置标题文字属性
        appearance.titleTextAttributes = @{
            NSForegroundColorAttributeName: [UIColor whiteColor],
            NSFontAttributeName: [UIFont systemFontOfSize:17]
        };
        
        // 3. 设置大标题文字属性（如果有）
        appearance.largeTitleTextAttributes = @{
            NSForegroundColorAttributeName: [UIColor whiteColor]
        };
        
        // 4. 应用到导航栏
        self.navigationBar.standardAppearance = appearance;
        self.navigationBar.scrollEdgeAppearance = appearance;
        if (@available(iOS 15.0, *)) {
            self.navigationBar.compactScrollEdgeAppearance = appearance;
        }
    } else {
        // 设置导航栏图片
        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    }


    // 设置文字为白色
    [self.navigationBar setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor] }];

    // 设置渲染的颜色
    [self.navigationBar setTintColor:[UIColor whiteColor]];
}

// 状态栏颜色, 设置应用顶部状态栏的显示样式 ，包括时间、信号、电池等图标和文字的颜色
- (UIStatusBarStyle)preferredStatusBarStyle
{
    // - 状态栏的文字和图标会显示为 白色
    return UIStatusBarStyleLightContent;
}

// 以后只要使用这个 nav 去push 那么都隐藏tabbar
- (void)pushViewController:(UIViewController*)viewController animated:(BOOL)animated
{
    // 隐藏底部的 tabbar
    viewController.hidesBottomBarWhenPushed = YES;

    [super pushViewController:viewController animated:animated];
}

@end
