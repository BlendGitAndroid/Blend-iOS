//
//  Student.m
//  Day05-继承
//
//  Created by 传智播客 on 20/7/5.
//  Copyright (c) 2020年 itcast. All rights reserved.
//

#import "Student.h"

@implementation Student
- (void)setNumber:(int)number
{
    _number = number;
}
- (int)number
{
    return _number;
}
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


+ (instancetype)student
{
    return [Student new];
}
+ (instancetype)studentWithName:(NSString *)name andAge:(int)age
{
    static int bianHao = 1;
    Student *s1 = [Student new];
    s1->_name = name;
    s1->_age = age;
    s1->_number = bianHao;
    bianHao++;
    return s1;
}
@end
