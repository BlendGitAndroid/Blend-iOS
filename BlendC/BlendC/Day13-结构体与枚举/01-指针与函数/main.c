/*
 
 1. 指针作为函数的参数.
    
    1).效果
        在函数的内部可以通过这个参数指针去修改实参变量的值.
        
    2).当函数的返回值有多个的时候.
 
 
    3).地址传递.
 
 
    4).如果函数的参数是1个指针.函数希望传递给调用者1个信息.
       函数内部只会去取指针指向的变量的值而不会修改.
       那么这个时候 这个参数指针就是要const修饰.
 
 
 2. 指针作为函数的返回值
 
    1). 指针当然可以作为函数的返回值.
        但是.不能返回局部变量的地址.
        换句话说: 你返回的指针指向的变量一定要保证在函数结束之后,那个空间没有被回收还存在.
 
 
    2). 如果你就是要返回1个指针,那么你就要保证这个指针指向的空间在函数结束以后仍然存在.
        那么这个时候,就可以将空间申请在堆区. 然后返回堆区的地址.
 
 
        一定要记得,调用者使用了完之后,记得free
 
 
 3.注意.
 
   1). 可以返回局部变量的值. 但是不能返回局部变量的地址.
 
   2). 如果你非要返回指针,那么就应该把这个空间申请在堆区.
 
 
 
 4. 案例:
 
    写1个函数. 传入1个 1-7的星期数,返回对应的英文星期天.
 
 
    void getWeekDay(int day);
 
 
    1). 如果返回值是字符串,那么返回值的类型就写char*
 
    2). 直接返回字符串常量.
 
 
 
 5. 申请在常量区的空间.不会被回收的.
    直到程序结束的时候才会回收.
 
 
    不能改:
 
    以字符指针存储在常量区的字符串数据不能改.
 
    其他存储在常量区的数据是可以改的.
 
 
 
 
 
 
 */
#include <stdio.h>
#include <stdlib.h>

int num = 10;
char name[] = "jack";

void test(const int* arr,int len)
{
    
}

int* test1()
{
//    int arr[] = {10,20,30};
//    
//    return arr;
    
    int* arr = calloc(3, sizeof(int));
    *arr = 10;
    *(arr+1) = 20;
    *(arr+2) =30;
    
    return arr;
    
}

int test2()
{
    int num = 10;
    
    return num;
}


char* getWeekDay(int day)
{
    char *weekDay = "未知";
    switch (day)
    {
        case 1:
           //return "Monday"; //将"Monday"字符串存储在常量区. 返回这个字符串的地址.
            weekDay = "Monday";
            break;
        case 2:
            weekDay = "Nnnn";
            break;
        case 3:
           weekDay = "SAN";
            break;
        default:
            break;
        
    }
    
    
    return weekDay;
    
}


int main(int argc, const char * argv[])
{
    
    
   char* str =   getWeekDay(1);
    
    printf("%s\n",str);
    
    
//    int* arr =  test1();
//    
//    for(int i = 0; i < 3; i++)
//    {
//        printf("%d\n",arr[i]);
//    }
//    
//    free(arr);
//    
    
    
    

//    int arr[] = {10,20,30,40};
//    
//    test(arr, 4);
    
    
    return 0;
}
