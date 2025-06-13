//
//  Person.m
//  Day08-ARC与分类
//
//  Created by apple on 15/11/10.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import "Person.h"

@implementation Person
{
    int _age;
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
