//
//  Robot.m
//  Day02-类与对象
//
//  Created by 传智播客 on 20/7/2.
//  Copyright (c) 2020年 itcast. All rights reserved.
//

#import "Robot.h"
#import <stdlib.h>
#import "Player.h"

@implementation Robot
//机器人出拳的方法.
- (void)showFist
{
    //1. 产生1个随机的拳头.
    int robotSelect = arc4random_uniform(3)+1;
    //2. 显示机器人出的什么拳头
    
    
   NSString *fistType =   [self fistTypeWithNumber:robotSelect];
    
    NSLog(@"机器人【%@】出的拳头是:%@",_name,fistType);
    

    
    //3. 保存拳头.
    
    _selectedFistType = robotSelect;
}

//将整型的1 2 3 转换为字符串的 剪刀 石头 布.
- (NSString *)fistTypeWithNumber:(int)number;
{
    if(number  == 1)
    {
        return @"剪刀";
    }
    else if(number == 2)
    {
        return @"石头";
    }
    else
    {
        return @"布";
    }
}


@end
