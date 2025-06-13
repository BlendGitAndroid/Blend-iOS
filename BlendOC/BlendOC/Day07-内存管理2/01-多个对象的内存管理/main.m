/*
   3. 出现的僵尸对象错误的原因:
 
      在于.新旧对象是同1个对象.
      解决的方案:  当发现新旧对象是同1个对象的时候.什么都不用做. 
                 只有当新旧对象不是同1个对象的时候 才release旧的 retain新的.
 
 
 
      最终完美版的setter方法的写法 应该这样写
 
      - (void)setCar:(Car *)car
      {
          if(_car != car)
          {
             [_car release];
             _car = [car retain];
          }
      }
 
      - (void)dealloc
      {
         [_car releae];
         [super dealloc];
      }
 
 
  4. 特别注意.
 
     我们每次管理的范围是 OC 对象.
     所以,只有属性的类型是OC对象的时候.这个属性的setter方法才要像上面那样写.
     如果属性不是OC对象类型的 setter方法直接赋值就可以了.
 
 
 */
#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{
   
    Person *p1 = [Person new];
    
    Car *bmw = [Car new];
    bmw.speed =100;
    p1.car = bmw;
    bmw.speed = 200;
    p1.car = bmw;
    
    
    [bmw release];
    
    

    
    
    [p1 release];
    return 0;
}
