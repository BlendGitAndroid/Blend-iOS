/*
  1. 当两个类相互包含的时候. 当Person.h中包含Book.h 而Book.h中又包含Person.h
     这个时候,就会出现循环引用的问题. 就会造成无限递归的问题,而导致无法编译通过.
 
  2. 解决方案: 
     其中一边不要使用#import引入对方的头文件.
     而是使用@class 类名; 来标注这是1个类.这样子就可以在不引入对方头文件的情况下,告诉编译器这是1个类.\\\\    \\\
 
     在.m文件中再#import对方的头文件.就可以使用了.
 
 
  3. @class与#import的区别
 
     1). #import是将指定的文件的内容拷贝到写指令的地方.
 
     2). @class 并不会拷贝任何内容. 只是告诉编译器,这是1个类,这样编译器在编译的时候才可以知道这是1个类.
 
 

 
 
 
 
 */

#import <Foundation/Foundation.h>
#import "Book.h"

int main(int argc, const char * argv[])
{

    Person *p1 = [Person new];
    Book *b1 = [Book new];
    p1.book = b1;
    
    [p1 read];
    
    
    [b1 release];
    [p1 release];
    return 0;
}
