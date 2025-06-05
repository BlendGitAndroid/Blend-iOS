/*
 
 1. 指针可以和整数进行加减运算.
 
 
    指针与整数进行加减运算.
 
    比如指针 + 1;
    并不是在指针地址的基础之上加1个字节的地址. 而是在这个指针地址的基础之上加1个单位变量占用的字节数.
 
 
    如果指针的类型是int*  那么这个时候1代表4个字节地址.
    如果指针的类型是double*  那么这个时候1代表8个字节地址.
    如果指针的类型是float*  那么这个时候1代表4个字节地址.
    如果指针的类型是char*  那么这个时候1代表1个字节地址.
 
 
 
 
 2. 务必要清楚.
    我们用1个指针变量 +/- n
 
 
 */

#include <stdio.h>

int main(int argc, const char * argv[])
{
    
    int num1 = 10;
    int num2 = 20;
    int* p1 = &num2;
    p1++;
    printf("*p1 = %d\n",*p1);
    
    
    
    
    
    
    
//
//    int num1 = 10;
//    int num2 = 20;
//    
//    int* p1 = &num2;
//    //p1中存储的是num2变量的地址.
//    //0x12300
//    
//    int* p2 =  p1 + 1;
//    //p2的值.
//    //0x12301
//    
//    printf("p1 = %p\n",p1);
//    printf("p2 = %p\n",p2);
//    
//    
//    printf("*p2 = %d\n",*p2);
    
    
    
//    double d1 = 12.12;
//    double* p1 = &d1;
//    printf("p1 = %p\n",p1);
//    double* p2 =  p1 + 1;
//    printf("p2= %p\n",p2);
    
    
    
    
    return 0;
}
