//
//  Killer.m
//  Day05-继承
//
//  Created by 传智播客 on 20/7/5.
//  Copyright (c) 2020年 itcast. All rights reserved.
//

#import "Killer.h"

@implementation Killer
- (void)killWith:(Person *)per
{
    NSLog(@"哈哈,有人要我取你狗命.赶紧呼救还来得及.");
    [per help];
}
@end
