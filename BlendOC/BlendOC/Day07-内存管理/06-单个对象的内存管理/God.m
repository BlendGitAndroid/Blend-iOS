//
//  God.m
//  Day07-内存管理
//
//  Created by apple on 15/11/9.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import "God.h"

@implementation God

- (void)dealloc
{
    NSLog(@"上帝挂了");
    [super dealloc];
}

- (void)killWithPerson:(Person *)per
{
    [per retain];
    NSLog(@"受死吧");
    
}
@end
