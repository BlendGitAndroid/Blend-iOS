/*
 
 1. 关于结构体你务必要掌握的内容.
 
    1). 结构体的作用:
        可以让程序员新创建1个数据类型,指定这个新数据类型的变量是由哪些小变量联合而成的.
 
    2). 当我们要保存1个数据.这个数据是由多个其他的小数据联合而成的.
        
        人: 
        姓名  char*
        年龄  int
        身高  float
 
    3). 可以使用结构体来自己定义这个类型.
 
    4). 我们什么时候要使用结构体来新建1个数据类型.
 
 
 
 2. 结构体数组
 
    1).需要保存5个学生的信息.
 
        a. 声明5个结构体变量.来保存.分别来保存.
           这样虽然可以,但是数据非常难以管理.
 
 
        b. 使用结构体数组来保存他们.
 
 
    2). 声明1个结构体数组.
 
        struct 结构体类型名称 数组名称[数组长度];
 
        struct Student students[5];
 
        表示我们声明了1个长度为5的数组 .
        数组名称叫做students
        数组长度为5个
        数组的元素的类型是struct Student类型.
 
        所以,这个数组可以存储5个struct Student类型变量.
 
 
 
 
 3. 结构体数组的初始化.
 
    1). 先声明结构体数组,然后用下标1个1个元素的赋值.
 
        注意: 当我们为结构体数组的元素赋值的时候.如果直接使用大括弧来初始化.
             就必须要前面加1个小括弧,来告诉编译器我们的给的数据类型.
 
         struct Student students[5];
         students[0] = (struct Student){"小明1",16,56};
         students[1] = (struct Student){"小明2",18,100};
         students[2] = (struct Student){"小明3",19,10};
         students[3] = (struct Student){"小明4",21,100};
         students[4] = (struct Student){"小明5",13,3};
 
 
 
    2). 在声明结构体数组的同时,就为所有的元素初始化.
 
 
         struct Student students[5] =
         {
             {"小明1",16,56},
             {"小明2",18,100},
             {"小明3",19,10},
             {"小明4",21,100},
             {"小明5",13,3}
         };
 
 
 
 3. 结构体数组的长度计算.
 
 
    1). 先使用sizeof计算出数组占用的总的字节数.
 
    2). 使用总字节数 除以 每1个元素占用的字节数.
 
 
    int len =   sizeof(students) / sizeof(struct Student);
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 */

#include <stdio.h>

struct Student
{
    char* name;
    int age;
    int score;
};



int main(int argc, const char * argv[])
{
    
//    struct Student s1 = {"小明1",16,56};
//    struct Student s2 = {"小明2",18,100};
//    struct Student s3 = {"小明3",19,10};
//    struct Student s4 = {"小明4",21,100};
//    struct Student s5 = {"小明5",13,3};
    
    
//    struct Student students[5];
//    students[0] = (struct Student){"小明1",16,56};
//    students[1] = (struct Student){"小明2",18,100};
//    students[2] = (struct Student){"小明3",19,10};
//    students[3] = (struct Student){"小明4",21,100};
//    students[4] = (struct Student){"小明5",13,3};
    
    
    struct Student students[] =
    {
        {"小明1",16,56},
        {"小明2",18,100},
        {"小明3",19,10},
        {"小明4",21,100},
        {"小明5",13,3}
    };
    
    
    int len =   sizeof(students) / sizeof(struct Student);
    printf("len = %d\n",len);
    
    for(int i = 0; i < 5; i++)
    {
        printf("姓名:%s 年龄:%d 成绩:%d\n",
               students[i].name,
               students[i].age,
               students[i].score
               );
    }
    
    
    
    
    
    
    
    
    
    
    
    return 0;
}
