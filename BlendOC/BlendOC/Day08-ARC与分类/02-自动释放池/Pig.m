//
//  Pig.m
//  Day08-ARC与分类
//
//  Created by apple on 15/11/10.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import "Pig.h"

@implementation Pig

- (void)dealloc
{
    NSLog(@"猪猪死了");
    [_name release];
    [super dealloc];
}

- (instancetype)initWithName:(NSString *)name andAge:(int)age andWeight:(float)weight
{
    if(self = [super init])
    {
        _name = name;
        _age = age;
        _weight = weight;
    }
    return self;
}

+ (instancetype)pig
{
    return [[[self alloc] init] autorelease];
}


+ (instancetype)pigWithName:(NSString *)name andAge:(int)age andWeight:(float)weight
{
    return [[[self alloc] initWithName:name andAge:age andWeight:weight] autorelease];
}



/*
 Pig *p1 = [Pig pigWig: @"jack"  19  100];
 
 
 */

@end
