//
//  HMTabBar.m
//  07-彩票-基本框架
//
//  Created by Romeo on 15/12/15.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMTabBar.h"

@interface HMTabBarButton : UIButton

@end

@implementation HMTabBarButton

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
}

@end

@interface HMTabBar ()

@property (nonatomic, weak) UIButton* currentButton;

@end

@implementation HMTabBar

- (void)addButtonWithImage:(UIImage*)image andImageSel:(UIImage*)imageSel
{
    // 创建 btn
    HMTabBarButton* tabbarButton = [[HMTabBarButton alloc] init];

    // 设置 btn 的图片
    [tabbarButton setBackgroundImage:image forState:UIControlStateNormal];
    [tabbarButton setBackgroundImage:imageSel forState:UIControlStateSelected];

    // 监听 btn, UIControlEventTouchDown按下后监听
    [tabbarButton addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchDown];

    // 添加到自己上
    [self addSubview:tabbarButton];
}

// 点击 tabbar 上按钮的时候调用
- (void)tabBarButtonClick:(UIButton*)sender
{

    // 取消记录的按钮的选中状态
    self.currentButton.selected = NO;

    // 设置点击的按钮为选中状态
    sender.selected = YES;

    // 记录选中的按钮
    self.currentButton = sender;

    // 切换控制器
    //    self.selectedIndex = sender.tag;
    // 判断 block 是否有值(代理方法 是不是能够响应)
    if (self.tabbarButtonBlock) {
        // 2.执行 block(执行代理方法)
        self.tabbarButtonBlock(sender.tag);
    }
}

// 布局子视图
// layoutSubviews 是iOS开发中UIView类的一个重要方法，用于处理视图及其子视图的布局计算和位置调整。
// layoutSubviews 是UIView生命周期中的关键方法，负责：
// - 计算和设置视图内部所有子视图的frame（位置和大小）
// - 处理视图尺寸变化时的布局更新
// - 实现自定义布局逻辑
// ### 调用时机
// 系统会在以下情况自动调用此方法：
// 1. 视图的frame（位置或大小）发生变化
// 2. 视图的bounds发生变化
// 3. 视图添加到新的父视图中
// 4. 调用视图的 setNeedsLayout 方法后（在下一个布局周期）
// 5. 调用视图的 layoutIfNeeded 方法时
// 6. 旋转设备时
// 7. 滚动UIScrollView时
// ### 使用场景
// 在自定义视图开发中，通常需要重写此方法来：
// 1. 精确控制子视图的布局位置和大小
// 2. 实现非标准的布局算法
// 3. 根据父视图或内容动态调整子视图
// ### 实现注意事项
// 重写此方法时应遵循以下规则：
// 1. 必须先调用 [super layoutSubviews] 以确保父类的布局逻辑执行
// 2. 避免在layoutSubviews中修改视图的frame、bounds等可能再次触发layoutSubviews的属性
// 3. 尽量保持此方法简洁高效，避免复杂计算
// 4. 如需触发布局更新，应调用 setNeedsLayout 而非直接调用 layoutSubviews
- (void)layoutSubviews
{
    [super layoutSubviews];

    for (int i = 0; i < self.subviews.count; ++i) {

        // 获取 button
        UIButton* tabbarButton = self.subviews[i];

        // 设置 tag 切换控制器
        tabbarButton.tag = i;

        // 计算按钮的 frame
        CGFloat w = kScreenWidth / 5;
        CGFloat h = 49;
        CGFloat x = i * w;
        CGFloat y = 0;

        tabbarButton.frame = CGRectMake(x, y, w, h);

        // 点一下第一个按钮
        if (i == 0) {
            // 主动调用第一个按钮
            [self tabBarButtonClick:tabbarButton];
        }
    }
}

@end
