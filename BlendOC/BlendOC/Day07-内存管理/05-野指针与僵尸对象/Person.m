//
//  Person.m
//  Day07-内存管理
//
//  Created by apple on 15/11/9.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)dealloc
{
    NSLog(@"当你看到这句话的时候,说明我已经离开这个世界了.");
    [super dealloc];
}

- (void)sayHi
{
    NSLog(@"当我不再爱你的时候");
}
@end
