/*
 1. 宏定义.
 
    1). 它是1个预处理指令.所以它在编译之前执行.
 
    2). 作用: 可以为1段C代码定义1个标识.如果你要使用这d段C代码.那么你就使用这个标识就可以了.
 
    3). 语法:
 
        #define 宏名 宏值
        #define N 10
 
    4). 如何使用宏.
 
        在C代码中.直接使用宏的名称就可以了.
 
         int a = N + 1;
 
    5). 宏的原理
        
        在预编译的时候,就会执行源文件中的预处理指令.
        会将C代码中使用宏名的地方替换为宏值.
 
        将C代码中的宏名替换为宏值的过程叫做  宏替换/宏代换.
 
 
 2. 在使用宏的时候需要注意的地方.
 
    1). 宏值可以是任意的东东. 宏值可以是任意的东西. 在定义宏的时候,并不会去检查语法.
 
 
    2). 无论宏值是什么东西,在定义宏的时候,不会去检查语法
        只有当完成了宏替换的时候,才会去检查替换以后,是否符合语法规范.
 
    3). 如果宏值是1个表达式,那么宏值并不是这个表达式的结果,而是这个表达式本身.
 
    4). 如果宏值中包括1个变量名,那么在使用这个宏之前必须要保证这个变量已经存在.
 
    5). 无法通过赋值符号为宏 改值. 因为宏根本就不是变量.
 
 
    6). 宏的作用域.
 
        a. 宏可以定义在函数的内部 也可以定义在函数的外部.
 
        b. 从定义宏的地方,后面的所有的地方都可以直接使用这个宏.
           就算这个宏定义在这个大括弧里面, 在这个后面 哪怕是大括弧外面都可以访问.
 
        c. 默认情况下,宏从定义的地方一直到文件结束都可以使用.
           #undef 宏名
           可以让指定的红提前失效.
 
 
     7). 字符串中如果出现了宏名,系统不会认为这是1个宏,而认为是字符串的一部分.
         字符串中并不会出现宏替换.
 
 
     8). 宏的层层替换.
 
         宏值当中我们用到了另外1个宏名. 那么就会先将这个宏值当中的宏名替换为对应的宏值.
 
 
     9). 如果后面跟了分号.那么就会吧分号作为宏值的一部分
         替换的时候会连分号一起.
        虽然可以,但是不建议你加分号.
 
 
 
 
 3. #define  和  typedef 的区别
 
    1).  #define是1个预处理指令.在预编译的时候执行. 在预编译的时候会吧宏名换成宏值.
         typedef 是1个C代码. 在运行的时候才会执行.
 
 
    2).  #define 可以将任意的C代码取1个标识名.
        typedef只能为数据类型取名字.
 
 
 
 
 
 
 
 
 
 
 */

#include <stdio.h>

#define N 10
#define M (10 + 10 + 20)
#define K sniwcniewcneic
#define Q a + a


#define PI 3.14
#define R  5.1
#define AREA PI * R * R //3.14 * 5.1 * 5.1


#define SB 10;



#define P printf
#define D "%d\n"

#define FOR for(int i = 0; i < 10; i++)

#define STRING char*








void test()
{
  int num = N;
   printf("num = %d\n",num);
}

#undef N


void test1();
int main(int argc, const char * argv[])
{
    
    STRING str =  "jack";
    
    
    typedef char* string;
    
    
//    FOR
//    {
//        P(D,i);
//    }
    
    
    
//    int a = 10;
//    
//    P(D,a);
//   //printf("%d",a);
    
    
    
//    int a = SB + 1;
//    
//    printf("a = %d\n",a);
    
    
//    double area = AREA;
//    
//    
//    printf("area = %lf\n",area);
    
    
    
  
    
    
    
#define ITHEIMA 100
    
    
    
    //int a = N + 10;
    
    
    
//    int a = 10;
//    int c = a + a;
 
    

//    int c = 3 * M;
//    printf("c = %d\n",c);
    
//    int a = N + 1;
//    
//    int b = 20 + sniwcniewcneic;
    
    
    test1();
    
    
    
    return 0;
}

void test1()
{
//    int num = ITHEIMA + N;
//    printf("num = %d\n",num);

}