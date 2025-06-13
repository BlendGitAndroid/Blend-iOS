//
//  Student+itcast.m
//  Day08-ARC与分类
//
//  Created by apple on 15/11/10.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import "Student+itcast.h"

@implementation Student (itcast)
- (void)sayHi
{
    NSLog(@"我是分类itcast的sayHi");
}


- (void)setAge:(int)age
{

    
    [self setName:@"jack"];
    _age = age;
}

- (int)age
{
    return _age;
}

- (void)hehe
{
    
    NSLog(@"呵呵");
}
@end
