//
//  Person.m
//  Day07-内存管理2
//
//  Created by apple on 15/11/9.
//  Copyright (c) 2015年 ITCAST. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)dealloc
{
    NSLog(@"人死了");
    [_car release];
    [_name release];
    [super dealloc];
}
- (void)setCar:(Car *)car
{
    if(_car != car)//说明新旧对象不是同1个对象.
    {
        [_car release];//才去release旧的
        _car = [car retain];//retain新的.
    }
}
- (Car *)car
{
    return _car;
}

- (void)setName:(NSString *)name
{
    if(_name != name)
    {
        [_name release];
        _name = [name retain];
    }
}
- (NSString *)name
{
    return _name;
}



- (void)setAge:(int)age
{
    _age = age;
}
- (int)age
{
    return _age;
}

- (void)drive
{
    NSLog(@"走啊,去拉萨.");
    [_car run];
}

@end
