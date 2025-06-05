/*
 
 1. 数组的排序.
 
    就是给1个整型数组.把这个数组中的元素按照从大到小 或者 从小到大 的排序.
 
 
 2. 选择排序.
 
 
 
 
 
 
 
 */
#include <stdio.h>

int main(int argc, const char * argv[])
{

    int arr[] = {12,1,3,24,346,4,532,3,46,5,754,34,25,5,87,98,32,4,6};
    
    int len = sizeof(arr) / sizeof(arr[0]);
    
    //数组中有len个数据.要比len-1轮.
    //毫无疑问 应该写1个循环 循环len-1次. 每循环1次 完成1轮的比较.
    for(int i = 0; i < len - 1; i++)//外层循环控制轮数.每循环1次 完成1轮的比较.
    {
        //每1轮做的事情/
        //拿下标为i的元素 和后面的所有的元素进行比较.
        //arr[i]  i+1     len-1
        //将后面的所有的元素遍历出来/
        for(int j = i+1; j < len; j++)
        {
            if(arr[i] < arr[j])
            {
                int temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
            }
        }
    }
    
    
    
    
    for(int i = 0; i < len; i++)
    {
        printf("%d\n",arr[i]);
    }
    
    
    return 0;
}
