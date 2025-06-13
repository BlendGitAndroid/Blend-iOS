/*
  1. C语言中的static
 
     a. 修饰局部变量.
     b. 修饰全局变量.
     c. 修饰函数.
 
 
  2. OC中的static关键字.
 
     a. static不能修饰属性 也不能修饰方法.
     b. static可以修饰方法中的局部变量.
 
         如果方法中的局部变量被static修饰,那么这个变量就会被变成静态变量.
         存储在常量区 当方法执行完毕之后 不会回收 下次再执行这个方法的时候 直接使用 而不会再声明了.
 
 
 
  3. 如果方法的返回值是当前类的对象,那么方法的返回值就写instancetype
 
 
 
 */

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"

int main(int argc, const char * argv[])
{
    //第1次创建的对象的编号自动就是1
    // 2    2
    //3    3
    //4    4
    Student *s1= [Student studentWithName:@"jack1" andAge:19];
    Student *s2= [Student studentWithName:@"jack2" andAge:19];
    Student *s3= [Student studentWithName:@"jack3" andAge:19];
    Student *s4= [Student studentWithName:@"jack4" andAge:19];
    
//    Person *p1 = [Person new];
//    [p1 sayHi];
//    [p1 sayHi];
    
    return 0;
}
