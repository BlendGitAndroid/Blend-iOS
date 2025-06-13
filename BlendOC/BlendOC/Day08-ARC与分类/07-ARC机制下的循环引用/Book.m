//
//  Book.m
//  Day08-ARC与分类
//
//  Created by apple on 15/11/10.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import "Book.h"

@implementation Book

- (void)dealloc
{
    NSLog(@"书被烧了");
}

@end
