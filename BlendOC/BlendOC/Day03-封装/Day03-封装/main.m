/*
  1. 对象在内存中的存储.
     Person *p1 = [Person new];

  2. nil与NULL
     a. 只能作为指针变量的值 代表不执行任何空间.
 
  3. 多个指针指向同1个对象.
 
 
  4. 分组导航标记.
 
  5. 方法与函数.
 
  6. 犯错列表.
 
  7. 对象与方法.
     1). 类的本质是我们自定义的1个数据类型.
         Person *p1;
 
     2). 类既然是1个数据类型.那么类 类型的 指针变量完全可以当做方法的参数或者返回值
 
     3). 当类作为方法的参数的时候. 在方法执行的时候 参数只是1个指针而已 没有创建对象.
         为参数传值以后. 形参指针和实参指针指向了同1个对象.
 
         在方法的内部通过实参指针去访问对象 访问的就是实参指针指向的对象2.
 
     4). 对象作为方法的返回值.
 
         方法的作用就是创建1个对象 把这个对象的地址返回给调用者.
 
 
     5). 
 
 
 
   8. 表示平面上的1点:
       
 
      x左边 和y坐标.
 
 
 
 
 */

#import <Foundation/Foundation.h>
#import "Person.h"
#import "CZPoint.h"

int main(int argc, const char * argv[])
{
    CZPoint *p1 = [CZPoint new];
    p1->_x = 100;
    p1->_y = 90;
    
    
    CZPoint *p2 = [CZPoint new];
    p2->_x = 200;
    p2->_y = 190;
    
    
    
   double dis =   [p2 distanceWithOtherPoint:p1];
    NSLog(@"dis = %lf",dis);
    
    
    
    
//    Person *p1 = [Person new];
//    p1->_name = @"小明";
//    
//    
//    Dog *wangCai = [Dog new];
//    wangCai->_name = @"旺财";
//    wangCai->_color = @"屎黄色";
//    wangCai->_age = 3;
//    
//    
//    
//    Dog *daHuang = [Dog new];
//    daHuang->_age = 2;
//    
//    
//    
//     BOOL res =   [wangCai compareAgeWithOtherDog:daHuang];
//    res  = [daHuang compareAgeWithOtherDog:wangCai];
//    
//    NSLog(@"res = %d",res);
    
    
//    [p1 liuWithDog:wangCai];
//    
//
//    
//    Dog *d1 = [p1 makeADog];
//    Dog *d2 = [p1 makeADog];
//   
    
    
    
    
    return 0;
}
