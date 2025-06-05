/*
 1. 预处理指令.
 2. 文件包含指令.
    #include "文件路径"
    #include <文件路径>
 
    stdio.h
    stdlib.h
    stirng.h
 3. 多文件开发
    1). 当函数比较多的时候 就要考虑分模块开发.
    2). 1个模块至少有2个文件
        .h 头文件 函数的声明
        .c 实现文件 函数的实现.' 
 
    3). 谁要调用这个模块的函数 就只需要包含这个模块的头文件.
 
 4. 进制
    1). 二进制 八进制 十六进制 十进制.
    2). 转换.
    3). 原码 反码 补码
    4). 位运算.
 
 
 5. 变量的细节
 
    1). int 4
        double 8
        float  4
        char    1
 
    2). sizeof
 
       char变量占1个字节 字符常量占据4个字节.
 
    3). 为变变量分配字节的时候.
 
        int 
 
    4). 变量中存储的数据 二进制的补码
        低位存储在低字节 高位存储在高字节.
 
    5). 变量的地址.
        1个变量是由1个或者多个连续字节组合起来.
        变量的地址是低字节的地址.
 
    6). & 取地址运算符.
 
         &age;
 
 
    7). %p
 
 
 6. int类型的修饰符.
    int
    short 2
    long  4/8
    long long  8
    
 
    符号.
 
    unsigned int num;
 
 
 7. char
 
    char ch = 'a';
 
 
 
 
 
 */

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
    return 0;
}
