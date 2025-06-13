/*
 
  1. 我们之前在C中学习的函数,就叫做函数.
 
      void test()
      {
 
      }
 
 
  2. 在OC类中写的方法.就叫做方法.
 
      - (void)sayHi;
 
 
 
  3. 相同点:
 
     都是用来封装1段代码的. 将1段代码封装在其中, 表示1个相对独立的功能
     函数或者方法只要被调用.那么封装在其中的代码就会被自动执行.
 
 
  4. 不同点:
     
     1). 语法不同.
     2). 定义的位置不一样.
         OC方法的声明只能写在@interface的大括弧的外面,实现只能写在@implementation之中.
         函数除了在函数的内部和@interface的大括弧之中 其他的地方都是可以写.
 
 
         就算把函数写在类中 这个函数仍然不属于类 所以创建的对象中也没有这个函数.
         注意; 函数不要写到类中.虽然这样是可以的 但是你千万不要这么做 因为这么做是极度的不规范的.
 
 
     3). 调用的方式也不一样.
 
         函数可以直接调用.
         但是 方法必须要先创建对象 通过对象来调用.
 
 
     4). 方法数是属于类的. 有1个伐木累. 有个归属感.
         而函数是1个孤魂野鬼, 就是1个独立的.
 
 
 
 
 */
#import <Foundation/Foundation.h>

void test();
void test()
{
    NSLog(@"11111");
    NSLog(@"11111");
    NSLog(@"11111");
    NSLog(@"11111");
}

@interface Person: NSObject
{
 
}

- (void)hh;
@end


@implementation Person

- (void)hh
{
    NSLog(@"呵呵");
}


@end


int main(int argc, const char * argv[])
{
    test();
    
    Person *p1 = [Person new];
    [p1 hh];

    
    
    return 0;
}
