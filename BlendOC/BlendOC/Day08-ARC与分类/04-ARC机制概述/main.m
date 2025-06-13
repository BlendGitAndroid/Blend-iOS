/*
 
 
 1. 什么是ARC
    
    Automatic Reference Counting，自动引用计数. 即ARC. 
    顾名思义:系统自动的帮助我们去计算对象的引用计数器的值,
 
    可以说是WWDC2011和iOS5引入的最大的变革和最激动人心的变化. 
    ARC是新的LLVM3.0编译器的一项特性,使用ARC,可以说一举解决了广大iOS开着所憎恨的手动管理内存的麻烦.
	
    在程序中使用ARC非常简单,只需要像往常那样编写代码. 
    只不过永远不要写retain、release、autorelease 永远要手动的调用 dealloc 这三个关键字就好,这是ARC的最基本的原则.
    当ARC开启时, 编译器会自动的在合适的地方插入retain、release、autorelase代码. 
    编译器自动为对象做引用计数. 而作为开发者,完全不需要担心编译器会做错(除非开发者自己错用了ARC).
	
    需要特别注意的是: ARC是编译器机制. 在编译器编译代码的时候,会在适时的位置加入retain、release和autorealse代码.
 
 2. ARC机制下,对象何时被释放
 
    本质: 对象的引用计数器为0的时候,自动释放.
 
    表象: 只要没有强指针指向这个对象,这个对象就会立即回收.
 
 3. 强指针与弱指针.
 
    强指针: 默认情况下,我们声明1个指针 这个指针就是1个强指针. 
           我们也可以使用__strong来显示的声明这是1个强指针.
            
           Person *p1; 这是1个强指针. 指针默认情况下都是1个强指针.
           __strong Person *p2; 这也是1个强指针.使用__strong来显示的声明强指针.
 
    弱指针: 使用__weak标识的指针就叫做弱指针.
 
           
    无论是强指针还是弱指针,都是指针,都可以用来存储地址,这1点没有任何区别 。
    都可以通过这个指针访问对象的成员.
    唯一的区别就是在ARC模式下.他们用来作为回收对象的基准. 
    
    如果1个对象没有任何强类型的指针指向这个对象的时候,对象就会被立即自动释放
 
 4. 确认程序是否开启ARC机制.
 
    1).默认情况下,Xcode开启ARC机制.
    2).ARC机制下,不允许调用retain、relase、retainCount、autorelease方法.
    3).在dealloc中 不允许[super dealloc];
 
 
 5.  演示第1个ARC案例
     int main(int argc, const char * argv[])
        {
            @autoreleasepool
            {
                Person *p1 = [Person new];//p1是1个强指针.
                //因为我们说过,每1个指针变量默认情况下都是1个强指针变量.
                NSLog(@"------");
            }//当执行到这里的时候.p1指针被回收,那么Person对象就没有任何
            //强指针指向它了. 对象就在这被回收.
            return 0;
     }

 
 */

#import <Foundation/Foundation.h>
#import "Person.h"


int main(int argc, const char * argv[])
{
    
    if(1)
    {
        Person *p1 = [Person new];
    }
 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    return 0;
}
