//
//  add.c
//  Day14-预处理指令
//
//  Created by 黑马程序员 on 20/3/11.
//  Copyright © 2020年 itheima. All rights reserved.
//

#include "add.h"
#include <stdlib.h>

/**
 *  新增学生
 */
void addStudent()
{
    
    //0. 新增学生的时候 有可能数组已经存储满了.
    //   如果存储满了.就要想办法扩容.
    //   如果没有存储满,那么往里面存储.
    //   首先要判断数组是否存储满了.
    //   判断realLength的值 是否为 数组的长度.
    
    if(realLength == arrayLength)
    {
        //说明满了.
        //满了就要要为数组扩容.
        //realloc(, <#size_t#><#void *#>
        //1. 先在堆区申请1个长度为原来的长度的两倍的数组.
        Student *s1 =  calloc(arrayLength * 2 , sizeof(Student));
        //2. 将旧数组中的数据拷贝到新数组中.
        for (int i = 0; i < realLength; i++)
        {
            s1[i] = students[i];
        }
        //3. 拷贝完成以后.将旧数组释放.
        free(students);
        //4. 让全局指针指向我们的新数组
        students = s1;
        //5. 数组的长度已经发生变化了,要修改
        arrayLength = arrayLength * 2;
    }
    
    //1.我们看到的布置.
    //  输入要新增的学生的信息.
    //  编号不输入.让系统自动生成.
    
    //1.1 先输入姓名
    printf("请输入新增的学生的姓名: ");
    char name1[10];
    rewind(stdin);
    fgets(name1, 10, stdin);
    size_t len = strlen(name1);
    if(name1[len - 1] == '\n')
    {
        name1[len - 1] = '\0';
    }
    
    char *name =  calloc(len+1, sizeof(char));
    strcpy(name, name1);
    //printf("你输入的姓名是:%s\n",name);
    
    //1.2 输入年龄.
    printf("请输入新增的学生的年龄: ");
    int age = 0;
    scanf("%d",&age);
    
    
    //1.3 输入性别
    printf("请输入新增的学生的性别: 0--> 男  1-->女 ");
    int gender = 0;
    scanf("%d",&gender);
    
    
    //1.4 输入成绩.
    printf("请输入新增的学生的成绩: ");
    int score = 0;
    scanf("%d",&score);
    
    
    //2. 创建结构体变量
    
    static int id = 11;
    
    
    Student stu = {id,name,age,gender,score};
    
    id++;
    
    //printf("stu.name = %s\n",stu.name);
    //3. 将输入的学生的信息保存到数组中.
    //   把这个学生的信息构建成1个结构体变量.
    //   然后再把这个结构体变量存储到数组中.
    
    students[realLength] = stu;
    
    //printf("students = %s\n",students[realLength].name);
    realLength++;
}
