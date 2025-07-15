/*
  1. OC相对于C
     a. 在C的击基础之上新增了1小部分面向对象的语法.
     b. 将C的复杂的、繁琐的、可恶的语法封装的更为简单.
 
     c. OC完全兼容C语言.
 
 
  2. OC程序的源文件的后缀名是.m   m代表message 代表OC中最重要的1个机制  消息机制.
     C程序的源文件的后缀名.c
 
 
  3. main函数仍然是OC程序的入口和出口.
 
     int类型的返回值 代表程序的结束状态.
     main函数的参数: 仍然可以接收用户在运行程序的时候传递数据给程序.
                   参数也可以不要 。
 
 
  4. #import指令.
 
     1).以#号开头,是1个预处理指令.
 
     2).作用:  是#inlcude指令的增强版. 将文件的内容在预编译的时候拷贝写指令的地方.
 
     3).增强:  同1个文件无论#import多少次,只会包含1次.
 
              如果#include指令要实现这个效果 就必须要配合条件编译指令来实现.
              而#import指令只需要直接包含就可以 其他什么都不用作.
 
     4).简要原理: #import指令在包含文件的时候,底层会先判断这个文件是否被包含  如果被包含就会略过 否则才会包含.
 
 
 
  5. 框架
     1). 是1个功能集  苹果或者第三方事先将一些程序在开发程序的时候经常要用到的功能事先写好.把这些功能封装在1个1个的类或者函数之中.
         这些函数和类的集合就叫做框架.
 
         有点像C语言的函数库.
 
 
     2). Foundation框架.
 
 
         Foundation: 基础 基本. 这个框架中提供了一些最基础的功能  输入和输出. 一些数据类型.
 
 
         Foundation.h的路径:
 
         /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/System/Library/Frameworks/Foundation.framework/Versions/C/Headers/Foundation.h
 
 
         Foundation.h这个文件中包含了Foundation框架中的其他的所有的头文件.
         所以,我们只要包含Foundation.h 就相当于包含了Foundation框架中所有的头文件.
         那么Foundation框架中的所有的函数和类就可以直接使用.
 
 
 
  6. @autoreleasepool是自动释放池.
 
     你只需要知道这个是1个自动释放池.
 
     你可以将代码写在自动释放池之中 或者干脆把这个自动释放池删除 不会有任何影响.
 
 
 
  7. NSLog函数.
 
    1). 作用: 是printf函数的增强版. 向控制台输出信息.
 
    2). 语法: 
             NSLog(@"格式控制字符串",变量列表);
 
        最简单的语法:
             NSLog(@"要输出的信息");
 
 
    3). 增强:
        a. 输出一些调试相关信息.
           2020-07-01 12:40:52.628 Day01-OC基础语法[784:210576] Hello,World!
 
           执行这段代码的时间.
           程序的名称.
           进程编号.
           线程编号.
           输出的信息.
 
 
        b. 会自动换行.在输出完信息之后 会自动换行.
 
 
        c. OC中其实新增了一些数据类型. NSLog函数不仅仅可以输出C数据类型变量的值还可以输出OC新增的数据类型的变的值.
 
 
    4).用法和printf函数差不多. 一样可以输出变的值 并且占位符和用法都一样
 
 
    5).使用注意:
       a. NSLog函数的第1个参数前面必须要加1个@符号.
 
       b. 如果手贱在字符串的末尾加了1个'\n'代表换行 那么函数的自动换行功能就会失效.
 
 
 
 
   ------
   忘记#include 用#import
   忘记printf 用NSLog
 
 
 
 8. 字符串
 
    1). C语言的字符串的存储方式
 
        a. 使用字符数组存储
 
        b. 使用字符指针
 
 
    2). OC中设计了1个更为好用的用来存储字符串的1个类型.  NSString
 
 
        NSString 类型的指针变量 专门用来存储OC字符串的地址.
 
 
    3). OC的字符串常量必须要使用1个前缀@符号.
 
        "jack" 这是1个C语言的字符串.
 
        @"jack" 这是1个OC的字符串常量.
 
 
        NSString类型的指针变量,只能存储OC字符串的地址.
 
        NSString *str = @"jack";
 
 
    4).总结
 
       a. 在OC中专门设计了1个NSString类型来存储字符串.
       b. 字符串分为C字符串和OC字符串.
 
          字符串如果没有@前缀 那么这个字符串常量就是1个C字符串.
          字符串如果有@前缀  那么这个字符串常量就是OC字符串.
 
          @"jack"
          "rose"
 
          所以,OC字符串常量的前面必须要加1个@符号.
 
 
       c. NSString类型的指针变量 只能存储 OC字符串.
 
          NSString *str = @"jack";
 
 
    5). 注意
      
       1). NSLog函数的第1个参数是1个OC字符串,所以NSLog函数的第1个实参应该以@符号开头.
 
 
       2). 如果要使用NSLog函数输出OC字符串的值,那么使用占位符%@
 
 
 
 9. NS前缀.
 
 
    NextStep  ---> Cocoa ---> Foundation框架之中.
 
 
 10. @符号
 
     1). 将C字符串转换为OC字符串.
 
        "jack"   @"jack"
 
 
     2). OC中的绝大部分的关键字都是以@符号开头.
 
 
 
 11. 注释:
 
     和C语言的注释一模一样.分为单行注释和多行注释.
 
 
 
 12. 函数的定义和调用.
 
     与C语言的函数的定义和调用是一样的.
 
 
 
 
 
 
 
 */

#import <Foundation/Foundation.h>

void test();



int main()
{
    
    test();
   

    
    
//    // NSLog(@"jack");
//    
//    NSString *str = @"jack";
//    
//    
//    NSLog(@"大家好,我叫%@",str);
    
    
    return 0;
}


void test()
{
    NSLog(@"今天是第1天的OC课程,大家还好吗");
}





















