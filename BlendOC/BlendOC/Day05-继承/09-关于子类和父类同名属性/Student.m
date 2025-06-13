//
//  Student.m
//  Day05-继承
//
//  Created by 传智播客 on 20/7/5.
//  Copyright (c) 2020年 itcast. All rights reserved.
//

#import "Student.h"

@implementation Student

- (void)study
{
    NSLog(@"刻苦学习");
    
    
    [super sayHi];//super 基 超
   
}

+ (void)haha
{
    [Person hehe];
    [Student hehe];
    [self hehe];
    [super hehe];
}

@end
