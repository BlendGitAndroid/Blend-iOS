//
//  Boy.m
//  Day09-Block与协议
//
//  Created by apple on 15/11/12.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import "Boy.h"

@implementation Boy

/**
 *  谈恋爱
 */
- (void)talkLove
{
    NSLog(@"哈尼,我回来了.");
    [_girlFriend wash];
    [_girlFriend cook];
    NSLog(@"哈尼,明天继续哦.么么哒!");
}

- (void)wash
{
    NSLog(@"挨,单身狗的悲哀");
}
- (void)cook
{
    NSLog(@"👬🐶👬");
}

@end
