//
//  Dog.m
//  02-内存分析工具
//
//  Created by dream on 15/12/17.
//  Copyright © 2015年 dream. All rights reserved.
//

#import "Dog.h"

@implementation Dog

- (void)dealloc
{
    NSLog(@"狗死了, 狗粮没吃完");
}

@end
