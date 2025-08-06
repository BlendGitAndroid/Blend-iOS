//
//  CZGroup.h
//  002好友列表
//
//  Created by apple on 15/3/6.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZGroup : NSObject

// 组名
@property (nonatomic, copy) NSString *name;

// 在线人数
@property (nonatomic, assign) int online;

// 当前组中的所有的好友数据
@property (nonatomic, strong) NSArray *friends;

// 表示这个组是否可见
@property (nonatomic, assign, getter=isVisible) BOOL visible;


- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)groupWithDict:(NSDictionary *)dict;


@end








