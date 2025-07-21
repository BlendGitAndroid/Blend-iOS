//
//  CZAppView.h
//  01应用管理
//
//  Created by apple on 15/2/8.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CZApp;
@interface CZAppView : UIView

@property (nonatomic, strong) CZApp *model;


// 为自定义view封装一个类方法, 这个类方法的作用就是创建一个view对象
+ (instancetype)appView;
@end
