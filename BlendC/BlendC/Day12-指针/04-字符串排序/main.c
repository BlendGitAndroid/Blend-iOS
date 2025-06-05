/*
 
 
 1. 字符串数组的排序.
 
 
 
    将字符串数组中的每一个字符串以 字母的顺序排序.
 
 
 
 
 
 2. 存储指针的数组每一个元素的类型是1个指针
    而每1个指针都是占据8个字节.
 
    我们在求存储指针的数组的长度: 用总字节数 / 8.
 
 
 
 
 
 
 */

#include <stdio.h>
#include <string.h>

int main(int argc, const char * argv[])
{

    char *countries[] =
    {
        "Nepal",
        "Cambodia",
        "Afghanistan",
        "China",
        "Singapore",
        "Bangladesh",
        "India",
        "Maldives",
        "South Korea",
        "Bhutan",
        "Japan",
        "Sikkim",
        "Sri Lanka",
        "Burma",
        "North Korea",
        "Laos",
        "Malaysia",
        "Indonesia",
        "Turkey",
        "Mongolia",
        "Pakistan",
        "Philippines",
        "Vietnam",
        "Palestine"
    };

    
    
//    //1.  先计算这个数组的长度.
//   int len =   sizeof(countries) / sizeof(countries[0]);
//    
//   //2.使用冒泡排序
//    for(int i = 0; i < len - 1; i++)
//    {
//        for(int j = 0; j < len - 1 - i; j++)
//        {
//            
//            int res =  strcmp(countries[j],countries[j+1]);
//            if(res > 0) //说明j 比j+1小.
//            {
//                char* temp = countries[j];
//                countries[j] = countries[j+1];
//                countries[j+1] = temp;
//            }
//            
//        }
//    }
//    
//    
//    //3.打印结果.
//    
//    for(int i = 0; i < len;i++)
//    {
//        printf("%s\n",countries[i]);
//    }
    
    
    
    int len =   sizeof(countries) / sizeof(countries[0]);
    
    for(int i = 0; i < len - 1; i++)
    {
        for(int j = i + 1; j < len; j++)
        {
           unsigned long len1 =  strlen(countries[i]);
           unsigned long len2 =  strlen(countries[j]);
           if(len1 < len2)
           {
               char* temp = countries[i];
               countries[i] = countries[j];
               countries[j] = temp;
           }
        }
    }

    
    for(int i = 0; i < len;i++)
    {
        printf("%s\n",countries[i]);
    }
    
    
    
    
    
    
    
    
    return 0;
}
