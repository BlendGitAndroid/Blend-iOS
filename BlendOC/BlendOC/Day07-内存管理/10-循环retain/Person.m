//
//  Person.m
//  Day07-内存管理
//
//  Created by apple on 15/11/9.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)dealloc
{
    NSLog(@"人死了");
    [_name release];
    //[_book release];
    [super dealloc];
}
- (void)read
{
    [_book castZhiShi];
    NSLog(@"啊,书真好");
}
@end
