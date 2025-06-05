/*
 1. 指向函数的指针.
    
    1). 我们可以定义1个指针指向1个函数.
        来使用这个指针间接的调用这个函数.
 
    2). 指向函数的指针的声明
 
        a. 拷贝函数头,去掉函数名 用小括弧代替 里面写上 *指针名.

    3). 初始化
 
        函数名就代表函数的地址
        直接将函数名赋值给指针
 
 
    4). 使用.
 
        a. pFun();
        b. (*pFunc)();
 
 
 2. 结构体.
 
    1). 作用: 可以让程序员新创建1个数据类型. 这个数据类型的变量是由多个其他普通类型的小变量联合而成的.
    2). 使用场景: 当我们要存储1个数据的时候,发现这个数据是由多个其他的小数据组合起来的
 
    3). 使用结构体来创建1个新的数据类型.
 
        struct 新类型名称
        {
            成员;
        };
 
    4). 声明结构体类型的变量.
 
        struct 新类型名称 变量名;
 
 
    5). 初始化.
 
        a. 使用点.
        b.
 
 
    -------
    值传递.
 
 
 3. 枚举
  
    1).可以让程序员新创建1个数据类型. 这个数据类型的变量的取值被限定.
    2).使用场景: 如果1个变量的取值要被限定.
 
 
    3).如何使用枚举来新创建1个类型.
 
       enum 新类型
       {
          枚举值1,枚举值2....
       };
 
    4).声明变量.
 
       enum 新类型 变量名;
 
    5). 初始化
 
        变量中只能存储枚举类型中写好的枚举值之一.
 
 
    --------
    a. 每1个枚举值都有1个对应的整型的数 默认从0开始 依次的递增
 
 
 
 4. typedef .
 
    1). 将1个已经存在的数据类型取1个别名.
 
        
 
    2).
 
 
 */

#include <stdio.h>

void test()
{
    printf("AAA\n");
}


struct Student
{
    char *name;
    int age;
};


//按钮的状态
//普通 按下去 禁用
enum HMButtonType
{
    HMButtonTypeNormal,
    HMButtonTypePress,
    HMButtonTypeDisabled
};



int main(int argc, const char * argv[])
{
    
    enum HMButtonType type = HMButtonTypeDisabled;
    
//    struct Student s1 = {"rose",19};
//    s1.name = "jack";
//    s1.age = 18;
    
    return 0;
}
