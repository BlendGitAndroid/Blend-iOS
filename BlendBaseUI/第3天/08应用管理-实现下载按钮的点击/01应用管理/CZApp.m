//
//  CZApp.m
//  01应用管理
//
//  Created by apple on 15/2/8.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZApp.h"

@implementation CZApp


- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.name = dict[@"name"];
        self.icon = dict[@"icon"];
    }
    return self;
}

+ (instancetype)appWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end
