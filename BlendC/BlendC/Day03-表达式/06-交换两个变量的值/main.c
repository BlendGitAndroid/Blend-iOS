/*
  1. 交换两个变量的值.
 
     1). 声明第三方临时变量.来交换.
 
         转圈.
 
         int a = 10, b = 20;
         int c = a;
         a = b;
         b = c;
 
 
 
     2). 两数相加再相减.
 
         int a = 10, b = 20;
 
         a = a + b;
         b = a - b;
         a = a - b;
 
 
     3). 使用异或运算交换两个变量的值.
 
         int num1 = 100;
         int num2 = 200;
         
         num1 = num1 ^ num2;
         num2 = num1 ^ num2;
         num1 = num1 ^ num2;
 
 
 
 
         
 
 
 
 
 */
#include <stdio.h>

int main(int argc, const char * argv[])
{

    int num1 = 100;
    int num2 = 200;
    
    num1 = num1 ^ num2;
    num2 = num1 ^ num2;
    num1 = num1 ^ num2;
    
//    num1 = num1 + num2;//num1 = 300
//    num2 = num1 - num2;//num2 = 100;
//    num1= num1 - num2;//num1 = 200;
    
  
//    int temp = num1;
//    num1 = num2;
//    num2 = temp;
//    
    
    printf("num1 = %d num2 = %d \n",num1,num2);
    
    
    
    
    
    
    
    return 0;
}
