//
//  query.h
//  Day14-预处理指令
//
//  Created by 黑马程序员 on 20/3/11.
//  Copyright © 2020年 itheima. All rights reserved.
//

#ifndef query_h
#define query_h

#include <stdio.h>

#include "student.h"

/**
 *  查询学生
 */
void query();


/**
 *  显示查询的二级菜单.
 */
int showQueryMenu();


/**
 *  查询所有的学生信息
 */
void queryAll();

/**
 *  根据编号查询
 */
void queryById();

/**
 *  根据姓名查询
 */
void queryByName();

/**
 * 根据年龄查询
 */
void queryByAge();

/**
 *  根据性别查询
 */
void queryByGender();


/**
 *  根据成绩查询
 */
void queryByScore();




#endif /* query_h */
