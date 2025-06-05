//
//  student.h
//  Day14-预处理指令
//
//  Created by 黑马程序员 on 20/3/11.
//  Copyright © 2020年 itheima. All rights reserved.
//

/*
 该模块是用来保存我们的基本数据的.
 
 */
#ifndef student_h
#define student_h

#include <stdio.h>


/**
 性别枚举. 表示学员的性别.
 */
typedef enum
{
    GenderMale,
    GenderFemale
} Gender;



/**
 *  学生结构体,表示1个学生数据.
 */
typedef struct
{
    int id;//学生编号
    char *name;//学生姓名
    int age;//学生年龄
    Gender gender;//学生性别
    int score;//学生成绩
}Student;


//只是声明了1个结构体指针.要在堆区创建1个长度为20数组.
//把默认的数据存储在堆中的这个数组中.
extern Student *students;



/**
 *  代表数组中真正的存储了多少个学生的信息.
 */
extern int realLength;


/**
 *  数组的长度
 */
extern int arrayLength;



/**
 *  在堆区创建1个长度为20的结构体数组.并设置前面10个默认数据.
 *  然后将创建的数组的地址赋值给全局变量students指针.
 */
void initData();


/**
 *  显示一级菜单.并接收用户的选择.
 */
int showMenu();


#endif /* student_h */
