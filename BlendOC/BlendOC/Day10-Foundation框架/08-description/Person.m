//
//  Person.m
//  Day10-Foundation框架
//
//  Created by apple on 15/11/13.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import "Person.h"

@implementation Person

- (NSString *)description
{
    return [NSString stringWithFormat:@"姓名:%@ 年龄:%d",_name,_age];
}

@end
