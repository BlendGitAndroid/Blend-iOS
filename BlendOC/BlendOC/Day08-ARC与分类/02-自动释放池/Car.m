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
    [super dealloc];
}
@end
