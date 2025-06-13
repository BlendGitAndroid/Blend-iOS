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
    [_car release];
    [super dealloc];
}

- (void)drive
{
    NSLog(@"开车..");
    [_car run];
}
@end
