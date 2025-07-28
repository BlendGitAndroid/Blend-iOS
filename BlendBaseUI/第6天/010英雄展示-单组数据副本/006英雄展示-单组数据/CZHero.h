//
//  CZHero.h
//  006英雄展示-单组数据
//
//  Created by apple on 15/2/28.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZHero : NSObject
// 头像图片
@property (nonatomic, copy) NSString *icon;

// 英雄简介
@property (nonatomic, copy) NSString *intro;

// 英雄名称
@property (nonatomic, copy) NSString *name;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)heroWithDict:(NSDictionary *)dict;

@end
