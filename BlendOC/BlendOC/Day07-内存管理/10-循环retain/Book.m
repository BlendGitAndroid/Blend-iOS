//
//  Book.m
//  Day07-内存管理
//
//  Created by apple on 15/11/9.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import "Book.h"
#import "Person.h"

@implementation Book

- (void)dealloc
{
    
    [_name release];
    [_owner release];
    NSLog(@"书被烧了");
    [super dealloc];
}

- (void)castZhiShi
{
    NSLog(@"书中自有黄金屋,书中自有颜如玉!");
}

@end
