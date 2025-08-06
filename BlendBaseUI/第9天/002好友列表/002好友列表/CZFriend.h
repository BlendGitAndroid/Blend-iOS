//
//  CZFriend.h
//  002好友列表
//
//  Created by apple on 15/3/6.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZFriend : NSObject
// 头像
@property (nonatomic, copy) NSString *icon;

// 昵称
@property (nonatomic, copy) NSString *name;

// 个性签名
@property (nonatomic, copy) NSString *intro;

// 是否是vip
@property (nonatomic, assign, getter = isVip) BOOL vip;


- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)friendWithDict:(NSDictionary *)dict;
@end
