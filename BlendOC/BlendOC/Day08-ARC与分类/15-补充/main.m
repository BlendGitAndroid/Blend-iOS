/*
  1. ARC机制与Java垃圾回收机制的区别.
 
     GC: 程序在运行的期间,有1个东西叫做垃圾回收器.不断的扫描堆中的对象是否无人使用.
 
         Person *p1 = [Person new];
         p1 = nil;
 
         记住是在运行时
 
 
     ARC: 不是运行时. 在编译的时候就在合适的地方插入retain......
          插入的代码足以让对象无人使用的时候 引用计数器为0
          而这个是在编译时
 
    也就是说，OC中的很多特性都是在编译时做的，比如这里的自动内存管理，其本质上还是在编译时插入手动的代码
 
    OC中没有重载
 
 
  2. 
 
 
 
 
 */

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{
    
   
    Car *bmw = [Car new];//1
    
    Person *p1 = [[Person alloc] initWithCar:bmw];
    //p1  1
    //bmw  2
//    NSLog(@"bmw =%lu",bmw.retainCount);
    
    
    
    
//    [p1 release];
//    [bmw release];//bmw已经挂了.
   
    return 0;
}
