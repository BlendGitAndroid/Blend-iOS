/*
 
 玩家类
 属性: 姓名,出的拳头,分数.
 
 行为: 出拳的行为: 让用户自己选择
 
 
 
 */
#import <Foundation/Foundation.h>
#import "FistType.h"



//玩家类.
@interface Player : NSObject
{
    @public
    //玩家姓名
    NSString *_name;
    
    //玩家的得分
    int _score;
    
    //玩家出的拳头
    FistType _selectedFistType;
    
    
}

//玩家对象出拳的方法.
- (void)showFist;

//将整型的1 2 3 转换为字符串的 剪刀 石头 布.
- (NSString *)fistTypeWithNumber:(int)number;


@end
