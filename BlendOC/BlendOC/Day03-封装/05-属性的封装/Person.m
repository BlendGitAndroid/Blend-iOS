//
//  Person.m
//  Day03-封装
//
//  Created by 传智播客 on 20/7/4.
//  Copyright (c) 2020年 itcast. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)setName:(NSString *)name
{
    
//    
//    if([_name length] < 2)
//    {
//        name = @"无名";
//    }
//    else
//    {
//        name = _name;
//    }
//    
    //1. 要做的事情.判断为属性赋的值的字符串的长度是否小于2.
    
//    if([name length] < 2)
//    {
//        _name = @"无名";
//        return;
//    }
//    _name  = name;
    
    
   _name = [name length] < 2 ? @"无名" : name;
    
    

- (NSString *)name
{
    return _name;
}

- (void)setAge:(int)age
{
    if(age >= 0 && age <= 200)
    {
        _age = age;
    }
    else
    {
        _age = 18;
    }
}
- (int)age
{
    return _age;
}

- (void)sayHi
{
    NSLog(@"我叫%@，我的年龄是%d",_name,_age);
}
@end
