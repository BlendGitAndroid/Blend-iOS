//
//  CZApp.m
//  003应用管理
//
//  Created by apple on 15/3/6.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZApp.h"

@implementation CZApp


- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)appWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
