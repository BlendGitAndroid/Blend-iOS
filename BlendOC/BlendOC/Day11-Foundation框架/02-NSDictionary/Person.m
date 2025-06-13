//
//  Person.m
//  Day11-Foundation框架
//
//  Created by apple on 15/11/14.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import "Person.h"

@implementation Person
- (instancetype)initWithName:(NSString *)name
{
    if(self = [super init])
    {
        self.name = name;
    }
    return self;
}
@end
