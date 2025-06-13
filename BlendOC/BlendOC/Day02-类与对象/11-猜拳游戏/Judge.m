//
//  Judge.m
//  Day02-类与对象
//
//  Created by 传智播客 on 20/7/2.
//  Copyright (c) 2020年 itcast. All rights reserved.
//

#import "Judge.h"

@implementation Judge


//判断机器人对象和玩家对象谁赢谁输.
//为胜利者加分.

- (void)caiJueWithPlayer:(Player *)player andRobot:(Robot *)robot
{
    
    NSLog(@"我是裁判【%@】,我来宣布比赛结果-------",_name);
    //1. 先取出玩家对象和机器人对象出的拳头.
    FistType ft1  = player->_selectedFistType;
    FistType ft2 = robot->_selectedFistType;
    //2. 判断输赢
    // 玩家    机器人
    //  1      3  -2
    //  2      1   1
    //  3      2   1
    
    if(ft1 - ft2 == -2 || ft1 - ft2 == 1)
    {
        //玩家胜利
        NSLog(@"恭喜玩家【%@】取得胜利.",player->_name);
        player->_score++;
    }
    else if(ft1 == ft2)
    {
        NSLog(@"【%@】、【%@】你们真是心有灵犀啊!",player->_name,robot->_name);
    }
    else
    {
        NSLog(@"恭喜机器人【%@】取得胜利.",robot->_name);
        robot->_score++;
    }
    //3. 为胜利的对象加分.
    
   //显示比分.
    NSLog(@"现在比分: 玩家【%@】: %d ------机器人【%@】:%d",player->_name,player->_score,robot->_name,robot->_score);
    
    
    
    
    
    
    
}

@end
