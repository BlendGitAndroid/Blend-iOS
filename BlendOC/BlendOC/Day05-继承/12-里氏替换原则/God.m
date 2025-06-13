//
//  God.m
//  Day05-继承
//
//  Created by 传智播客 on 20/7/5.
//  Copyright (c) 2020年 itcast. All rights reserved.
//

#import "God.h"

@implementation God
- (void)killWithPerson:(Person *)per
{
    NSLog(@"凡人【%@】,结束你的生命.",[per name]);
}
@end
