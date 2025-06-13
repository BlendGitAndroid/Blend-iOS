/*
 
  1. 杀手
        方法: 可以杀各种各样的人.
 
  2. 每1个人被杀的时候,都要叫. 但是每1个人叫的形式是不一样的.
 
     每1个人都有1个叫的方法.
 
     Person：
 
     男人 超级赛亚人 火星人.
 
 
 
 
 
 */
#import <Foundation/Foundation.h>
#import "Killer.h"
#import "Man.h"
#import "FireMan.h"
#import "SuperMan.h"
#import "WoodMan.h"

int main(int argc, const char * argv[])
{
  
    Killer *bill = [Killer new];
    
    
    
    Man *m1 = [Man new];
    
    
    [bill killWith:m1];
    
    FireMan *fm = [FireMan new];
    [bill killWith:fm];
    
    
    SuperMan *sm = [SuperMan new];
    [bill killWith:sm];
    
    
    WoodMan *wm = [WoodMan new];
    [bill killWith:wm];
    
    
    
    return 0;
}
