//
//  Person.m
//  Day05-继承
//
//  Created by 传智播客 on 20/7/5.
//  Copyright (c) 2020年 itcast. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)setName:(NSString *)name
{
    _name = name;
}
- (NSString *)name
{
    return _name;
}

- (void)sayHi
{
    _name = @"jack";
    NSLog(@"_name = %@",_name);
    NSLog(@"大家好,我是人");
}
@end
