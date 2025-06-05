/*
 
  1. return关键字用在函数体之中的.
 
     在函数体中如果遇到了return关键字. 就会立即结束这个函数的执行.
 
 
     函数的结束有两种方式:
     自然结束: 当函数体执行完毕之后,就会结束这个函数
     return:  可以使用return关键字来提前结束函数.
 
 
  2. 当我们的函数需要提前结束的时候 就可以使用return关键字.
 

 
 
 
 
 
 */
#include <stdio.h>

void test()
{
    printf("阿拉啦啦啦啦啦啦1\n");
    printf("阿拉啦啦啦啦啦啦2\n");
    printf("阿拉啦啦啦啦啦啦3\n");
    printf("阿拉啦啦啦啦啦啦4\n");
    return;
    printf("阿拉啦啦啦啦啦啦5\n");
    printf("阿拉啦啦啦啦啦啦6\n");
    printf("阿拉啦啦啦啦啦啦7\n");
    printf("阿拉啦啦啦啦啦啦8\n");
}

void panDuanOuShu(int num)
{
    if(num % 2 == 0)
    {
        printf("是1个偶数\n");
        return;
    }
    printf("不是1个偶数\n");
}


int main(int argc, const char * argv[])
{

    
    panDuanOuShu(11);
    
    
    return 0;
}
