//
//  student.c
//  Day14-预处理指令
//
//  Created by 黑马程序员 on 20/3/11.
//  Copyright © 2020年 itheima. All rights reserved.
//

#include "student.h"
#include <stdlib.h>

//只是声明了1个结构体指针.要在堆区创建1个长度为20数组.
//把默认的数据存储在堆中的这个数组中
Student *students = NULL;

/**
 *  代表数组中真正的存储了多少个学生的信息.
 */
int realLength = 10;


/**
 *  数组的长度
 */
int arrayLength = 10;


/**
 *  在堆区创建1个长度为20的结构体数组.并设置前面10个默认数据.
 *  然后将创建的数组的地址赋值给全局变量students指针.
 */
void initData()
{
    //1. 先向堆内存申请空间. 在堆内存中创建了1个长度为20的结构体数组.
    //   然后将其赋值给全局变量.
    students =  calloc(arrayLength, sizeof(Student));
    
    //2. 初始化前面10个学生信息.
    *students     =  (Student){1,"jack",18,GenderMale,100};
    *(students+1) =  (Student){2,"rose",21,GenderFemale,45};
    *(students+2) =  (Student){3,"lily",26,GenderFemale,23};
    *(students+3) =  (Student) {4,"jim1",12,GenderMale,89};
    *(students+4) =  (Student) {5,"poly",3,GenderMale,67};
    *(students+5) =  (Student) {6,"meimei",19,GenderFemale,89};
    *(students+6) =  (Student) {7,"likai",31,GenderMale,88};
    *(students+7) =  (Student) {8,"Qiang",45,GenderMale,12};
    *(students+8) =  (Student) {9,"aDong",29,GenderMale,76};
    *(students+9) =  (Student) {10,"asan",35,GenderMale,91};

}


/**
 *  显示一级菜单.并接收用户的选择.
 */
int showMenu()
{
    //1.显示菜单
    printf("******************************************************\n");
    printf("*        请 使 用 传 智 播 客 学 生 管 理 系 统          *\n");
    printf("*                    1. 查 询 学 生                   *\n");
    printf("*                    2. 新 增 学 生                   *\n");
    printf("*                    3. 删 除 学 生                   *\n");
    printf("*                    4. 修 改 学 生                   *\n");
    printf("*                    5. 退 出 系 统                   *\n");
    printf("******************************************************\n");
    //2.接收用户的选择.
    printf("请输入你的选择: ");
    int userSelect = 0;
    scanf("%d",&userSelect);
    //3.将用户的选择返回.
    return userSelect;
    
}
