/*
  1. break
 
     1). 可以使用在switch-case的case代码块中.代表立即结束switch-case结构.
 
     2). break还可以用在循环体中.
         如果在循环体中遇到了break.就会立即结束当前这个循环结构.
        
         在循环体的内部可以直接结束当前循环.
 
         当遇到了break 是立即、马上、立刻、现在、now结束当前循环结构.
         就算break后面还有循环体代码不会执行.
 
 
     3). 结束循环的方式
 
         a. 判断循环条件得到假而结束.
         b. 在循环体的内部使用break结束.
 
 
     4). 应用.
 
 
  2. continue
 
     1). continue只能使用在循环体中.
 
     2). 在循环体中.如果遇到了continue.
         会立即结束本次循环 然后回去判断循环条件.
 
 
 
 
 
 
 
 
 
 
 */

#include <stdio.h>

int main(int argc, const char * argv[])
{
    
    int i = 0;
    while (i < 5)
    {
        i++;
        printf("%d\n",i);
        if(i == 3)
        {
            continue;
        }
        
        printf("---\n");
        
    }
    
    
    
    
//    int zhangHao = 0, miMa = 0;
//
//    while (1)//循环继续的条件.
//    {
//        printf("UserName: ");
//        scanf("%d",&zhangHao);
//        printf("Password: ");
//        scanf("%d",&miMa);
//        //诶.需要结束吗?
//        if(zhangHao == 123456 && miMa == 888888)//循环结束的条件.
//        {
//            break;
//        }
//    }
//    
//    
//    printf("恭喜你,登录成功\n");
    
    
    
    
    
//    int i = 0;
//    while (i < 10)
//    {
//        printf("%d\n",i);
//        if(i == 5)
//        {
//            break;
//        }
//        printf("----\n");
//        i++;
  // }

    
    
    
    
    
    return 0;
}
