/*
  1. 内存管理的重点
 
     1). 什么时候为对象发送retain消息.
 
         当多1个人使用这个对象的时候,应该先为这个对象发送retain消息.
 
     2). 什么时候为对象发送releaee消息.
 
         当少1个人使用这个对象的时候.应该为这个对象发送1条release消息.
 
 
  
  2. 在ARC机制下,retain release dealloc这些方法方法无法调用.
 
 
 
  2. 内存管理的原则
     1). 有对象的创建,就要匹配1个release
 
     2). retain的次数和release的次数要匹配.
 
     3). 谁用谁retain. 谁不用谁release.
         谁负责retain 谁就负责relase
 
     4). 只有在多1个人用的时候才retain 少1个人使用的时候才release
 
 
     有始有终,有加就有减. 有retain就应该匹配1个release 一定要平衡.
 
 
 
 
 */

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{
    
    Person *p1 = [Person new];
    [p1 retain];
    [p1 retain];
    [p1 retain];
    [p1 retain];
    [p1 release];
    [p1 release];
    [p1 release];
    [p1 release];
    
    
    [p1 release];
    return 0;
}
