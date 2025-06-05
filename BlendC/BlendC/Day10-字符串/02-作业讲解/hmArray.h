//
//  hmArray.h
//  Day10-字符串
//
//  Created by 黑马程序员 on 20/3/5.
//  Copyright © 2020年 itheima. All rights reserved.
//

#ifndef hmArray_h
#define hmArray_h

#include <stdio.h>


/**
 *  找出指定数组中的最大值
 *
 *  @param arr 指定的数组
 *  @param len 数组的长度
 *
 *  @return 数组的最大值.
 */
int getMax(int arr[],int len);



/**
 *  找出指定数组中的最小值
 *
 *  @param arr 指定的数组
 *  @param len 数组的长度
 *
 *  @return 数组的最小值.
 */
int getMin(int arr[],int len);


/**
 *  求指定数组中的累加和
 *
 *  @param arr 指定的数组
 *  @param len 数组的长度
 *
 *  @return 数组的累加和.
 */
int getSum(int arr[],int len);



/**
 *  求指定数组中的平均值
 *
 *  @param arr 指定的数组
 *  @param len 数组的长度
 *
 *  @return 数组的平均值.
 */
int getAvg(int arr[],int len);

/**
 *  查找指定的元素在数组中出现的下标
 *
 *  @param arr 指定的数组
 *  @param len 数组的长度
 *  @param key 要找的数据
 *
 *  @return 下标
 */
int indexOf(int arr[],int len,int key);


/**
 *  查找指定的元素在数组中出是否包含
 *
 *  @param arr 指定的数组
 *  @param len 数组的长度
 *  @param key 要找的数据
 *
 *  @return 是否包含
 */
int isContains(int arr[],int len,int key);


/**
 *  对传入的数组进行从大到小排序
 *
 *  @param arr 给定的数组
 *  @param len 数组的长度
 */
void sort(int arr[],int len);




#endif /* hmArray_h */
