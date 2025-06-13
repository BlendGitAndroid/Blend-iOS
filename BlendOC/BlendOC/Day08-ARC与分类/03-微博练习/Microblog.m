//
//  Microblog.m
//  Day08-ARC与分类
//
//  Created by apple on 15/11/10.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import "Microblog.h"

@implementation Microblog

- (void)dealloc
{
    NSLog(@"微博也删了");
    [_content release];
    [_imgURL release];
    [_user release];
    [_zhuanFaBlog release];
    
    [super dealloc];
}

@end
