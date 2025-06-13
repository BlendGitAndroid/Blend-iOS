/*
  1. 单例模式:
 
     1个类的对象,无论在何时创建也无论在什么地方创建 也无论创建多少次.创建出来的都是同1个对象.
 
 
  2. 无论如何创建对象,最终都会调用alloc方法来创建对象.
     
     1). alloc方法的内部. 其实什么都没有做,只是调用了allocWithZone:方法.
 
     2). 实际上真正申请空间 创建对象的事情是allocWithZone:方法在做.
 
 
  3. 要实现单例模式.
 
     重写+ allocWithZone:
 
     + (instancetype)allocWithZone:(struct _NSZone *)zone
     {
         static id instance = nil;
         if(instance == nil)
         {
            instance = [super allocWithZone:zone];
         }
         return instance;
     }
 
 
  4. 单例模式的规范:
     如果类是1个单例模式.要求为类提供1个类方法.来返回这个单例对象.
 
 
     类方法的名称必须以 shared类名; default类名;
 
 
 
  5. 什么时候要把类搞成单例.
     1). 单例的特点
         无论何时、何地、创建对象,也不管创建多少次对象,得到都是同1个对象.
         单例对象可以被共享. 存储在单例对象中的数据可以被共享.
         也就是无论在什么地方创建单例对象 访问的都是同1个对象.
 
 
     2).
 
 
 
     做游戏:
     游戏面板的宽度: 800
     游戏面板的高度: 600
 
     这两个数据基本上在很多的地方都会使用到.
 
     1. 直接写. 滚蛋.
     2. 宏. 程序运行的时候无法更改.
     3. 还是要定义为变量.
 
     定义为属性保存在对象中. 如果不是单例对象.
 
 
 
     如果数据需要被整个程序所共享. 将数据以属性的方式存储在单例对象中.
 
 
 
 
      

 
 
 
 
 
 
 
 
 
 */

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{
    
    Person *p1 = [Person sharedPerson];


    return 0;
}
