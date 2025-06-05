/*
 
 结构体嵌套
 
 
 用1个变量来保存1个人.
 姓名
 年龄
 出生日期
 家产
 
 
 
 日期:
 年 int
 月 int
 日 int
 
 
 
 
 什么时候会有这种情况
 
 当我们在为结构体定义成员的时候. 发现某个成员也是1个大数据 需要其他的几个小变量合起来描述
 那么这个时候你就可以再定义1个数据类型.来表示这个类型.
 
 
 
 电脑
 CPU
 硬盘
 内存
 
 
 
 
 
 
 
 */

#include <stdio.h>

/**
 *  这个结构体类型表示1个日期:
 *  组成1个日期数据的有:年 月 天
 */
struct Date
{
    int year;
    int month;
    int day;
};

/**
 *  表示个人
 *  组成1个人的数据
 *  姓名 char*
 *  年龄 int
 *  家产 double
 *  出生日期. struct Date
 */
struct Person
{
    char* name;
    int age;
    double money;
    //出生日期.
    struct Date birthday;
};


struct CPU
{
    char *brand;
    char *model;
    int price;
    double pinLv;
};



struct Computer
{
    //1. CPU
    struct CPU cpu;
    //2. 硬盘
    
    
};


int main(int argc, const char * argv[])
{
    
    struct Person xiaoMing = {"小明",18,5.6,{1999,12,31}};
    
    printf("%s--%d--%lf--%d--%d--%d\n",
           xiaoMing.name,
           xiaoMing.age,
           xiaoMing.money,
           xiaoMing.birthday.year,
           xiaoMing.birthday.month,
           xiaoMing.birthday.day
           
           );
    
    
    
    
 
    
    
    
    
    return 0;
}
