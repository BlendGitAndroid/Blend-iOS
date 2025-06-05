/*
 
 1. 全局变量
 
 
    1). 如果要在模块中声明全局变量的
        .h 写全局变量的声明.
        .c 写全局变量的实现.
 
    2). 声明在模块中全局变量.必须要使用extern 或者 static 修饰.
        否则 包含编译 就会报错.
 
    3). 模块中的全局变量如果使用extern修饰,那么这个模块中全局变量就可以在其他模块中访问.
        模块中的全局变量如果使用static修饰,那么这个模块中全局变量就不能在别的模块中正常访问.
 
    4). 如果头文件中全局变量的声明我们使用的是static.那么.c实现文件中也必须要使用static
        如果头文件中全局变量的声明我们使用的是extern 那么.c实现文件中就可以不使用extern了.
 
 
 
 2. 修饰函数.
 
    1). 被static修饰的函数,只能在这个模块的内部调用,无法跨模块调用.
 
    2). 被extern修饰的函数,可以跨模块调用.
 
    3). 函数如果没有写static或者extern那么默认就是extern 外部的.
 
    
        
 
 
 
 
 
 
 */
#include <stdio.h>
#include "itcast.h"




int main(int argc, const char * argv[])
{
 
    
    test1();
    
    
    printf("num = %d\n",num);
    
    
    
    return 0;
}
