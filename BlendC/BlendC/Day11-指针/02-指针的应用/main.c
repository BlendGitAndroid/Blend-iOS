/*
  1. 会使用指针间接的操作指针指向的变量.
 
     指针的作用: 通过指针间接的操作指针指向的变量.
 
     难度指针的作用,就仅仅是为了间接操作吗?
 
 
  2. 当函数的参数的类型是int char double float的时候.
     这个时候参数传递是值传递.
     在函数的内部去修改形参变量的值,对实参变量没有丝毫的影响.
 
 
  3. 当函数的参数的类型是数组的时候,这个时候参数传递是地址传递.
     在函数内部修改参数数组的元素的时候,其实修改的就是实参数组的元素.
 
 
  4. 指针是一种新的数据类型.
 
     指针可以不可以作为函数的参数呢?
 
     1). 指针完全当然可以作为函数的参数,因为指针也是1个数据类型.
         直接将指针的声明放在小括弧中.
 
     2). 当我们调用1个函数的时候.如果这个函数的参数是1个指针.
         那么我们就必须要为这个指针传递1个和指针类型相同的普通变量的地址.
 
     3). 这个时候,在函数的内部去访问参数指针指向的变量的时候,其实访问的就是实参变量.
 
 
  5. 指针作为函数的参数,可以实现什么效果? 
 
     函数的内部可以修改实参变量的值.
 
 
 
  6. 什么时候需要将指针作为函数的参数?
 
     1). 遇到的问题.
 
         函数只能返回1个数据.
         如果函数需要返回多个数据怎么办?
 
 
     2). 解决方案.
 
         使用指针作为函数的参数. 让调用者将自己的变量的地址传递到函数的内部
         函数的内部通过指针就可以修改实参变量的值.
 
 
     3). 当函数需要返回多个数据的时候就可以使用指针作为函数的参数.
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 */

#include <stdio.h>

void test1(int num)
{
    num++;
}

void test2(int arr[],int len)
{
    arr[0] = 100;
}

void test3(int* p1)
{
    *p1 = 1000;
}

/**
 *  返回1个整型数组中的最大值和最小值
 */
int getMaxAndMin(int arr[],int len,int* min)
{
    int max = INT32_MIN;
    *min = INT32_MAX;
    
    for(int i = 0; i < len; i++)
    {
        if(arr[i] > max)
        {
            max = arr[i];
        }
        
        if(arr[i] < *min)
        {
            *min = arr[i];
        }
    }
    //函数的内部,返回最大值.
    //将调用者传递给我实参变量的值修改成了最小值.
    
    return max;
}


void getZuiDaHeZuiXiao(int arr[],int len,int* pMax,int* pMin)
{
    int max = INT32_MIN;
    int min = INT32_MAX;
    for(int i = 0; i < len; i++)
    {
        if(arr[i] > max)
        {
            max = arr[i];
        }
        
        if(arr[i] <  min)
        {
            min = arr[i];
        }
    }
    
    //max和min的值都需要返回给调用者.
    //思路是这样.
    //让调用者传递两个变量的地址给我.
    //让调用者自己先准备两个变量.然后将这两个变量的地址给我.
    //函数内部是不是可以通过指针 直接 修改 调用者的变量的值.
    
    *pMax = max; //把最大值赋值给pMax指针指向的变量.
    *pMin = min;//把最小值赋值给pMin指针指向的变量.
}







int main(int argc, const char * argv[])
{
//    int num = 0;
//    int res = scanf("%d",&num);
//    printf("res = %d\n",res);
//    
    
    
    
//    int num = 0;
//    scanf("%d",&num);
    
    
//    int arr[] = {121,3,234,1,4,35,6,45,42,3,33,5,46,4354,32,44,6,68,56,453,423};
//    
//    
//    int max = 0;
//    int min = 0;
//    getZuiDaHeZuiXiao(arr, sizeof(arr)/sizeof(arr[0]), &max, &min);
//    
//    printf("max = %d\nmin = %d\n",max,min);
//    
//    
//    
//    int min = 0;
//    int max =  getMaxAndMin(arr, sizeof(arr)/sizeof(arr[0]), &min);
//    
//    printf("max = %d\nmin = %d\n",max,min);
//    
    
    
    
//    int num = 10;
//    
//    test3(&num);
//    
//    
//    printf("num = %d\n",num);
    
    
//    int arr[3] = {10,20,30};
//    
//    test2(arr, 3);
//    
//    printf("arr[0] = %d\n",arr[0]);
//    
    
    
//    int num = 0;
//    test1(num);
//    printf("num= %d\n",num);
    
//    int num = 10;
//    int* p1 = &num;
//    
//    
//    num = 0;
//    *p1 = 100;
//    printf("num=%d\n",*p1);
    
    

    
    
    
    
    return 0;
}
