/*
  1. 要想将1个变量的值在自身的基础之上增加指定的数.
 
     int num = 10;
 
     num = num + 2; //num的值就是在自身的基础之上+2
 
 
  2. 让1个变量的值再自身的基础之上增加指定的数 简写方式.
 
     使用复合赋值运算符: +=
 
     int num = 10;
     num += 2; //完全等价于 num = num + 2;
 
 
  3. -= 
     *= 
     /= 
     %=
 
 
  4. 如果以后你想要改变1个变量的值 是在自身的基础之上做改变的 那么就可以使用复合赋值运算符.
 
 
 
 
 
 */

#include <stdio.h>

int main(int argc, const char * argv[])
{

    int num = 10;
    
    printf("num = %d\n",num);
    
    //num += 2;//num = num + 2;

    
    //num -= 2;// num = num - 2;
    //num /= 2;//num = num / 2
    //num *= 2;// num = num * 2;
    
    num %= 2; // num = num % 2;
    
    
    printf("num = %d\n",num);
    

    
    
    
    
    return 0;
}
