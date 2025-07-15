//
//  Person+itcast.m
//  Day08-ARC与分类
//
//  Created by apple on 15/11/10.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import "Person+itcast.h"

@implementation Person (itcast)
- (void)tt
{
    [self setAge:19];
    int age = [self age];
    
    NSString *testBlend = [self testCategoty];
    int testBlend1 = self->_aaa;
    
    self->_aaa = 10;
}
@end
