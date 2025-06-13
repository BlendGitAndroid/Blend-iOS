//
//  Person.m
//  Day07-内存管理
//
//  Created by apple on 15/11/9.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import "Person.h"
#import "Book.h"

@implementation Person
- (void)dealloc
{
    NSLog(@"人死了");
    [_name release];
    [_book release];
    [super dealloc];
}

/**
 *  人的读书的方法.
 */
- (void)read
{
    //1. 让自己拥有的数传播知识.
   [_book  castZhiShi];
    //2. 自己吸收.
    NSLog(@"啊,好知识!");
}

@end
