//
//  Person.m
//  Day05-继承
//
//  Created by 传智播客 on 20/7/5.
//  Copyright (c) 2020年 itcast. All rights reserved.
//

#import "Person.h"

@implementation Person
{
    NSString *_name;
    int _age;
}
- (void)sayHi
{
    NSLog(@"你好");
}

- (void)hehe
{
    [self sayHi];
}

@end
