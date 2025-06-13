//
//  Dog.m
//  Day05-特有语法
//
//  Created by 传智播客 on 15/9/16.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "Dog.h"

@implementation Dog
- (instancetype)init
{
    if(self = [super init])
    {
        self.name = @"旺财";
        self.age = 1;
    }
    return self;
}

- (void)shout
{
    NSLog(@"汪汪...");
}


- (instancetype)initWithName:(NSString *)name andAge:(int)age
{
    if(self = [super init])
    {
        self.name = name;
        self.age = age;
    }
    return self;
}

@end
