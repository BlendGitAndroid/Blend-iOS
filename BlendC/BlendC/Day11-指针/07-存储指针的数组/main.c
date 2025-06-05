/*
  1. 存储int数据的数组.
 
     int arr[3];
 
     这个arr数组是不是就可以存储3个int类型的数据啊.
 
 
    
  2. 如果1个数组是用来存储指针类型的数据的话.那么这个数组就叫做存储指针的数组.
 
     如何声明1个数组来存储多个指针数据呢?
 
 
     格式:
 
     元素类型 数组名[数组长度];
 
     int* arr[3];
 
     这个arr数组的元素的类型是int*. 是int指针,
     所以这个数组可以存储int指针数据.最多存储3个.
 
 
 3. 所以.如果你有多个指针数据.那么就可以将这多个指针数据存储到1个数组中.
 
 
 
 
 
 */
#include <stdio.h>

int main(int argc, const char * argv[])
{
    
    int arr[3] = {10,20,30};
    
    int* pArr[3] = {arr,&arr[1],&arr[2]};
    
    
    
    *(pArr[0]) = 100; //arr数组的第0个元素. pArr数组的第0个元素存储的是arr数组的第0个元素的地址.
    
    
    printf("arr[0] = %d\n",arr[0]);
    
    
    int num = 1000;
    
    
    pArr[1] = &num;
    
    *(pArr[1]) = 2000;
    
    printf("num = %d\n",num);
    
    
    
    
    
    
    
    
   
//    int num1 = 10;
//    int num2 = 20;
//    int num3 = 30;
//    
//    
////    int* p1 = &num1;
////    int* p2 = &num2;
////    int* p3 = &num3;
//    
//    
//    int* arr[3] = {&num1,&num2,&num3};
//    //打印每一个元素的值.
//    
//    
//    for(int i = 0; i < 3; i++)
//    {
//        printf("arr[%d] = %p\n",i,arr[i]);
//    }
//    
    
    
    
    
    
    
    
    
    
    
    
    return 0;
}
