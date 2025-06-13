//
//  Person.m
//  Day05-特有语法
//
//  Created by 传智播客 on 15/9/16.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "Person.h"

@implementation Person


- (instancetype)init
{
    //0代表假 非0代表真. 0
    if(self = [super init])
    {
       self.name = @"jack";
    }
    return self;
}


- (instancetype)initWithName:(NSString *)name andAge:(int)age andWeight:(float)weight andHeight:(float)height
{
    if(self = [super init])
    {
        self.name = name;
        self.age= age;
        self.weight = weight;
        self.height = height;
    }
    return self;
}


- (void)sayHi
{
    NSLog(@"我是人,你好吗?");
}
@end
