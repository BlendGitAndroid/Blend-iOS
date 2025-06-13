//
//  Car.m
//  Day07-内存管理2
//
//  Created by apple on 15/11/9.
//  Copyright (c) 2015年 ITCAST. All rights reserved.
//

#import "Car.h"

@implementation Car
- (void)dealloc
{
    NSLog(@"速度为%d的车子销毁了.",_speed);
    [super dealloc];
}
- (void)setSpeed:(int)speed
{
    _speed = speed;
}
- (int)speed
{
    return _speed;
}

- (void)run
{
    NSLog(@"速度为%d的车正在行驶",_speed);
}
@end
