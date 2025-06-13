//
//  Dog.m
//  Day03-封装
//
//  Created by 传智播客 on 20/7/4.
//  Copyright (c) 2020年 itcast. All rights reserved.
//

#import "Dog.h"

@implementation Dog
- (void)shout
{
    NSLog(@"汪汪汪");
}

//写1个方法. 判断当前这个狗对象的年龄是否比另外1条狗大
- (BOOL)compareAgeWithOtherDog:(Dog *)otherDog
{
    //1. 拿到当前狗狗的年龄.
    
    //2. 再拿到传入的狗对象的年龄
    //3. 比较.
    
    
    return _age > otherDog->_age;
  
}

@end
