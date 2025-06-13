//
//  Judge.h
//  Day02-类与对象
//
//  Created by 传智播客 on 20/7/2.
//  Copyright (c) 2020年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "Robot.h"

@interface Judge : NSObject
{
    @public
    //姓名
    NSString *_name;
}

//判断机器人对象和玩家对象谁赢谁输.
//为胜利者加分.

- (void)caiJueWithPlayer:(Player *)player andRobot:(Robot *)robot;



@end
