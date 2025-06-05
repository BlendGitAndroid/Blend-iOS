/*
  1. 循环应用之七: 计数.
 
     1). 记录循环了多少次.
     2). 记录了某个条件满足了多少次.
 
 
     声明1个整型的变量,用来记录循环的次数.
     每循环1次自增.
 
 
 
  2. 循环的应用之八: 穷举.
     1个1个的挨个试.
 
 
     产生1个1-100的随机数.
 
     写1段代码.判断这个数是多少.
 
 
 
 
     案例:   有1篮鸡蛋. 至少有2个.
            两个两个的数 多1个 三个三个数 多1个 四个四个数 多1个.
 
            翻译: 有1个数 这个数至少是2. 这个数模以2等于1 模以3等于1 模以4等于1.
 
 
    有100多个人排队.
    3个人1组 多1人
    4       2
    5       3
 
 
 
 
 
 
 
 
 
 

 
 
 */

#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char * argv[])
{
    
    int i = 2;
    while (1)
    {
        if(i % 2 == 1 && i % 3 == 1 && i % 4 == 1)
        {
            printf("%d\n",i);
            break;
        }
        i++;
    }
    
//    
//    int num = arc4random_uniform(100) + 1;
//    printf("num = %d\n",num);
//    
//    
//    int i = 1;
//    while (1)
//    {
//        if(num == i)
//        {
//            printf("%d\n",i);
//            break;
//        }
//        i++;
//    }
    
    
    
    
    
//    //1 - 100之间的3的倍数.
//    
//    int count = 0;
//    int i = 1;
//    while (i <= 100)
//    {
//        if(i % 3 == 0)
//        {
//            count++;
//        }
//        i++;
//    }
//    
    
    
    
    

    
    //输入用户名和密码,只要不正确就重新输入 直到输入正确为止.
    //当登录成功以后,显示输入了多少次.
    
//    int zhangHao = 0 , miMa = 0;
//    
//    
//    int times = 0;
//    
//    while (zhangHao != 123456 || miMa != 888888)
//    {
//        printf("请输入账号 :");
//        scanf("%d",&zhangHao);
//        printf("请输入密码: ");
//        scanf("%d",&miMa);
//        times++;
//    }
//    
//    printf("登录成功 你一共尝试了%d次\n",times);
    
    
    
    
    
    
    
    
    
    return 0;
}
