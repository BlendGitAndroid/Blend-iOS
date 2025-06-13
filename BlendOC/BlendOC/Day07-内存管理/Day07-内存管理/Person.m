//
//  Person.m
//  Day07-内存管理
//
//  Created by apple on 15/11/9.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize name = _name;


- (instancetype)init
{
    if(self = [super init])
    {
        self.name = @"jack";
        self.age = 19;
    }
    return self;
}
- (instancetype)initWithName:(NSString *)name andAge:(int)age
{
    if(self = [super init])
    {
        self.name = name;
        self.age = age;
    }
    return self;
}

@end
