//
//  Person.m
//  Day02-类与对象
//
//  Created by 传智播客 on 20/7/2.
//  Copyright (c) 2020年 itcast. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)sayHi
{
    NSLog(@"大家好,我是人");
}

- (void)test:(Dog *)dog
{
    dog->_name = @"大黄";
    [dog shout];
}

- (Dog *)test1
{
    Dog *wangCai = [Dog new];
    wangCai->_name = @"旺财";
    wangCai->_color = @"黄色";
   
    return wangCai;
    
    
    
}



@end
