/*
 
  1. 编译检查.
 
     编译器在编译的时候. 判断1个指针是否可以调用指向的对象的方法.
     判断的准则就是指针的类型.
 
     LLVM
 
     我们可以很轻松的把编译器给骗过.
 
 
  2. 就算骗过了编译器,程序在运行的时候还会做运行检查.
     我们写的程序就算编译通过了.不意味着可以完美的执行.
 
 
  3. 我们就希望.我们可以写代码来先判断1下.对象中是否有这个方法.如果有再去执行.
     如果没有就别去执行.
 
 
     1). 判断对象中是否有这个方法可以执行.
 
         - (BOOL)respondsToSelector:(SEL)aSelector;
 
         最常用的是这个方法. 
 
         Person *p1 = [Person new];
         [p1 sayHi];
 
 
 
     2). 判断类中是否有指定的类方法.
 
         + (BOOL)instancesRespondToSelector:(SEL)aSelector;
 
 
     2). 判断指定的对象是否为 指定类的对象或者子类对象.
        - (BOOL)isKindOfClass:(Class)aClass;
 
        BOOL b1 = [s1 isKindOfClass:[Person class]];

        判断s1对象是否为Person对象或者Person的子类对象.
 
 
     3). 判断对象是否为指定类的对象 不包括子类.
 
         - (BOOL)isMemberOfClass:(Class)aClass;
         [s1 isMemberOfClass:[Student class]];
         判断s1对象是否为1个Student对象. 不包括Student的子类对象.
 
     4). 判断类是否为另外1个类的子类.
        + (BOOL)isSubclassOfClass:(Class)aClass;
 
 
 
 
 
 
 
 */

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[])
{
    
    
    BOOL res = [Student instancesRespondToSelector:@selector(sb)];
    
    NSLog(@"res = %d\n",res);
    

    
    
    
    
//    [Student isSubclassOfClass:[Person class]];
//    
//    
//    [Student instancesRespondToSelector:@selector(sayHi)];
    
   
  
//    Student *s1 = [Student new];
//    BOOL b1 = [s1 isMemberOfClass:[Student class]];
//    
//     NSLog(@"b1 = %d",b1);
//    
    
    
//      BOOL b1 = [s1 isKindOfClass:[NSObject class]];
//    
//      NSLog(@"b1 = %d",b1);
    
//    
//    BOOL b1 =  [p1 respondsToSelector:@selector(length)];
//    if(b1 == YES)
//    {
//        [p1 sayHi];
//    }
//    else
//    {
//        NSLog(@"NO.....");
//    }
    
    
    return 0;
}
