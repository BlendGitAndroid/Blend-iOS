/*
 
  男孩子找女朋友.
 
 
    要求:
     必须
     1). 会洗衣服
     2). 会做饭
     优先:
     如果有份过万的月薪的工作.
 
 
 
 
  男孩子类:
     属性:姓名,年龄,钱,女朋友.
     行为:谈恋爱.
 
 
  定义1个协议;女朋友协议.
    洗衣
    做饭
  
   
 
 
 
 
 
 
 
 */

#import <Foundation/Foundation.h>
#import <limits.h>
#import "Boy.h"
#import "Girl.h"
#import "Pig.h"


int main(int argc, const char * argv[])
{
    
    
    
    Boy *b1 = [Boy new];
    b1.name = @"李刚";
    b1.age = 18;
    b1.money = INT32_MAX;
    b1.girlFriend = b1;
    
    [b1 talkLove];
    
    
    
    
//
//    Girl *fj = [Girl new];
//    fj.name = @"凤姐";
//    
//    
//    b1.girlFriend = fj;
//    
//    
//    [b1 talkLove];
//    
//    
//    
//    Pig *zhuZhu = [Pig new];
//    b1.girlFriend = zhuZhu;
//    [b1 talkLove];

    
    
    
    
    

    
    
    
    return 0;
}
