/*
  1. 随机的产生1个双色球的号码.
 
     1~33 随机的产生6个不重复的数
     1~16 产生1个随机.
 
 
  2. 如何产生不重复的随机数.
 
     思路:
 
     应该将之前产生的随机数存储起来.
     每产生1个随机数.就判断新产生的这个随机数和之前的有没有重复.如果有重新产生,如果没有下1个.
 
 
     使用1个数组存储之前已经产生的随机数.
 
 
 
  */

#include <stdio.h>
#include <stdlib.h>

//判断指定的数组中是否包含指定的数据.
int isContains(int arr[],int len,int key);


int main(int argc, const char * argv[])
{
    //1.准备1个长度为6的数组,用来存储已经产生好的随机数.
    int redBalls[6] = {0};
    //2.产生6个随机数.
    //  每产生1个随机数.判断数组中是否包含这个随机数.
    //  如果包含.说明这个随机数之前已经产生过了.重新再产生
    //  如果不包含.就说明这个随机数之前没有产生 就存储到数组中.
    for(int i = 0; i < 6; )
    {
     
        printf("");
        int num = arc4random_uniform(33)+1;
        //判断readBalls数组中是否包含num
        //判断1个数组中是否包含1个指定数据.
        int res = isContains(redBalls, 6, num);
        //判断结果
        if(res == 0)
        {
            //说明不包含. 不包含就存储到数组中.
            redBalls[i] = num;
            i++;//i的值只有在不包含的时候存到数组以后才会自增. 如果重复了 i不会自增.
        }
    }
    
    //打印数组中的数据
    for(int i = 0; i < 6; i++)
    {
        printf("%d  ",redBalls[i]);
    }
    
    
    
    return 0;
}


int isContains(int arr[],int len,int key)
{
    for(int i = 0; i < len; i++)
    {
        if(arr[i] == key)
        {
            return 1;
        }
    }
    
    return 0;
}
