//
//  Girl.m
//  Day05-继承
//
//  Created by 传智播客 on 20/7/5.
//  Copyright (c) 2020年 itcast. All rights reserved.
//

#import "Girl.h"

@implementation Girl
{
     int _age;
}

/**
 *  展示自己最动人的1面.
 */
- (void)showMyBest
{
    [self moPi];
    NSLog(@"我美吗?");
}

- (void)moPi
{
    NSLog(@"哇 皮肤好好");
}

@end
