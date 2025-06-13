/*
 
  1. 单根性
 
     1个类只能有1个父类 不能有多个父类.
 
 
  2. 传递性.
 
     A类从B类继承,B类从C类继承. 那么A类就同时拥有B、C类的成员.
 
  3. NSObject类.
    
     是Foundation框架中的类.在这个类中有1个类方法new
     这个方法是用来创建对象的.方法的返回值是创建的这个对象的指针.
 
     也就是说,如果要创建类的对象,就必须要调用这个new方法.
 
     如果我们想要让我们的类具备创建对象的能力,就必须要让我们的类直接的或者间接的从NSObject类继承.
 
     所以.要求: 我们写的类必须直接的或者间接的要NSObject类继承.
     如果你不继承,我们的类就无法创建对象. 那么我们的类就毫无意义.
 
 
     在NSObject类之中 还定义了1个属性. 这个属性叫做isa指针.
     所以,每1个子类对象中都有1个叫做isa的指针.
 
 
     NSObject类是OC中所有类的祖宗类. 因为OC中的类全部都是直接的或者间接的从它继承,
 
  4. 
 
 
 
 
 
 
 
 
 
 */

#import <Foundation/Foundation.h>
#import "ItCastStu.h"
#import "Dog.h"

int main(int argc, const char * argv[])
{
    Dog *d1 = [Dog new];

    
    
    
     ItCastStu *s1 = [ItCastStu new];
    
    
    
    
//    
//    [s1 studyHard];
//    [s1 study];
//    [s1 sayHi];
    
    
    return 0;
}
