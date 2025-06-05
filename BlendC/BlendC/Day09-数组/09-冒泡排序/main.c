/*
 
 
 1. 冒泡排序.
 
 
 
 
 2. 你可以不了解冒泡的原理 但是你必修要背的,冒泡的代码.
 
 
 
 
 
 */

#include <stdio.h>

int main(int argc, const char * argv[])
{

    int arr[] = {12,1,32,4,35,46,4,53,24,36,5,76,434,5,5678,6,9,65,45,24,346,75,6435};
    
    //1.计算出数组的长度
    int len = sizeof(arr) / sizeof(arr[0]);
    //冒泡排序要比len -1
    
    for(int i = 0; i < len - 1; i++)//外层循环控制轮数.每循环1次 要完成1轮的比较.
    {
        //每1轮比较多少次.
        //第i轮比多少次 len - 1 - i
        //写1个内层循环.循环len - 1 - i次.
        for(int j = 0; j < len - 1 - i; j++)
        {
            //j j+1
            if(arr[j] < arr[j+1])
            {
                int temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
            }
        }
    }
    
    
    for(int i = 0; i < len; i++)
    {
        printf("%d\n",arr[i]);
    }
    
    
    
    
    
    

    
    
    
    
    
    
    return 0;
}
