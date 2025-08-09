//
//  HMFlagView.h
//  07-国旗选择
//
//  Created by Romeo on 15/11/29.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMFlag;
@interface HMFlagView : UIView

// 绑定一个模型用来设置数据
@property (nonatomic, strong) HMFlag *flag;

// 快速创建一个flagView界面
+ (instancetype)flagView;

// 返回这个xib的高度,供外界使用
+ (CGFloat)rowHeight;

@end
