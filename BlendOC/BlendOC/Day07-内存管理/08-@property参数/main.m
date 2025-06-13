/*
  1. 在MRC的开发模式下.1个类的属性如果是1个OC对象类型的.那么这个属性的setter方法就应该按照下面的格式写.
    
     - (void)setCar:(Car *)car
     {
         if(_car != car)
         {
            [_car release];
            _car = [car retain];
         }
     }
 
     还要重写dealloc方法.
     - (void)dealloc
     {
        [_car release];
        [super delloc];
     }
 
     如果属性的类型不是OC对象类型的.不需要像上面那样写. 还是像之前那样写就OK了.
 
 
  2. @property
 
     1). 作用
         a. 自动生成私有属性.
         b. 自动生成这个属性的getter setter方法的声明.
         c. 自动生成这个属性的getter setter方法的实现.
 
         特别播报:
         生成的setter方法的实现中,无论是什么类型的,都是直接赋值.
 
 
 
  3. @property参数.
 
     1). @property可以带参数的.
         @property(参数1,参数2,参数3......)数据类型 名称;
 
 
     2). 介绍一下@property的四组参数.
 
         a. 与多线程相关的两个参数.
            atomic、nonatomic.
 
         b. 与生成的setter方法的实现相关的参数.
            assign、retain.
 
         c. 与生成只读、读写相关的参数       
            readonly readwrite
 
         d. 是与生成的getter setter方法名字相关的参数.
            getter  setter
 
 
 
  4. 介绍与多线程相关的参数.
 
     atomic: 默认值. 如果写atomic,这个时候生成的setter方法的代码就会被加上一把线程安全锁.
             特点: 安全、效率低下.
     nonatomic: 如果写nonatomic 这个时候生成的setter方法的代码就不会加线程安全锁.
             特点: 不安全,但是效率高.
 
     建议: 要效率. 选择使用nonatomic  在没有讲解多线程的知识以前 统统使用nonatomic
 
 
 
  5. 与生成的setter方法的实现相关的参数.
 
     assign: 默认值 生成的setter方法的实现就是直接赋值.
 
     retain: 生成的setter方法的实现就是标准的MRC内存管理代码.
             也就是. 先判断新旧对象是否为同1个对象 如果不是 release旧的   retain新的.
 
     当属性的类型是OC对象类型的时候,那么就使用retain
     当属性的类型是非OC对象的时候,使用assign.
 
     千万注意:
     retain参数.只是生成标准的setter方法为标准的MRC内存管理代码 不会自动的再dealloc中生成relase的代码.
     所以, 我们还要自己手动的在dealloc中release
 
 
 
  6. 与生成只读、读写的封装.
 
     readwrite: 默认值.代表同时生成getter setter
     readonly: 只会生成getter 不会生成setter
  
 
 
  7. 生成getter、setter方法名称相关的参数.
 
     默认情况下.@property生成的getter setter方法的名字都是最标准的名字.
     其实我们可以通过参数来指定@property生成的方法的名字.
 
     getter = getter方法名字 用来指定@property生成的getter方法的名字.
     setter = setter方法名字.用来指定@property生成的setter方法的名字. 注意.setter方法是带参数的 所以要加1个冒号.
 
     
     记住:如果使用getter setter修改了生成的方法的名字.
          在使用点语法的时候.编译器会转换为调用修改后的名字的代码.
 
     修改生成的getter setter方法名字. 因为默认情况下生成的方法的名字已经是最标准的名字了.
     所以.一般情况下不要去改.
 
 
     1). 无论什么情况都不要改setter方法的名字. 因为默认情况下生成的名字就已经是最标准的了.
     2). 什么时候修改getter方法的名字.当属性的类型是1个BOOL类型的时候.就修改这个getter的名字以is开头 提高代码的阅读性.
 
 
 
 ------总结-------
 
 1. 与多线程相关的参数: 用nonatomic
 2. 与生成的setter方法实现相关的参数
    属性的类型是OC对象的时候 使用retain
    属性的类型是非OC对象的时候 使用assign
 
 3. 只读 读写.  
    如果你希望生成的封装是只读封装  那么就使用readonly
    如果希望读写封装 readwrite
 
 4.  1). 无论什么情况都不要改setter方法的名字. 因为默认情况下生成的名字就已经是最标准的了.
     2). 什么时候修改getter方法的名字.当属性的类型是1个BOOL类型的时候.就修改这个getter的名字以is开头 提高代码的阅读性.
 
 ------使用参数注意-----
 1. 同1组参数只能使用1个.
    getter setter可以同时使用.
 
 2. 参数的顺序可以随意.
 
 */

#import <Foundation/Foundation.h>
#import "Person.h"


int main(int argc, const char * argv[])
{
    
    
    Person *p1 = [Person new];
    
    p1.goodMan = YES;
    
    
    
    BOOL flag =  p1.isGoodMan;
    
//    p1.age = 10;
//    //[p1 xyz:10];
//    NSLog(@"p1.age = %d",p1.age);
    
    
//    [p1 xyz:19];
//    
//    int age =  [p1 xxx];
//    
//    NSLog(@"age = %d",age);
//    
    [p1 release];

//    Person *p1 = [Person new];
//    Car *bmw = [Car new];
//   
//    p1.car = bmw;
//    
//    [p1 drive];
//    
//    
////    Car *benz = [Car new];
////    
////    p1.car = benz;
////    
////    
////    [benz release];
//    [bmw release];
//    
//    
//    p1.car = bmw;
//    
//    
//    
//    [p1 release];
//    // p1.car = [Car new];
//    
    
    
    
    
    return 0;
    
}
