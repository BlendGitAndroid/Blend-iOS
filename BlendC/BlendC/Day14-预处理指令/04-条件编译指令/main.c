/*
 
 1. 条件编译指令.
 
    1). 它是1个预处理指令. 所以在预编译阶段执行.
 
    2). 作用:
        默认的情况下,我们所有的C代码都会被编译为二进制代码.
        条件编译指令的作用: 可以让编译器只编译指定部分的代码.
 
 
 2. 条件编译指令的第一种用法.
 
 
    #if 条件
        C代码;
    #endif
 
 
    在预编译的时候,如果条件成立. 就会将其中的C代码编译成二进制指令.
                如果条件不成立.就不会将其中的C代码编译成二进制指令.
 
 
    注意: 条件只能是宏 不能是变量.
 
 
 3. 条件编译指令的第二种用法
 
    #if 条件
        C代码;
    #elif 条件
        C代码
    #elif 条件
        C代码
    #else
        C代码
    #endif
 
 
 
 4. 条件编译指令和if语句的1个对比
 
    1).条件编译指令是1个预处理指令.在预处理阶段执行.
       if语句是C代码. 在程序运行的时候执行.
 
    2). if语句无论如何全部都要被编译为二进制指令.
        条件编译指令: 只会讲符合条件的C代码编译为二进制指令.
 
    3). 实际上.if语句一定程度上可以换成条件编译指令.
        但是.条件编译指令的条件不能是变量参与.只能是宏.
 
 
 
 
 5. 条件编译指令的第三种用法.
 
    #ifdef 宏名
        C代码;
    #endif
 
 
    如果定义了指定的宏.就编译其中的代码否则就算了.
 
    #ifndef 宏名
 
    #endif
 
    如果没有定义指定的宏.就编译其中的代码否则就算了
 
 
 
 
 
 
 */
#include <stdio.h>


//#define N -20


int main(int argc, const char * argv[])
{
 
    //not
#ifndef N
    printf("啦啦啦啦啦1\n");
    printf("啦啦啦啦啦2\n");
    printf("啦啦啦啦啦3\n");
#endif
    
    printf("啦啦啦啦啦4\n");
    printf("啦啦啦啦啦5\n");
    printf("啦啦啦啦啦6\n");
    
    
    
    

//#if N > 0
//    printf("呵呵\n");
//#elif N > 10
//    printf("哈哈\n");
//#elif N > 20
//    printf("嘿嘿\n");
//#else
//    printf("啊啊啊啊啊啊啊\n");
//#endif
//    
    
   
    
    
   
//    int num =10;
//#if N==10
//    printf("AAAAA\n");
//    printf("AAAAA\n");
//    
//    printf("AAAAA\n");
//    
//    printf("AAAAA\n");
//
//#endif
//    
//    
//   
//    printf("AAAAA111111111\n");
//    printf("AAAAA111111111\n");
    
    
    return 0;
}
