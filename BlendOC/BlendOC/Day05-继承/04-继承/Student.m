//
//  Student.m
//  Day05-继承
//
//  Created by 传智播客 on 20/7/5.
//  Copyright (c) 2020年 itcast. All rights reserved.
//

#import "Student.h"

@implementation Student
- (void)setName:(NSString *)name
{
    _name = name;
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

- (void)setHeight:(float)height
{
    _height = height;
}
- (float)height
{
    return _height;
}

- (void)setWeight:(float)weight
{
    _weight = weight;
}
- (float)weight
{
    return _weight;
}
- (void)setStuNumber:(NSString *)stuNumber
{
    _stuNumber = stuNumber;
}
- (NSString *)stuNumber
{
    return _stuNumber;
}

@end
