//
//  Person.m
//  Day05-特有语法
//
//  Created by 传智播客 on 15/9/16.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)setWeight:(float)weight
{
    _weight = weight;
}

- (float)weight
{
    return _weight;
}

- (void)setName:(NSString *)name
{
    _name = name;
}

- (NSString *)name
{
    return _name;
}

- (void)setAge:(int)age
{
    _age = age;
}

- (int)age
{
    return _age;
}

@end
