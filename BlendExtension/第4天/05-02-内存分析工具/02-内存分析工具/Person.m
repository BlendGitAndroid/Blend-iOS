//
//  Person.m
//  02-内存分析工具
//
//  Created by dream on 15/12/17.
//  Copyright © 2015年 dream. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)dealloc
{
    NSLog(@"人死了, 钱没花了");
}

@end

