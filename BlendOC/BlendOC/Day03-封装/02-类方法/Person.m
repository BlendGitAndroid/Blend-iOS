//
//  Person.m
//  Day03-封装
//
//  Created by 传智播客 on 20/7/4.
//  Copyright (c) 2020年 itcast. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)sayHi
{
    _name = @"rose";
    NSLog(@"打击爱好 ");
    [Person hehe];
}

+ (void)hehe
{
    
    
//    Person *p1 = [Person new];
//    p1->_name = @"jack";
//    [p1 sayHi];
    
    NSLog(@"我是类方法我叫hehe");
}

+ (Person *)person
{
    Person *p1 = [Person new];
    return p1;
}

+ (Person *)personWithName:(NSString *)name andAge:(int)age
{
    Person *p1 = [Person new];
    p1->_name = name;
    p1->_age = age;
    return p1;
}

@end
