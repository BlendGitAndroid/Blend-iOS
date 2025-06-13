/*
  1. @try...@catch异常处理.
 
  2. 类方法.
     a. 声明.
     b. 调用.
     c. 特点.
     d. 注意. 在类方法中不能直接访问属性.也不能使用self直接调用其他的对象方法.
             在类方法的内部创建1个对象 访问这个对象的成员.
             在对象方法中可以直接使用类名来调用类方法.
 
     e. 什么时候
     f. 规范.
 
 
   3. NSString
 
      a. NSString是1个类.
         NSStrng *str = @"jack";
 
      b. 常用的方法.
 
         把C字符串转换为OC字符串.
         拼接的方式拼接字符串.
         长度
         得到指定下标的字符
         相等
         比较.
 
 
    4. 匿名对象.
      a. 匿名对象.
      b. 如何使用匿名对象.
      c. 匿名对象只能使用1次.
      d. 使用场景
 
 
    5.属性的封装.
      a. setter 和 getter 的规范
      b. 封装规范.
      c. 只读 只写.
 
 
    6.类与类之间的关系.
      组合
         1个类是由其他的多个类组合而成的. 电脑 CPU 主板 显卡.....
      依赖
      关联
         1个类拥有另外1个对象.
         Person iPad
      继承
 
 
 
   7. 突击
 
 
 
 */

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    
//    [Person new]->_name = @"杰瑞";
//    
//    NSLog(@"%@",[Person new]->_name);
    
    return 0;
}
