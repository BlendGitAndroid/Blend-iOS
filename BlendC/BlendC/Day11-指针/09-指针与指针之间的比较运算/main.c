/*
 1. 指针与指针之间可以做比较运算.
 
    >
    >=
    <
    <=
    ==
    !=
 
    都可以作用于两个指针之间.
 

 
  2. 为变量分配字节空间的时候.
     从高地址向低地址分配的嘛.
 
 
     > >= < <=  它可以判断两个指针指向的变量的地址 谁在高字节 谁在低字节.
 
 
  3. 也可以使用==、!= 来判断两个指针指向的地址是不是为同1个地址.
 
 
 
 
 
 */

#include <stdio.h>

int main(int argc, const char * argv[])
{

    
    int num1 = 10; //在高地址.
    int num2 = 20;// 在低地址.
    
    int* p1 = &num1;
    int* p2 = p1;
    
    
    int res = p1 == p2; //p2的值是否大于p1的值.
    
    
    printf("res = %d\n",res);
    
    
    
    
    
    
    
    return 0;
}
