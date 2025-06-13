//
//  Person.m
//  Day03-封装
//
//  Created by 传智播客 on 20/7/4.
//  Copyright (c) 2020年 itcast. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)liuWithDog:(Dog *)dog
{
    NSLog(@"狗狗.你好走我们去散步...");
    dog->_name = @"大狗";
    [dog shout];
}

- (Dog *)makeADog
{
    Dog *d1 = [Dog new];
    return d1;
}
@end
