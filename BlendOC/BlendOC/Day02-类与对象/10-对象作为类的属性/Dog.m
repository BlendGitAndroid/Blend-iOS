//
//  Dog.m
//  Day02-类与对象
//
//  Created by 传智播客 on 15/12/15.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "Dog.h"

@implementation Dog
//狗的叫的行为.
- (void)shout
{
    NSLog(@"汪汪汪...我的名字叫做%@",_name);
}
@end
