/*
  1.找类.
 
    玩家类:
      属性:姓名,出的拳头,得分.
      方法:出拳的行为: 让用户自己选择.
 
    机器人类:
      属性: 姓名 出的拳头 得分.
      方法: 出拳: 随机出拳.
 
 
    裁判类:
      属性: 姓名
      行为: 判断输赢.
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 */

#import <Foundation/Foundation.h>




































#import "Judge.h"

int main(int argc, const char * argv[])
{
    
    Player *p1 = [Player new];
    p1->_name = @"小花花";
    
    Robot *r1 = [Robot new];
    r1->_name = @"小蓝蓝";
    
    Judge *j1 = [Judge new];
    j1->_name = @"黑哨";
    
    
    do
    {
    
        [p1 showFist];
        [r1 showFist];
        [j1 caiJueWithPlayer:p1 andRobot:r1];
        
        NSLog(@"还要继续玩吗?大爷! y/n");
        char ans = 'a';
        rewind(stdin);
        scanf("%c",&ans);
        rewind(stdin);
        if(ans == 'n')
        {
            break;
        }
        
    }while (1);
    
    return 0;
}


















