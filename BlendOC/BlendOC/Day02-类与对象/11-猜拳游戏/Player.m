//
//  Player.m
//  Day02-类与对象
//
//  Created by 传智播客 on 20/7/2.
//  Copyright (c) 2020年 itcast. All rights reserved.
//

#import "Player.h"

@implementation Player
//玩家对象出拳的方法.
- (void)showFist
{
    //1. 提示玩家自己选择要出的拳头.
    NSLog(@"亲爱的玩家【%@】请选择你要出的拳头 1.剪刀  2.石头  3.布",_name);

   //2. 接收用户选择的拳头.
    int userSelect = 0;//1
    scanf("%d",&userSelect);
    //3. 显示玩家出的拳头.
    
    // 将整型的userSelect的值转换为字符串的剪刀 石头 布.
    NSString *fistType = [self fistTypeWithNumber:userSelect];
    
    
    
    NSLog(@"玩家【%@】出的拳头是%@",_name,fistType);
    //4. 将出的拳头存储在当前对象的属性指针
    _selectedFistType = userSelect;
    
    
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
