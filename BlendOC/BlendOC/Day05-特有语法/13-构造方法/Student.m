//
//  Student.m
//  Day05-特有语法
//
//  Created by 传智播客 on 15/9/16.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "Student.h"

@implementation Student

- (instancetype)init
{
    if(self = [super init])
    {
        self.dog = [Dog new];
    }
    return self;
}

@end
