//
//  Book.m
//  Day07-内存管理
//
//  Created by apple on 15/11/9.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import "Book.h"

@implementation Book

- (void)dealloc
{
    NSLog(@"书被烧了.");
    [_name release];
    [_authorName release];
    [super dealloc];
}

/**
 *  传播知识的方法
 */
- (void)castZhiShi
{
    NSLog(@"书中自有黄金屋,书中自有颜如玉!");
}

@end
