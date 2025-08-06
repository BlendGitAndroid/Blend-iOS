//
//  CZFriend.m
//  002好友列表
//
//  Created by apple on 15/3/6.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZFriend.h"

@implementation CZFriend

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)friendWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end
