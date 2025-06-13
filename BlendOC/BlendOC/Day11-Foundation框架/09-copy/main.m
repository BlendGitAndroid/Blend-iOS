/*
 
  1. 无论在MRC还是ARC下,如果属性的类型是NSString类型的. @property参数使用copy.
 
 
  2. copy 复制
 
     1). copy是1个方法.定义在NSObject类之中. 作用:拷贝对象.
 
         NSString ----> copy ---> 不可变字符串  没有产生新对象,而是直接将对象本身的地址返回. 这种拷贝我们叫做浅拷贝
         NSMutableString --> copy --> 是1个不可变的字符串对象 .  有产生1个新对象.这样的拷贝我们叫做深拷贝.
 
 
     2). mutableCopy.定义在NSObject类之中. 作用:拷贝对象.
 
         NSString  ---> mutableCopy --> 可变字符串对象. 深拷贝.
         NSMutableString --> mutableCopy --> 可变字符串对象 深拷贝.
 
 
     这是字符串的对象拷贝特点.
 
  3. 字符串对象拷贝的引用计数器的问题.
 
     1). 若字符串对象存储在常量区中. 存储在常量区的数据是不允许被回收的.
         所以存储在常量区的字符串对象的引用计数器是1个超大的数.并且retain和release无效.
 
     2). 若字符串存储在堆区. 这个字符串对象和普通的对象一样的.引用计数器默认是1.
 
     3). 字符串对象如果是浅拷贝. 会将对象的引用计数器+1
 
         字符串对象如果是深拷贝. 原来的对象的引用计数器不变.新拷贝出来的对象的引用计数器为1.
 
 
  4. 
 
 
 
 
 
 
 */

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{
    
    Person *p1 = [Person new];
    
    
    //需求:将str赋值给p1.name属性以后.
    //再修改str的值 不要影响p1.name
    //解决:  在setter方法赋值的时候.将传进来的对象先拷贝1份.
    //NSMutableString *str = [NSMutableString stringWithFormat:@"jack"];
    
    NSString *str = @"jack";
    
    p1.name = str;
    
    //[str appendString:@"rose"];
    
    str = @"rose";
    
    NSLog(@"p1.name = %@",p1.name);
    
    
    
    
    
    
    
//    Person *p1 = [Person new];
//    
//    NSString *str = @"jack";
//    
//    p1.name = str;
//    
//    str = @"rose";
//    
//    NSLog(@"p1.name = %@",p1.name);
//    
    
    
    
    
    
    
    
    
//    NSString *str1 = [NSString stringWithFormat:@"jack"];
//    
//    NSLog(@"%lu",str1.retainCount);
//    
//    NSString *str1 = @"jack";
//    NSLog(@"%lu",str1.retainCount);
//    [str1 retain];
//    NSLog(@"%lu",str1.retainCount);
//
//    
//    
//    NSString *str2 = [str1 copy];
    
    
//    NSMutableString *str1 = [NSMutableString stringWithFormat:@"jack"];
//    NSMutableString *str2 =  [str1 mutableCopy];
//    
//    [str2 appendString:@"11"];
//    
//        NSLog(@"str1 = %@",str1);
//        NSLog(@"str2 = %@",str2);
//    
//        NSLog(@"str1 = %p",str1);
//        NSLog(@"str2 = %p",str2);
//    
    
//    NSString *str1 = @"jack";
//    NSMutableString *str2  =  [str1 mutableCopy];
//    [str2 appendString:@"111"];
//    
//    NSLog(@"str1 = %@",str1);
//    NSLog(@"str2 = %@",str2);
//    
//    NSLog(@"str1 = %p",str1);
//    NSLog(@"str2 = %p",str2);
    
    
    
//    NSString *str1  = @"jack";
//    
//    NSString *str2 =  [str1 copy];
//    
//    
//    NSLog(@"str1 = %@",str1);
//     NSLog(@"str2 = %@",str2);
//    
//    NSLog(@"str1 = %p",str1);
//    NSLog(@"str2 = %p",str2);

    
//    NSMutableString *str1 = [NSMutableString stringWithFormat:@"jack"];
//    NSString *str2 =  [str1 copy];
//    
//    //[str2 appendString:@"jjj"];
//    
//    NSLog(@"str1 = %@",str1);
//    NSLog(@"str2 = %@",str2);
//    
//    NSLog(@"str1 = %p",str1);
//    NSLog(@"str2 = %p",str2);
    
    

    
    
    
    
    return 0;
}
