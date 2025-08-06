//
//  CZGroup.m
//  05展示汽车品牌
//
//  Created by apple on 15/2/28.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZGroup.h"

@implementation CZGroup

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        //self.title = dict[@"title"];
        //self.desc = dict[@"desc"];
        //self.cars = dict[@"cars"];
        // KVC，意思是通过字典的key来设置对象的属性
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}



+ (instancetype)groupWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}


@end
