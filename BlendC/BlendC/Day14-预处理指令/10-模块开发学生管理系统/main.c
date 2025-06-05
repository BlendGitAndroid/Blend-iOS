//
//  main.c
//  10-模块开发学生管理系统
//
//  Created by 黑马程序员 on 20/3/11.
//  Copyright © 2020年 itheima. All rights reserved.
//

#include <stdio.h>
#include "student.h"
#include "query.h"
#include "add.h"
#include "delete.h"
#include "modify.h"

int main(int argc, const char * argv[])
{
    //1. 初始化数据
    initData();

    while (1)
    {
        int userSelect =  showMenu();
        
        switch (userSelect)
        {
            case 1:
                //查询学生
                query();
                break;
            case 2:
                //新增学生
                addStudent();
                break;
            case 3:
                //删除学生
                deleteStudent();
                break;
            case 4:
                //修改学生
                modifyStudent();
                break;
            default:
                //结束程序.
                break;
        }
        
    }
    
    
    
    return 0;
}
