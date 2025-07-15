/*
  
 1. OC中的数据类型.
 
     1). OC中支持C语言中的所有的数据类型.
 
          a. 基本数据类型
             int double float char
 
          b. 构造类型 
             数组 结构体  枚举
 
          c. 指针类型
             int *p1;
 
          d. 空类型
             void
 
          e. typedef自定义类型.
 
 
     2). BOOL类型.
 
         1). 可以存储YES或者NO中的任意1个数据.
 
         2). 一般情况下BOOL类型的变量用来存储条件表达式的结果.如果条件表达式成立 那么结果就是YES
             如果条件表达式不成立 结果就是NO
 
 
         3). BOOL的本质.
 
             typedef signed char BOOL; 
             实际上BOOL类型的变量 是1个有符号的char变量.
 
 
             #define YES ((BOOL)1)
             #define NO  ((BOOL)0)
 
             YES  实际上就是 1
             NO  实际上就是 0
 
     3). Boolean
 
         a.Boolean类型的变量可以存储true或者flase
         b.一般情况下Boolean类型的变量用来存储条件表达式的结果.如果条件表达式成立 那么结果就是true
            如果条件表达式不成立 结果过就是false
 
 
         c. 本质
            typedef unsigned char Boolean;
 
             #define true 1
             #define false 0
             
 
 
      4). class 类型. 类.
 
      5). id类型 万能指针.
 
 
      6). nil 与NULL差不多.
 
      7). SEL 方法选择器.
 
      8). block 代码段.
 
 
 
 
 
 
 */

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
   
    //Boolean b1;
    
    
    
    
    int num1 = 10;
    int num2 = 20;
    
    Boolean b1  = 10;
    
    //unsigned char b1 = 0;
//
//    BOOL b2 = YES;
//    
//    char b3 = 1;
    
    
    return 0;
}






















