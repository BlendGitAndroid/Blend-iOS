//
//  User.m
//  Day08-ARC与分类
//
//  Created by apple on 15/11/10.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import "User.h"

@implementation User

- (void)dealloc
{
    NSLog(@"用户死了");
    [_nickName release];
    [_account release];
    [super dealloc];
}

@end
