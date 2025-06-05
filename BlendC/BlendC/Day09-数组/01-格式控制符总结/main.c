/*
 
 1. printf函数中的占位符/格式控制符
 
 
    格式控制符的作用:
 
    1). 不同类型的数据在变量中存储的形式是不一样的.
        所以在读取变量中的数据的时候,类型不同读取的方式也不同.
 
        为了保证可以正确读取出存储在变量中的数据,
        我们应该使用正确的格式控制符.
 
        %c: 从给定变量的地址开始只读取1个字节.
            然后将这个字节的整数读出来.
            以其为ASCII码还原为字符.
 
        %d: 从给定的变量的地址开始连读4个字节.
 
 
        %f:
 
        变量中的数据是如何存储的那么就应该如何读取,这样才可以拿到正确的数据.
 
 
    

  2. 格式控制符的总结.
 
     int整型
        %d.   读取int整型的数据.以十进制的形式输出. *****
        %o.   读取int整型的数据.以八进制的形式输出.
        %x.   读取int整型的数据.以十六进制的形式输出.
 
        %hd.  short
        %ld   long
        %lld  long long
 
        %u.   unsigned int
        %hu   unsigned short
        %lu   unsigned long  ******
        %llu  unsigned long long
 
 
 
 
     实型:
        float:  %f
        double :  %lf
 
 
     字符型:
        char  %c
 
 
     地址: %p
 
 
 
 
 
 
 
 
 
 
 */
#include <stdio.h>

int main(int argc, const char * argv[])
{

    //
    int num = -16711839;
    printf("num = %c\n",num);
    
    
    
    return 0;
}
