/*
  1. @property只是生成getter  setter 的声明.   
     @synthesize是生成getter  setter 的实现.
    
    
     这种写法是Xcode4.4之前的写法. 从Xcode4.4以后.Xcode对@property做了1个增强
 
 
  2. @property增强
 
     只需要写1个@property 编译器就会自动
     
     1) 生成私有属性.
     2).生成getter setter的声明.
     3).生成getter setter的实现.
 
 
     @property NSString *name;
 
     做的事情
     1). 自动的生成1个私有属性,属性的类型和@property类型一致 属性的名称和@property的名称一致 属性的名称自动的加1个下划线.
 
     2). 自动的生成这个属性的getter setter方法的声明
 
     3). 自动的生成这个属性的getter setter方法的实现.
 
         setter的实现: 直接将参数的值赋值给自动生成的私有属性.
         getter的实现: 直接返回生成的私有属性的值.
 
 
  3.使用注意.
 
    1). @property的类型一定要和属性的类型一致. 
        名称要和属性的名称一致 只是去掉下划线.
 
 
    2). 也可以批量声明相同类型的@property
 
 
    3). @property生成的方法实现没有做任何逻辑验证.
 
        setter: 直接赋值
        getter： 直接返回.
 
        所以,我们可以重写setter来自定义验证逻辑.如果重写了setter 还会自动生成getter
        如果重写了getter 还会自动生成setter 
 
 
        如果同时重写getter setter 那么就不会自动生成私有属性了.
 
  
   4. 如果你想为类写1个属性 并且为这个属性封装getter setter
      1个@property就搞定.
 
 
   5. 继承.
      父类的@property一样可以被子类继承.
      @property生成的属性是私有的 在子类的内部无法直接访问生成的私有属性。
      但是可以通过setter getter来访问。
 
 
 
 
 */

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[])
{
    Student *s1 = [Student new];
    [s1 setName:@"jack"];
    NSString *name = [s1 name];

    return 0;
}
