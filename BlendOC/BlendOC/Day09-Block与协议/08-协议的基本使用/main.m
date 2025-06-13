/*
  1. 协议与协议之间可以相互继承.
 
     1). 继承的语法:
          
         @protocol 协议名称 <父协议名称>
 
         @end
 
     2). 效果:
         子协议中不仅有自己的方法的声明,还有父协议中的所有的方法的声明.
         如果1个类遵守了某份协议,那么这个类就拥有这个协议和这个协议的父协议中的所有的方法声明.
 
 
  2. 介绍1个东西. NSObject
     
     在Foundation框架中,有1个类 叫做NSObject 是所有OC类的基类.
     在Foundation框架中,有1个协议.叫做NSObject.
 
     NSObject协议被NSObject类遵守.所以,NSObject协议中的所有的方法 全部的OC类都拥有了.
     这么说,所有的OC类都遵守了NSObject协议. NSObject协议叫做基协议.
 
     类的名称可以和协议的名称一致.
 
 
  3. 写协议的规范:
     
     要求所有的协议都必须直接的或者间接的从NSObject基协议继承.
 
 
 
         
 
 
 
 
 */

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
   
    
    Person *p1 = [Person new];

    [p1 description];
    
    
    return 0;
}
