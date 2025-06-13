//
//  Person.m
//  Day08-ARC与分类
//
//  Created by apple on 15/11/10.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)dealloc
{
    [_dog release];
    [super dealloc];
}


//
//- (void)setDog:(Dog *)dog
//{
//    if(_dog != dog)//当新旧对象是同1个对象的时候.
//    {
//        //setter方法的作用: 将传递进来的gou狗对象 赋值给当前对象的_dog属性.
//        //1. 旧对象不再使用.
//        //2. 使用新对象.
//        [_dog release];
//        _dog = [dog retain];
//    }
//}
//- (Dog *)dog
//{
//    return _dog;
//}

@end
