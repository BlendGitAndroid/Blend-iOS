//
//  query.c
//  Day14-预处理指令
//
//  Created by 黑马程序员 on 20/3/11.
//  Copyright © 2020年 itheima. All rights reserved.
//

#include "query.h"

/**
 *  查询学生
 */
void query()
{
    //查询学生.
    //1. 显示查询的二级菜单.并接收用户的选择.
    //   很明显这是1个独立的功能,我们再次的封装1个函数.
    int userSlect =  showQueryMenu();
    //2. 判断用户的选择,根据用户的的选择做出不同的查询.
    switch (userSlect)
    {
        case 1:
            //查询所有
            queryAll();
            break;
        case 2:
            //根据编号查询
            queryById();
            break;
        case 3:
            //根据姓名查询
            queryByName();
            break;
        case 4:
            //根据年龄查询
            queryByAge();
            break;
        case 5:
            //根据性别查询
            queryByGender();
            break;
        case 6:
            //根据成绩查询
            queryByScore();
            break;
    }
    
}


/**
 *  显示查询的二级菜单.
 */
int showQueryMenu()
{
    //1. 显示查询二级菜单.
    printf("***********欢迎使用学生查询系统***********\n");
    printf("*           1. 查询所有学生信息          *\n");
    printf("*           2. 根据编号查询             *\n");
    printf("*           3. 根据姓名查询             *\n");
    printf("*           4. 根据年龄查询             *\n");
    printf("*           5. 根据性别查询             *\n");
    printf("*           6. 根据成绩查询             *\n");
    printf("***************************************\n");
    //2.接收用户的选择.
    printf("请输入你要进行的查询编号: ");
    int userSelect = 0;
    scanf("%d",&userSelect);
    //3. 返回用户的选择.
    return userSelect;
}

/**
 *  查询所有的学生信息
 */
void queryAll()
{
    //查询所有的学生信息.
    //所有的学生的信息是存储在全局数组中.
    //只需要遍历打印就可以了.
    
    //{1,"jack",18,GenderMale,100},
    
    
    
    printf("编号\t\t姓名\t\t\t年龄\t\t性别\t\t成绩\n");
    
    for(int i = 0; i < realLength;i++)
    {
        printf("%d\t\t%s\t\t%d\t\t%s\t\t%d\n",
               students[i].id,
               students[i].name,
               students[i].age,
               students[i].gender == GenderMale ? "男" : "女",
               students[i].score
               );
    }
    
    
    
}

/**
 *  根据编号查询
 */
void queryById()
{
    
}

/**
 *  根据姓名查询
 */
void queryByName()
{
    
}

/**
 * 根据年龄查询
 */
void queryByAge()
{
    
}

/**
 *  根据性别查询
 */
void queryByGender()
{
    
}


/**
 *  根据成绩查询
 */
void queryByScore()
{
    //1. 让用户输入1个最小成绩.再让用户输入1个最大成绩.
    int min = 0, max = 0;
    printf("请输入最小成绩和最大成绩 使用空格分隔 :");
    scanf("%d%d",&min,&max);
    
    //2. 在学生数组中去找.看学生的成绩是否在这范围之中.
    //   如果在就打印
    printf("编号\t\t姓名\t\t\t年龄\t\t性别\t\t成绩\n");
    //   遍历数组中的每1个学生.
    for(int i = 0; i < realLength; i++)
    {
        if(students[i].score >= min && students[i].score <= max)
        {
            printf("%d\t\t%s\t\t%d\t\t%s\t\t%d\n",
                   students[i].id,
                   students[i].name,
                   students[i].age,
                   students[i].gender == GenderMale ? "男" : "女",
                   students[i].score
                   );
        }
    }
    
    
    
    
}





