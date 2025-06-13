/*
 
  利用面向对象,模拟如下流程.
 
  士兵 开枪 射出子弹.
 
 
  士兵类:
     属性: 姓名 兵种.
     行为: 开火的方法.
 
  枪类:
     属性: 型号.射程.子弹数量.
     行为: 射击.
 
    
  //子弹类:
 
 
  枪有1个弹夹 弹夹中再有子弹.
 
 
 
 
 */

#import <Foundation/Foundation.h>
#import "Soldier.h"

int main(int argc, const char * argv[])
{
    
    DanJia *dj = [DanJia new];
    [dj setMaxCapcity:100];
    [dj setBulletCount:50];
    
    
   
    Gun *ak47 = [Gun new];
    [ak47 setModel:@"AK47"];
    [ak47 setDanJia:dj];
    
    
    
    Soldier *xsd = [Soldier new];
    [xsd setName:@"许三多"];
    [xsd setType:@"炮兵"];
    [xsd setGun:ak47];
    
    
    for(int i = 0 ; i < 100; i++)
        [xsd fire];
   
 
    
    
    
    
    
    
    
    
    
    
    
    return 0;
}
























