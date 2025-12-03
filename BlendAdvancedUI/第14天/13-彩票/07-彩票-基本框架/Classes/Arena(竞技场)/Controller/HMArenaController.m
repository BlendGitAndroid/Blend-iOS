//
//  HMArenaController.m
//  07-彩票-基本框架
//
//  Created by Romeo on 15/12/15.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMArenaController.h"

@interface HMArenaController ()

@end

@implementation HMArenaController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // 设置控制器的背景图片(拉伸)
    // 直接在layer上设置背景图片，并进行格式转换
    // 为什么需要转换？
    // 因为 layer 上设置的背景图片 是 CGImage 类型的，而 UIImage 是基于 Quartz 2D 绘制的，两者的坐标系不同，需要将UIImage转换成CGImage
    // 但是转换后的CGImage是Core Graphics的，需要使用__bridge 进行桥接转换
    // __bridge 是 Core Foundation 框架提供的一个桥梁，用于在 Core Foundation 和 Core Graphics 之间进行类型转换
    self.view.layer.contents = (__bridge id)[UIImage imageNamed:@"NLArenaBackground"].CGImage;

    //    UIBarMetricsDefault, // 横屏显示 竖屏显示
    //    UIBarMetricsCompact, // 横屏显示 竖屏不显示
    //    UIBarMetricsDefaultPrompt = 101, // 竖屏有副标题显示 横屏有副标题不显示
    //    UIBarMetricsCompactPrompt, // 竖屏有副标题不显示 横屏有副标题显示

    // 设置 navbar 的图片
    if (@available(iOS 13.0, *)) {
        UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
        
        // 1. 设置背景颜色
        [appearance configureWithOpaqueBackground];
        appearance.backgroundImage = [UIImage imageNamed:@"NLArenaNavBar64"];
        
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
        self.navigationController.navigationBar.standardAppearance = appearance;
        self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
        if (@available(iOS 15.0, *)) {
            self.navigationController.navigationBar.compactScrollEdgeAppearance = appearance;
        }
    } else {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NLArenaNavBar64"] forBarMetrics:UIBarMetricsDefault];
    }

    // 获取 titleView
    UISegmentedControl* seg = (UISegmentedControl*)self.navigationItem.titleView;
    // 设置默认的背景图片
    [seg setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    // 设置选中的背景图片
    [seg setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];

    // 设置文字的颜色
    [seg setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor] } forState:UIControlStateNormal];
    [seg setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor] } forState:UIControlStateSelected];


    // 取消蓝色的线
    [seg setTintColor:[UIColor clearColor]];
}

@end
