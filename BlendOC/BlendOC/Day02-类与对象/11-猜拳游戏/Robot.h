//
//  Robot.h
//  Day02-类与对象
//
//  Created by 传智播客 on 20/7/2.
//  Copyright (c) 2020年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FistType.h"

//机器人类.
@interface Robot : NSObject
{
    @public
    //姓名
    NSString *_name;
    //分数
    int _score;
    //出的拳头.
    FistType _selectedFistType;
    
}

//机器人出拳的方法.
- (void)showFist;



//将整型的1 2 3 转换为字符串的 剪刀 石头 布.
- (NSString *)fistTypeWithNumber:(int)number;

@end
