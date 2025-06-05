/*
 
 1. 二分查找法/折半查找.
 
    在1个数组中查找指定的元素的下标.
    1). 从头到尾的挨个挨个的遍历. 这样找的话 效率低下.
 
 
    2). 使用折半查找. 前提是:数组是有序.
 
 
 
 
 
 
 
 
 */
#include <stdio.h>

int main(int argc, const char * argv[])
{

    //1000
    int arr[] = {10,45,67,89,90,99,122,456,789,999};
    
    
    //找出789在这个数组中的下标.
    int len = sizeof(arr) / sizeof(arr[0]);
    
    int min = 0;
    int max = len - 1;
    int mid = len / 2;
    
    int key = 45;
    
    //先判断中间的那个数是不是和key一样.
    //如果不一样就判断大小.
    
    while (key != arr[mid])
    {
        //判断大小关系.
        if(arr[mid] > key)
        {
            //说明在左边.
            max = mid - 1;
        }
        else if(arr[mid] < key)
        {
            //说明在右边.
            min = mid + 1;
        }
        mid = (min + max)/2;
        
    }
    
    printf("下标为%d\n",mid);
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    return 0;
}
