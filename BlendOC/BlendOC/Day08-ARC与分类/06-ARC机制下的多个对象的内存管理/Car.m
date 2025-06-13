//
//  Car.m
//  Day08-ARC与分类
//
//  Created by apple on 15/11/10.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import "Car.h"

@implementation Car
- (void)dealloc
{
    NSLog(@"车废了");
}


- (void)run
{
    NSLog(@"时速为%d的车子正在行驶.",_speed);
}
@end
