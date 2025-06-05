//
//  delete.c
//  Day14-预处理指令
//
//  Created by 黑马程序员 on 20/3/11.
//  Copyright © 2020年 itheima. All rights reserved.
//

#include "delete.h"
/**
 *  删除学生
 */
void deleteStudent()
{
    //1. 先输入要删除的学员的编号.
    //编号为5的
    printf("请输入要删除的学生的编号: ");
    int id = 0;
    scanf("%d",&id);
    
    //2. 在数组中找到编号为5的那个人. 确定这个人在第几个下标
    int deleteIndex = -1;
    for(int i = 0; i < realLength; i++)
    {
        if(students[i].id == id)
        {
            //就要删除下标为i的元素.
            deleteIndex = i;
            break;
        }
    }
    if(deleteIndex == -1)
    {
        printf("你输入的编号有误: ");
        return;
    }
    //   然后将后面的元素挨个挨个网上顶.
    //   从deleteIndex+1 这个元素开始, 将每1个元素的值赋值给前面的1个元素.
    for(int i = deleteIndex + 1; i < realLength; i++)
    {
        students[i-1] = students[i];
    }
    
    //删除完毕之后.
    realLength--;
    
    
    
}

