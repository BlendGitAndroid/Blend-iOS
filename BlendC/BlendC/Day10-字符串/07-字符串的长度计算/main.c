/*
  
 1. 计算字符数组中存储的字符串的长度是多少.
 
    不能使用sizeof去计算字符数组的长度来得到字符串的长度.
    因为有可能字符串数据存储在字符数组中占了1部分.
 
 
 
 2. 正确的计算方式:
 
    从第1个字节开始记数, 直到遇到'\0'为止.
 
 
     char name[100] = "jafewfrefegrgrgck";
     
     int len = 0;
     
     while (name[len]!='\0')
     {
        len++;
     }
 
 
 
 
 
 
 
 
 
 
 */

#include <stdio.h>

int main(int argc, const char * argv[])
{
    
    char name[100] = "jafewfrefegrgrgck";
    
    int len = 0;
    
    while (name[len]!='\0')
    {
        len++;
    }
    
    
    
    

    printf("len = %d\n",len);
    
    
    
    
    
    return 0;
}
