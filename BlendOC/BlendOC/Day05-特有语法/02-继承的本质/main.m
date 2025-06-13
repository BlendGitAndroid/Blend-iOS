/*
  1. 创建1个对象,这个对象在内存中是如何分配的.
 
 
     1). 子类对象中有自己的属性和所有父类的属性.
 
 
     2). 代码段中的每1个类都有1个叫做isa的指针,这个指针指向它的父类.
         一直指到NSObject
 
         [p1 sayHi];  //假设p1是Person对象.
         先根据p1指针找到p1指向的对象,然后根据对象的isa指针找到Person类.
         搜索Person类中是否有这个sayHi方法 如果有执行
         如果没有 就根据类的isa指针找父类 。。。。。
         NSObject 中如果没有就报错.
 
 */

#import <Foundation/Foundation.h>
#import "Student.h"


int main(int argc, const char * argv[])
{
    
    Student *s1 = [Student new];
    [s1 sayHi];
    
    
    return 0;
}
