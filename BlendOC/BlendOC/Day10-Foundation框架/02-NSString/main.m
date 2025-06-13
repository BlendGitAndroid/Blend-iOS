/*
  1. 框架: 就是系统(苹果)或者第三方(其他的一些高手)事先写好了一些很牛X功能的类.
          把这些类交给我们使用.这些类的集合我们叫做框架.
 
          框架中有很多很多功能相似的类. 函数库
 
     Foundation框架:  是1个包 这里面有很多类、函数、定义了一些数据类型.
                      这个框架中的类都是一些最基础的类. NSString NSObject
                     其他的框架都是基于Foundation框架的.
 
     UIKit.
     AVFoundation.
     ......
 
 
  2. Foundation框架中的最常用的类. 简单的爆.量大.

    
 
  3. NSString
 
     1). NSString是1个数据类型.保存OC字符串的.
         NSString的本质是1个类.既然是1个类.
 
         所以,最标准的创建NSString对象的方式:
         NSString *str1 = [NSString new];
         NSString *str2 = [[NSString alloc] init];
         NSString *str3 = [NSString string];
 
         使用这种方式创建的字符串是1个空的字符.  @""
 
         NSString对象就是用来存储字符串.
 
 
     2). NSString是OC中最常用的1个类了.所以OC提供了一种更为快速的创建字符串对象的方式.
         使用前缀@
 
         @"jack"; 本质上这是1个NSString对象.这个NSString对象中存储的是"jack"这个字符串.
 

        NSString *str1 = @"rose";
 
        1).  @"rose"本质上是1个NSString对象,这个对象中存储的是字符串"rose".
        2).  将这个字符串对象的地址返回赋值给str1指针.
 
 
 
 
         格式控制符%p: 打印指针变量的值.打印地址.
                  %@:  打印指针指向的对象.
 
 
  4. NSString的恒定性.
 
     1). 当我们使用简要的创建字符串对象的时候.也就是使用1个OC字符串常量来初始化字符串指针的时候.
         这个字符串对象是存储在 常量区(数据段) 的.
 
         NSString *str = @"jack";
 
         当我们调用NSString的类方法来创建对象的时候.
 
         NSString *str =  [NSString stringWithFormar:@"jack"];
         NSString *str1 = [NSString new];
         创建的字符串对象是存储在堆区.
 
 
     2). 当在内存中创建1个字符串对象以后.这个字符串对象的内容就无法更改.
         当我们重新为字符串指针初始化值的时候.并不是修改原来的字符串对象 
         而是重新的创建1个字符串对象 将这个字符串对象的地址重新复制给字符串指针变量.
 
 
     3). 当系统准备要在内存中创建字符串对象的时候.会先检查内存中是否有相同内容的字符串对象.
         如果有,直接指向. 如果没有才会重新创建.
 
 
     4). 存储在常量区的数据不会被回收. 所以存储在常量区的字符串对象也不会被回收.
 
 
 
 
 
 */

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    
//    NSString *str1 = [NSString new];
//    NSLog(@"str1 = %p",str1);
//
//    str1 = nil;
//    NSString *str2 = [NSString new];
//     NSLog(@"str2 = %p",str2);
    
    
    
    
    
    
//    NSString *str1 = @"jack";
//    NSLog(@"str1 = %p",str1);
//    str1 = nil;
//    NSString *str2 = @"jack";
//    NSLog(@"str2 = %p",str2);
//    
    
    
    
//    NSString *str0 = [NSString new];//@""
//    NSString *str1 = [NSString new];//@""
//    NSString *str2 = @"";
//    
//    NSLog(@"str0 = %p  str1 = %p",str0,str1);
    
    
//    NSString *str1 = @"jack";
//    NSLog(@"str1 = %p",str1);
//    str1 = @"rose";
//    NSLog(@"str1 = %p",str1);
//    
//    
//    NSString *str2 = @"rose";
//    NSLog(@"str2 = %p",str2);
//    
    
    
    
//    NSString *str2 = @"rose";
//    NSLog(@"\nstr1 = %p\nstr2 = %p",str1,str2);
    
    
    
    
//    NSString *str1 = [NSString new];
//    NSString *str2 = [[NSString alloc] init];
//    NSString *str3 = [NSString string];
//
//    
//    NSString *str4 = @"jack";
//    NSLog(@"str4 = %@",str4);
//    
    
    
    
    
    
    
    
    return 0;
}
