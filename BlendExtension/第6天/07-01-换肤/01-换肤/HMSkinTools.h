//
//  HMSkinTools.h
//  01-换肤
//
//  Created by dream on 15/12/19.
//  Copyright © 2015年 dream. All rights reserved.
//

#import <UIKit/UIKit.h>

//专门写常量值的

// 以下的格式, 只是对常量的声明
//extern: 代表其他类可以引用
extern NSString *const HMSkinToolLabelTextDayColor;
extern NSString *const HMSkinToolLabelBackgroundDayColor;


@interface HMSkinTools : NSObject


/** 返回对应的皮肤的图像*/
+ (UIImage *)imageWithImageName:(NSString *)imageName;

/** 保存皮肤信息*/
+ (void)saveSkinName:(NSString *)skinName;

/** 返回制定标识符所对应的颜色*/
+ (UIColor *)colorWithName:(NSString *)name;

@end
