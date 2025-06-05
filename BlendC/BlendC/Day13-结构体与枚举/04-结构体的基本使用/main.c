/*
 
 1. 结构体变量的初始化.
 
    1). 先声明变量,再使用点1个1个的为成员赋值.
 
 
    2). 在声明结构体变量的同时,就为结构体变量的成员初始化. *******
 
        struct Student xiaoHua = {"小花",17,89};
 
    3). 在声明结构体变量的同时,按顺序初始化部分成员
 
        struct Student liLei = {"李雷"};
 
 
    4). 指定成员的初始化
        struct Student jim = {.name = "吉姆",.age = 17, .score = 100};
 
 
 
 2. 结构体变量的成员的默认值.
 
    声明1个结构体变量,如果没有这个结构体变量的成员赋值.那么成员是有值 是垃圾值.
 
    只要在声明结构体变量的同时.只要初始化1个成员,其他的成员就会被自动的初始化为0.
    
 
 
    
 3. 结构体类型的作用域
 
    如果结构体类型是定义在函数的内部的,那么这个结构体类型只能在这个函数的内部使用.
    如果我们希望这个结构体类型可以用在所有的函数中.
    那么就把这个结构体类型定义在函数的外面. 定义在最顶上.
 
    
    一般情况下,我们的结构体类型都是定义在函数的外面, 以让所有的函数来使用.
 
 
 4. 结构体变量之间的相互赋值.
 
 
    1). 相同结构体类型的变量之间绝对是可以相互赋值的.
 
 
    2). 结构体变量之间的赋值原理
 
         将源结构体变量中的每一个成员的值 拷贝一份 赋值给 目标结构体变量中对应的成员.
 
 
    3). 结构体变量之间赋值 是值传递.
 
 

 
 
 
 
 */

#include <stdio.h>


struct Student
{
    char *name;
    int age;
    int score;
};

void test()
{
    struct Student stu;
}


int main(int argc, const char * argv[])
{
    
   
    
    
    
    
       
    
    
    
    struct Student xiaoMing = {"小明",19,100};
    
    struct Student xiaoHua = xiaoMing;
    
    xiaoHua.name = "小花";
    
    printf("xiaoMing.name = %s\n",xiaoMing.name);
    
    
    
    
    
    
//    struct Student xiaoMing;
//    xiaoMing.name = "王小明";
//    xiaoMing.age = 18;
//    xiaoMing.score = 99;
//    
//    
//    struct Student xiaoHua = {"小花",17,89};
//    
//    struct Student liLei = {"李雷"};
//    
//    
//    struct Student jim = {.name = "吉姆",.age = 17, .score = 100};
//    
//    
//    struct Student hanMeiMei = {"韩梅梅"};
//    
    
    
    
    
    
    printf("AA");
    

    
    
    return 0;
}
