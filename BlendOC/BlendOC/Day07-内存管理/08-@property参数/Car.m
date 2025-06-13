//
//  Car.m
//  Day07-内存管理
//
//  Created by apple on 15/11/9.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import "Car.h"

@implementation Car

- (void)dealloc
{
    NSLog(@"车废了.");
    [super dealloc];
}
- (void)run
{
    NSLog(@"让开,我行驶了,没有刹车!");
}

@end
