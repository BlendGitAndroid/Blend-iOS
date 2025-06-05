//
//  myRandom.c
//  Day08-进制
//
//  Created by 黑马程序员 on 20/3/2.
//  Copyright © 2020年 itheima. All rights reserved.
//

#include "myRandom.h"
#include <stdlib.h>


/**
 *  产生指定范围的随机数
 *
 *  @param min 最小值
 *  @param max 最大值
 *
 *  @return 随机数
 */
int getARandomNumber(int min,int max)
{
   return  arc4random_uniform(max - min + 1) + min;
}