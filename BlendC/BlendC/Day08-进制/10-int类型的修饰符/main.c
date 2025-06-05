/*
 1. 一个int类型的变量在内存中占据4个字节.
    所以.1个整型的变量中可以保存 正负21e之间的整数.
 
    存在的问题: 有一些大于int范围的整数就无法存储.
              
 
    0  200
    int age = 4个字节.
 
    思考: 指定int类型的变量所占用的字节数.
 
 
 2. int类型的修饰符.
 
    1). 作用: 指定int类型的变量在内存中占用的字节数.
 
    2). short修饰符:
        在声明1个int类型的变量的时候,可以使用short来修饰.
 
        short int num = 10;
 
        被short修饰的int类型的变量在内存中只占据2个字节. 16位.
        最高为表示符号位,实际上表示数据的之后15位.
        所以,最小值是: -32768 最大值 32767
 
        a. 要输出short修饰的int类型的变量的值,应该使用%hd来输出.
        b. 如果要声明1个short int类型的变量,那么可以省略int 直接写short;
 
           short  num = 10;
 
    3).long修饰符
        在声明1个int类型的变量的时候,可以使用long来修饰.
        long int num = 10;
 
        在32位的操作系统下,被long修饰的整型变量占据4个字节.
        在64位的操作系统下,被long修饰的整型变量占据8个字节.
 
        OS X系统 还有 iOS系统都是64位的.
 
    
        8个字节. 64位.
        最高为表示符号为: 63位表示数据.
 
        a. 输出该类型的变量应该使用 %ld 占位符.
        b. 声明的时候可以省略int
 
           long num = 10;
 
    4). long long 修饰符.
        
        在声明1个int类型的变量的时候,可以使用long long来修饰.
        long long int num = 10;
 
        无论在32位系统还是64位系统都是占据8个字节.
 
 
        a. 输出该类型的变量的值使用 %lld 占位符.
        b. 声明这个类型的变量的时候,int可以省略
           long long num = 10;
 
    
 
 
 3. unsigned修饰符
 
    1). 我们刚刚讲的
        int
        short
        long 
        long long
        这些变,全部都是最高为表示符号位.实际上表示的数据少了1位. 因为最高位用来表示符号位了.
 
       
 
        存储1个人的年龄.
        int 4个字节 31位. 
        最高位不要用来表示符号位,而是来参与数据的表示.
        这个时候就有32位来表示数据.
        最大值就翻了1倍.
        但是最小值就成了0 .
 
    
    2). 声明int变量的时候为这个int变量加1个修饰符unsigned
        表示这个变量的最高位不要用来表示符号 而是参与到数据的表示之中.
 
 
        unsinged int num = 100;
        那么这个变量最小值就成了0.因为没有正负
        但是最大值却比原来翻了两倍.
 
 
        使用%u输出unsinged int变量的值.
 
 
    3). 其他的变量可以不可以使用unsigned
 
        unsigned int  -->  %u
        unsigned short --> %hu
        unsigned long  ---> %lu
        unsigned long long --> %llu
 
 
 
 
 4. signed.
 
    表示最高为来作为符号位,
    实际上默认就是这样的.
    signed 写不写都是一样.
 
 

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 */

#include <stdio.h>

int main()
{
    
    signed int num = 10;
    
    
    
//    unsigned short num = 10;
//    //0 65535
//    printf("%hu\n",num);
    
    
    
    
//    unsigned int num = 100;
//    
//    printf("%u\n",num);
   
//    long long int num  = 1000;
//    
//    printf("%lld\n",num);
//    
//    short num = 10;
//    
//    
//    
//    
//    printf("%lu\n",sizeof(num));
    
   
   
//    long  num = 10;
//    
//    printf("num = %ld",num);
    
    
    
    
    return 0;
}
