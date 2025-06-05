/*
 
 1. 当函数执行完毕之后,有1个结果(数据).
    如何处理这个结果呢? 函数的内部是不确定的.
    并且,这个结果是调用者翘首以盼的.
 
    这个时候,函数就应该将这个数据返回给调用者.
 
 
 
 2. 函数如何将数据返回给调用者
 
    1). 先确定要返回给调用者的数据的类型.
 
    2). 修改函数的返回值类型为 要返回的 数据的 类型.
 
    3). 在函数结束之前,使用return关键字将数据返回.
 
 
 3. 调用者如何拿到函数的返回的数据呢?
 
    声明1个和函数的返回值类型相同的变量来接收就可以了.
 
 
 
 int getSum(int num1,int num2)
 {
 
    int num3 = num1 + num2;
    return num3;
 }

 int num =  getSum(10, 20);
 
 先执行getSum函数,将这个函数返回的数据通过赋值符号返回给调用者赋值给num变量.
 num变量存储的是这个函数返回的数据.
 
 
 4. C语言中使用0表示假 使用非0表示真.
    所以,如果1个函数的返回数据 是真或者假的时候.
    返回值应该写int类型.
 
    因为C语言使用int类型表示真假
 
 
 
 5. 返回数据的时候,return后面可以直接写1个数据,也可以写1个表达式.
    如果是1个表达式 返回的就是表达式的结果.
 
 
 
 6. 注意
 
    1). 函数的返回值类型代表什么意思?
        代表函数执行完毕之后,有1个这个类型的数据要返回给调用者.
        这个时候调用者才知道用什么类型的变量来接收函数的返回值.
 
    2). void 代表函数执行完毕之后,没有任何数据返回给调用者.
        所以这个时候调用者就不要用变量去接收返回值了.
 
    3). 一旦函数指定了返回值类型.那么就必须在函数结束之前使用return返回响应类型的数据.
        Control reaches end of non-void function
        凡是看到这个错误,就代表你的函数定义了返回值类型,但是你却没有返回.
 
 
    4). 如果函数有返回值,那么调用者可以接受也可以不接收.
 
    
    5). 一旦你的函数定义了返回值,那么就必须要保证函数体的每1个分支结束之前都要有返回值.
 
 
    6). return关键字.
 
        在无返回值的函数中,只能直接使用return. 代表立即结束函数.不能后面跟数据, 可以使用return也可以不使用return
 
        在有返回值的函数中.这个时候必须在函数结束之前使用return返回1个数据
        return 数据;
        这个时候,return代表的意思: 结束函数的执行.并返回指定的数据.
 
 
 
 
 
 
 

  */

#include <stdio.h>


int  test()
{
    printf("~~~~~~~\n");
    printf("~~~~~~~\n");
    printf("~~~~~~~\n");
    printf("~~~~~~~\n");
    return 10;
    printf("~~~~~~~\n");
    printf("~~~~~~~\n");
    printf("~~~~~~~\n");
    printf("~~~~~~~\n");
    printf("~~~~~~~\n");
    printf("~~~~~~~\n");
}

int panDuanOuShu(int num)
{
    if(num % 2 == 0)
    {
        return 1;
    }
    else
    {
        return 0;
    }
    
   
    
    //return !(num % 2);
    
    
}








int getSum(int num1,int num2)
{
    
    int num3 = num1 + num2;
    
    return num3;
    
}


int  getLeiJiaHe(int min,int max)
{
    int sum = 0;
    for(int i = min; i <= max; i++)
    {
        sum += i;
    }
    
    //
    return sum;

    
}


//判断1个年份是不是闰年.
int isRunNian(int year)
{
    if(year % 400 == 0 || (year % 4 == 0 && year % 100 != 0))
    {
        return 1;
    }
    else
    {
        return 0;
    }
}




int main(int argc, const char * argv[])
{
    
    getSum(10, 20);
    
    //int num = test();
    
    //int res =  panDuanOuShu(18);
    
    
    //getLeiJiaHe(1, 100);
    
    
    
//   int num = getLeiJiaHe(1, 100);
//
//     printf("num = %d\n",num);
   
    
    //panDuanOuShu(19);
   
//    int num =  getSum(10, 20);
//
//    
//    printf("num = %d\n",num);
    
    return 0;
}
