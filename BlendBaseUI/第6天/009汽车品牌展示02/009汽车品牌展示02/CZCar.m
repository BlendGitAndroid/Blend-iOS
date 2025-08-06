//
//  CZCar.m
//  009汽车品牌展示02
//
//  Created by apple on 15/2/28.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZCar.h"

@implementation CZCar

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        // KVC，意思是通过字典的key来设置对象的属性
        // kvc的参数一定是NSDictionary
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)carWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end






