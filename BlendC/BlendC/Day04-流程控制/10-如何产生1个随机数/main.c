/*
 
  如何产生1个随机数呢?
 
 
  1). 先引入1个系统头文件.
 
      #include <stdlib.h>
 
 
  2). 调用 arc4random_uniform 函数.
      在其中传入1个整数n 就会返回 0 --> (n-1)的随机数.
 
      int num =  arc4random_uniform(10);
 
      就会产生0-9的随机数. 并赋值给num
 
 
  3). 如何产生1个指定范围的随机数: 
 
 
      int num =  arc4random_uniform(最大数-最小数+1) + 最小数;
 
 
 
 
 
 
 */

#include <stdio.h>
#include <stdlib.h>


int main(int argc, const char * argv[])
{
    //1 - 33
    int num1=  arc4random_uniform(33)+1;
    int num2=  arc4random_uniform(33)+1;
    int num3=  arc4random_uniform(33)+1;
    int num4=  arc4random_uniform(33)+1;
    int num5=  arc4random_uniform(33)+1;
    int num6=  arc4random_uniform(33)+1;
    
    printf("%d %d %d %d %d %d \n",num1,num2,num3,num4,num5,num6);
    
    
    
    //45 90
    //int num =  arc4random_uniform(46)+45;
    
    
    
    
//    //10 - 20
//    int num =  arc4random_uniform(11) + 10;//0 - 10
//
  //printf("num = %d\n",num);
    
    return 0;
}
