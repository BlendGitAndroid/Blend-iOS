//
//  Person.m
//  Day11-Foundation框架
//
//  Created by apple on 15/11/14.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static id instance = nil;
    if(instance == nil)
    {
        instance = [super allocWithZone:zone];
    }
    return instance;
}

+ (instancetype)sharedPerson
{
    return [self new];
}
+ (instancetype)defaultPerson
{
    return [self new];
}


@end
