/*
 
  1. 我们写1个类.
     a. 要先为类写属性.
     b. 在声明属性的getter setter
     c. 再实现getter setter
 
     哎! 1点点技术含量都没有.有没有更为简单的方式来实现同样的代码效果呢
 
 
  2. @property
 
     1). 作用: 自动生成getter、setter方法的声明.
              因为是生成方法的声明,所以应该写在@interface类的声明之中.
    
     2). 语法:
         @property 数据类型 名称;
         @property int age;
 
     3). 原理:
         编译器在编译的时候.会根据@property生成getter和setter方法的实现.
 
         @property 数据类型 名称;
         生成为:
         - (void)set首字母大写的名称:(数据类型)名称;
         - (数据类型)名称;
 
         @property int age;
         - (void)setAge:(int)age;
         - (int)age;
 
  3. 使用@property注意.
 
     1). @property的类型和属性的类型一致.
         @property的名称和属性的名称一致(去掉下划线)
         不要乱写.
 
     2). @property的名称决定了生成的getter和setter方法的名称.
           所以,@property的名称要和属性的名称一致 去掉下划线  否则生成的方法名就是不符合规范的
         @property的数据类型决定了生成的setter方法的参数类型 和 getter方法的返回值类型.
 
 
     3). @property只是生成getter和setter方法的声明. 实现还要自己来. 属性还要自己定义.
 
         
 
 
 
 
 */


#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    
    
    Person *p1 = [Person new];
    [p1 setW]
    
    
    
    
    
    
    return 0;
}
