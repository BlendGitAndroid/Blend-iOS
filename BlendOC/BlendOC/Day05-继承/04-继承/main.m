/*
  1. 遇到的问题.
     多个类具有相同的成员.
     a. 复制 粘贴.
        -> 代码冗余.
        -> 后期的维护不方便.
    
     b.使用继承.
 
 
  2. 继承的目的: 儿子类想拥有父亲类中的所有的成员.但是不想自己去定义,而是想凭空拥有.
 
 
  3. 继承的语法: 如何让1个类认另外1个类为爹 因为想拥有爹类中的所有的成员
 
     语法:
     @interface 类名 : 父亲类的名称
 
     @end
 
    
  4. 继承的效果:
 
     儿子类一旦从父亲类去继承.那么儿子类中拥有了父亲类中的所有的成员. 不用自己定义.
 
 
  5. 几个术语:
     
     @interface Student : Person
 
     1). Student类从Person类继承. Studdent类是Person类的子类 Person类是Student的父类.
     2). Student类从Person类派生. Student类是Person类的派生类.Person类是Student类的基类.
 
     子类一旦从父类继承 就意味着子类拥有了父类的所有的成员 而不用自己去定义.
 
 
 
 
 
 
 
 
 
 
 
 */






#import <Foundation/Foundation.h>
#import "Person.h"


/**
 *  中国人类.
 */
@interface Chinese : Person

@end

@implementation Chinese

@end

int main(int argc, const char * argv[])
{
    
    Chinese *ch = [Chinese new];
    [ch setName:@"小明"];

 
    
    
    return 0;
}
