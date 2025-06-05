/*
 
 1. 九九表一共有9行.
    所以,毫无疑问,应该写1个循环 循环9次,每次打印1行.
 
    每1行的表达式的个数不一样.
    第1行   1
      2    2
      3    3
      4    4
     5      5
     6      6
     7       7
     8    8
     9    9 
     i    i
 
 
 
 
 */
#include <stdio.h>

int main(int argc, const char * argv[])
{

    
    for(int i = 1; i <= 9; i++)//外层循环,循环1次 要完成1行的打印.
    {
        for(int j = 1; j <= i;j++)
        {
            //'\t' 代表1个制表符 Tab键.对齐
            printf("%d * %d = %d\t",j,i,i*j);
        }
        printf("\n");
    }
    
    
    
    return 0;
}
