/*
  1. 字符串的恒定性.
     一旦创建1个字符串对象,那么这个字符串对象的内容就无法更改, 当我们修改字符串的时候,其实是重新的创建了1个字符串对象.
 
     代码案例:
     NSLog(@"-------------------");
     NSString *str = @""; //@""
     for(int i = 0; i < 50000; i++)
     {
        str = [NSString stringWithFormat:@"%@%d",str,i];
     }
     NSLog(@"-------------------");
     会耗费很长的时间. 每次循环的时候 都会创建1个新的字符串对象.50000个,
     因为字符串的恒定性.
 
 
 2. 如何让这样的大批量的字符串拼接可以更加快速的1点.
 
    1). 慢得原因: 因为字符串的恒定性,每次修改字符串的时候,是重新的创建1个对象,
 
    2). 希望: 有没有一种对象是用来存储字符串的,并且存储在这个对象中的字符串数据可以更改.
 
 
 3. NSMutableString
 
    1). 是Foundation框架中的1个类.从NSString继承.
        所以,NSMutableString对象是用来存储字符串数据的.
 
    
    2). NSMutbaleString在父类NSString的基础之上的做扩展.
 
        存储在NSSMutableString对象中的字符串数据可以更改.具备可变性.
        直接可以改存储在NSMutableStirng对象中的字符串数据,不会新创建对象.
 
 
 4. NSMutableString的用法
   
    1). 既然是1个类,要使用的话,就得创建1个对象.
 
 
        NSMutableString *str = [NSMutableString string];
 
 
    2). 往可变字符串对象中追加字符串.
 
         - (void)appendString:(NSString *)aString;  直接追加内容.
         - (void)appendFormat:(NSString *)format, ... 以拼接的方式往可变字符串对象中追加内容.
 
 
    3). 创建NSMutableString对象的时候,记住下面这样的初始化方式是不行的.
         
        NSMutableString *str = @"jack";
 
        @"jack" 是1个NSString对象,是1个父类对象.
        而str指针是1个NSMutableString类型的 是1个子类类型的.       
        如果通过子类指针去调用子类独有的成员 就会运行错误.
 
 
    4). NSMutableString从NSString继承.
        在使用NSString的地方完全可以使用NSMutableString
 
 
 
  5. 使用NSMutableString来做大批量的字符串拼接.
 
     NSLog(@"~~~~~~~~~~~~");
     NSMutableString *str = [NSMutableString string];
     for(int i = 0; i < 100000; i++)
     {
        [str appendFormat:@"%d",i];
     }
     NSLog(@"~~~~~~~~~~~~");
 
    这个时候 "biu"的一下就结束了. 为什么这么快>? 因为NSMutableString只有1个.每次修改的时候 直接修改的是这个对象中的数据.
     
 
 6. 使用建议
     
    1). 我们平时使用的时候,还是使用NSString. 因为效率高.
        NSString *str1 = @"jack";
        NSString *str2 = @"jack";
 
 
    2). NSMutbaleString: 只在做大批量的字符串拼接的时候才使用.
        大量拼接的时候,就不要去使用NSString 因为效率低下.\
 
        10次以上.
 
 
 
 
 
 
 

 
 
 */
#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{
    
    NSLog(@"~~~~~~~~~~~~");
    NSMutableString *str = [NSMutableString string];
    for(int i = 0; i < 100000; i++)
    {
        [str appendFormat:@"%d",i];
    }
    NSLog(@"~~~~~~~~~~~~");

    
    
    
//    Person *p1 = [Person new];
//
//    NSString *s1 = @"红烧肉";
//    NSMutableString *str = [NSMutableString string];
//    [str appendString:@"sbv"];
//    
//    [p1 eat:str];

    //    NSMutableString *str = @"jack";
//    [str appendString:@"cctv"];
    
    //子类指针
    
    
//    NSMutableString *str = [NSMutableString string];//@""
//    
//    
//    [str appendString:@"jack"];//str  @"jack"
//    [str appendString:@"rose"];//@"jackrose"
//    [str appendString:@"lili"];
//    
//    int age = 10;
//    [str appendFormat:@"我今年%d岁了.",age];
//    
//    
//    
//    
//    NSLog(@"%@",str);
//    
    
    
    
    
    
//    NSLog(@"-------------------");
//    NSString *str = @""; //@""
//    for(int i = 0; i < 50000; i++)
//    {
//        str = [NSString stringWithFormat:@"%@%d",str,i];
//    }
//    NSLog(@"-------------------");

    
    
    
    
    
    return 0;
}
