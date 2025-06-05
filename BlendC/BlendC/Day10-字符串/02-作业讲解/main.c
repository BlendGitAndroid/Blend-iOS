//
//  main.c
//  02-作业讲解
//
//  Created by 黑马程序员 on 20/3/5.
//  Copyright © 2020年 itheima. All rights reserved.
//

#include <stdio.h>
#include "hmArray.h"

int main(int argc, const char * argv[])
{
    /*
     9. 有1个整型数组,请自己设计算法将这个数组中的元素进行翻转(此题选作*****)
     比如: 有数组 int arr[5] = {10,11,3,45,6};
     将元素的值设置为翻转        {6,45,3,11,10}
     
    
    
    int arr[] = {10,210,21302,132,43,24,3,5,46,4};
    int len = sizeof(arr)/sizeof(arr[0]);
    
    for(int i = 0; i < len/2; i++)
    {
        int temp = arr[i];
        arr[i] = arr[len-1-i];
        arr[len-1-i] = temp;
    }
    
    
    for(int i = 0; i < len;i++)
    {
        printf("%d ",arr[i]);
    }
    */
    
    
    
    /*
     8. 写1个程序,接收输入班级的人数, 然后依次的输入每1个学员的成绩.
     将学员的成绩存储在数组之中.
     输入完毕之后, 显示总成绩和平均成绩.
     
     然后再去掉1个最高分和1个最低分, 再计算平均成绩.
     
    
    
    //1.接收输入班级人数
    int num = 0;
    printf("请输入班级人数: ");
    scanf("%d",&num);
    
    //2.声明1个数组存储学生成绩.数组的长度有多少个人就有多少个长度.
    int scores[num];
    
    //3. 循环接收每个人的成绩并将成绩存储到数组中.
    for(int i = 0; i < num; i++)
    {
        printf("请输入第%d个同学的成绩: ",i+1);
        scanf("%d",&scores[i]);
    }
    
    //4.调用模块中的函数求累加和与平均值.
    int totalScore = getSum(scores, num);
    int avg = getAvg(scores, num);
    
    //5.找最大值和最小值.
    int max = getMax(scores, num);
    int min = getMin(scores, num);
    
    //6. 再求累加和平均值.
    //   (总成绩 - 最高分 - 最低分)/(人数 -2 )
    
    int avg1  =  (totalScore - max - min) / (num - 2);
    
    
    printf("总成绩为%d,平均成绩为%d,去掉1个最高分:%d 再去掉1个最低分:%d 平均成绩是:%d",
           totalScore,
           avg,
           max,
           min,
           avg1
           );
    
    
    
     */
    return 0;
}
