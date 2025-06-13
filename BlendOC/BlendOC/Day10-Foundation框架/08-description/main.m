/*
  1. 非常重要的问题
        
     %p : 打印的是指针变量的值.
     %@ : 打印的是指针变量指向的对象.
 
 
  2. 使用NSLog函数 %@ 打印对象的原理.
 
     1). 调用传入的对象的description方法.
 
         description是定义在NSObject协议中的1个方法.因为NSObject类遵守了NSObject协议.
         所以,NSObject类中就有这个description方法的实现.
         所以.所有的OC对象中都有description方法
 
         这个方法的返回值是NSString字符串.
 
 
     2). 取到description方法的返回值,然后输出返回值的内容.
 
 
 
     3)  description方法是NSObject类中实现的.
 
         在NSObject类中的description方法是如何实现的呢?
         实现: 返回如下格式的字符串
              @"<对象所属的类名:对象的地址>"
 
 
     4). 如果我们自定义的类不想打印NSObject中description方法的返回值.
         而是我自己定义的额.
 
         这个时候只需要子类重写父类的description方法
 
 
 
 
 
 
 
 
 */

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{
    Person *p1 = [Person new];
    //[p1 description];
    
    //<Person:0x12121212>

    p1.name = @"小明";
    p1.age = 17;
    
    
    
    NSLog(@"%@",p1);
    
//    NSString *str =  [p1 description];
//    NSLog(@"%@",str);
    
    
    
    
    
    
    return 0;
}
