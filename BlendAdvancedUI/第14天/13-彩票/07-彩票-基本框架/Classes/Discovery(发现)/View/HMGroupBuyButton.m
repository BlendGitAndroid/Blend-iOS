//
//  HMGroupBuyButton.m
//  07-彩票-基本框架
//
//  Created by Romeo on 15/12/16.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMGroupBuyButton.h"
#import "UIView+Frame.h"

@implementation HMGroupBuyButton

/**
* layoutSubviews 是iOS开发中UIView类的一个重要方法，用于处理视图及其子视图的布局计算和位置调整。
系统会在以下情况自动调用此方法：

1. 视图的frame（位置或大小）发生变化
2. 视图的bounds发生变化
3. 视图添加到新的父视图中
4. 调用视图的 setNeedsLayout 方法后（在下一个布局周期）
5. 调用视图的 layoutIfNeeded 方法时
6. 旋转设备时
7. 滚动UIScrollView时

在您的 HMGroupBuyButton 类中，重写 layoutSubviews 方法是为了自定义按钮内部 titleLabel 和 imageView 的布局，确保它们按照预期的方式排列。
*/
- (void)layoutSubviews
{
    [super layoutSubviews];

    // 交换 btn 内部控件的位置

    // 这里只设置x的位置
    // label x = 0  ------
    // 更改图片和文字的位置，确保文字在图片的左侧，默认是文字在图片的右侧
    self.titleLabel.x = 0;
    // imageView x = label.width   -------
    self.imageView.x = self.titleLabel.w;

    //  ------ ------ ------ ------ ------ ------ ------

    // label x = 0  ------

    //    // 获取 label 的 frame
    //    CGRect labelRect = self.titleLabel.frame;
    //    // 修改结构体
    //    labelRect.origin.x = 0;
    //    // 赋值
    //    self.titleLabel.frame = labelRect;

    // imageView x = label.width   -------

    //    // 获取 imageView 的 frame
    //    CGRect imageViewRect = self.imageView.frame;
    //    // 修改结构体
    //    imageViewRect.origin.x = labelRect.size.width;
    //    // 赋值
    //    self.imageView.frame = imageViewRect;
}

@end
