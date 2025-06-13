//
//  Person.m
//  Day07-内存管理
//
//  Created by apple on 15/11/9.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)dealloc//只要这个方法被执行,就代表当前这个对象被回收了.
{
    NSLog(@"名字叫做%@的人挂了.",_name);
 
    [super dealloc];
}



- (void)sayHi
{
    NSLog(@"大家好,才是真的好!");
}
@end
