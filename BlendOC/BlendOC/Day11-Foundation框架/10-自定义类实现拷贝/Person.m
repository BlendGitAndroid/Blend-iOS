//
//  Person.m
//  Day11-Foundation框架
//
//  Created by apple on 15/11/14.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import "Person.h"

@implementation Person

- (id)copyWithZone:(NSZone *)zone
{
    //1.如果要做深拷贝.你就重新创建1个对象.
    //  把对象的属性的值 复制 到新对象中 将新对象返回.
    
//    Person *p1 = [Person new];
//    p1.name = _name;
//    p1.age = _age;
//    return p1;
    
    return self;
    
}

@end
