//
//  Person.m
//  Day05-继承
//
//  Created by 传智播客 on 20/7/5.
//  Copyright (c) 2020年 itcast. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)sayHi
{
    
    
    NSString *_name = @"杰瑞";
    
    NSLog(@"_name = %@",self->_name);
    
    [self hehe];
    
    
//    NSLog(@"self = %p",self);
//    
//    NSLog(@"_name = %@",self->_name);
//    NSLog(@"_name = %@",_name);
//
//    
//    //指向对象的指针名->属性名
//    //self->_name
//    //[指向对象的指针名 方法名];
//    //[p1 hehe]
//    [self hehe];
//    
//    
////    NSString *_name = @"jack";
////    NSLog(@"_name = %@",_name);
//    NSLog(@"我的名字叫%@我的年龄是%d",_name,_age);
}

- (void)hehe
{
    NSLog(@"```````");
    //调用当前这个对象的sayHi方法 。
//    Person *p1 = [Person new];
//
//    [p1 sayHi];
    //[self sayHi];
    
    //[self sb2];
}




+ (void)sb2
{
    
    self->_name = @"jack";
    
    
    //应该是Person类在代码段的地址.
    NSLog(@"self = %p",self);
}

+ (void)dsb
{
    NSLog(@"~~~~~~");
    [self sb];
    //self 等价于 Person
    
}

- (void)sb
{
    NSLog(@"~~~~~~");
}

- (void)run
{
    
}

@end
