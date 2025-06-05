/*
 
 1. const是1个关键字.是来修饰我们的变量的.
    也就是说在声明变量的同时,可以使用const关键字来修饰.
 
    const int num = 10;
 
    一般情况下来说,被const修饰的变量具备一定程度上的不可变性.
 
    被const修饰的变量我们叫做只读变量.
 
 2. const修饰基本数据类型的变量.
 
    基本数据类型: int、double、float、char.
 
    
    1). const int num = 10;
 
        这个时候.num变量的值只能去取值,而不能去修改.
 
    2). int const num = 10;
        
        效果同上.
 
 
 3. const修饰数组.
 
    1). const int arr[4] = {10,20,30,40};
        数组的元素的值不能修改.
 
 
    2). int const arr[4] = {10,20,30,40};
        效果同上.
 
 
 
 4. const修饰指针;
 
    1). const int* p1 = &num;
 
        无法通过p1指针去修改指针指向的变量的值. 但是如果直接操作变量这是可以的.
        但是指针变量的值可以改.可以把另外1个变量的地址赋值给这个指针.
 
 
    2).  int const * p1 = &num;
    
         效果同上
 
    3).  int  * const p1 = &num;
 
         p1的值不能修改,但是可以通过p1去修改p1指向的变量的值.
 
 
    4).  int const  * const p1 = &num;
 
         既不能修改p1的值,也不能通过p1去修改p1指向的变量的值.
 
 5. const的使用场景.
 
    1). const的特点:
        被const修饰的变量.是只读变量,只能取值.而不能改值.
        所以,const变量的值,至始至终都不会发生变化.
 
 
    2). 当某些数据是固定的,在整个程序运行期间都不会发生变化. 并且你也不允许别人去修改.
        那么这个时候,我们就可以使用const.
 
        const int  width: 800
        const int  height:600
 
 
    3). 当函数的参数是1个指针的时候.这个时候,函数的内部是有可能会修改实参变量的值.
        这个时候
        函数想传递给调用者1个信息: 你放心大胆的传给我吧.我肯定不会修改的.
        那么这个时候,就可以给参数加1个const
 
        所以.我们以后在调用函数的时候.如果看到了参数被const修饰. 放心大胆的给.
        函数内部只会使用我们的值 绝对改不了我们的值.
 
 
 
 
 
 
 
 */
#include <stdio.h>

/**
 *  将指定的数组中的元素遍历打印
 */
void printArray(const int arr[],int len)
{
    for(int i = 0; i < len; i++)
    {
        printf("%d ",arr[i]);
    }
    
    //arr[0] = 100;
}

void test(const int* p1)
{
    
    //*p1 = 100;
    
    
}





int main(int argc, const char * argv[])
{
    
    
    
    int arr[] = {10,20,30,40};
    
    printf("%p\n",arr+1);
    printf("%p\n",(&arr)+1);
    
    
    
    
//    int num = 10;
//    test(&num);7
//    
//    
//    printf("");
//    
    
//    
//    char name[] = "jack";
//    
//    printf("%s",name);
//    printf(<#const char *restrict, ...#>)
//    
    
    
//    int arr[] = {102,1201,2,13,2,3,24,35,4,6,57,6,7};
//    
//    printArray(arr, sizeof(arr)/sizeof(int));
    
    
//    int num = 10;
//    int const  * const p1 = &num;
//    
//    int age = 20;
//    p1 = &age;
//    
//    
//    *p1 = 200;
//    
    
    
    //*p1 = 20;
    
//    
//    int age = 20;
//    p1 = &age;
    
    //*p1 = 100;
    
    //num = 100;
    
    
    
    
    

//    int const arr[4] = {10,20,30,40};
//    arr[0] = 100;
    
    
    
//    int const num = 10;
//    
//    num = 100;
    
    
    
    
    
    
    return 0;
}
