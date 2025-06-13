/*
  1. @property 只能生成getter和setter的声明.
     实现还要我们自己来.
    
     而实现也是没有什么任何技术含量. 方法实现的代码能不能也可以自动生成呢?
 
 
  2. @synthesize
 
     1).作用: 自动生成getter、setter方法的实现.
             所以,应该写在类的实现之中.
 
     2).语法: 
             @synthesize @property名称;
 
         @interface Person : NSObject
         {
             int _age;
         }
         @property int age;
         @end
        ----------------    
         @implmentation Person
 
         @synthesize age;
         @end
 
 
     3).@synthesize做的事情.
       @implmentation Person
     
       @synthesize age;
       @end
 
       -----------
       @implementaion Person
       {
          int age;
       }
 
       - (void)setAge:(int)age
       {
           self->age = age;
       }
       - (int)age
       {
           return age;
       }
       @end
 
 
 
        a.  生成1个真私有的属性.属性的类型和@synthesize对应的@property类型一致.
            属性的名字和@synthesize对应的@property名字一致.
 
        b.  自动生成setter方法的实现.
            实现的方式: 将参数直接赋值给自动生成的那个私有属性.并且没有做任何的逻辑验证.
 
        c.  自动生成getter方法的实现.
            实现的方式: 将生成的私有属性的值返回.
 
 3. 希望@synthesize不要去自动生成私有属性了.
    getter setter的实现中操作我们已经写好的属性就可以了.
 
    语法:
 
    @synthesize @property名称 = 已经存在的属性名;
 
    @synthesize age = _age;
    1). 不会再去生成私有属性.
 
    2). 直接生成setter getter的实现,
 
        setter的实现: 把参数的值直接赋值给指定的属性.
        gettter的实现: 直接返回指定的属性的值.
 
 
 
 4. 注意:
 
    1). 如果直接写1个@synthesize
        @synthesize name;
 
    2). 如果指定操作的属性.
        @synthesize name = _name;
 
    3). 生成的setter方法实现中 是没有做任何逻辑验证的 是直接赋值.
        生成的getter方法的实现中 是直接返回属性的值.
 
 
         如果setter或者getter有自己的逻辑验证 那么就自己在类的实现中重写就可以了.
 
 
 5. 批量声明
 
    1). 如果多个@property的类型一致. 可以批量声明.
 
        @property float height,weight;
 
 
    2). @synthesize也可以批量声明.
        @synthesize name = _name,age = _age,weight = _weight,height = _height;
         
     
 
 
 
 
 */

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{
    
    Person *p1 = [Person new];
    
    p1.age = 19;
    
    NSLog(@"p1.age = %d",p1.age);
  
    
    
    
    
    return 0;
}
