/*
 1. switch-case结构. 选择结构.
 
 
 2. 语法:
 
    switch(表达式)
    {
        case 值1:
             执行代码;
             break;
        case 值2:
             执行代码;
             break;
        case 值3:
             执行代码;
             break;
        default:
             执行代码;
             break;
    }
 
    注意: switch后的表达式没有说必须是1个条件表达式.
 
 
 3. 执行步骤
     
    a. 先计算switch后面的表达式的结果.
    b. 从上到下的将这个结果和每1个case后面的值进行相等比较判断.
    c. 只要有1个相等.那么就执行其中的代码.执行完毕之后 就结束整个switch结构.
    d. 如果不相等.再判断下1个case的值.
    e. 如果所有的case后面的值和表达式的结果都不相等.就执行default中的代码.
 
 
 4. 请用户输入1个星期数.输出对应的英文星期天
    1-7 火星来的.
 
 
 5. 使用注意
    1). switch后面的小括弧中可以写1个表达式、变量、常量.
 
    2). case穿透
        每1个case块后面的break在语法上是可以不写的.
        break的意思: 代表立即结束整个switch-case结构.
        如果case块中没有break:那么就会直接穿透到下1个case中执行代码.
        直到遇到break才会结束switch结构. 或者执行完.
 
        所以,一般情况下,我们不希望穿透到下1个case中执行代码.
        所以.一般情况下,每一个case的后面都要加1个break.
 
        如果多个case块的处理逻辑是一样的,那么我们可以利用case穿透来简写代码.
 
 
 
 
    3). 案例: 根据月份打印季节.
 
 
    4). switch后面的表达式任意类型都是可以的.除了实型.
        switch后面的表达式的结果除了小数 其他都是可以的.
        就不能是小数,是小数就报错.
 
 
    5). case块可以加1个大括弧.这样写没有任何影响,
        但是一般情况下 我们都不加.直接写在case下面.
 
     
    
    6).  case块下面可以写任意行代码,只要符合你的逻辑.
         如果case块中要声明变量.那么这个case块就必须要使用大括弧.
 
    7).  case块可以有任意个 根据你的逻辑来.
         default可以省略. 如果省略就没有默认执行代码了.
 
 
 
 6. 课堂练习:
     请用户输入1个年份,再输入1个月份,显示这1年的这1月有多少天.
     提示:
     1、3、5、7、8、10、12月份,无论是那个年份 都有31天.
     4、6、9、11月份,无论是那个年份，都是30天.
     如果是2月份,年份是闰年的话那么就有29天 否则就是28天.

 
 7. switch-case与if结构
 
    1). 能够使用switch-case结构写出来的代码.一定可以使用if结构写出来.
        if结构可以写出来的代码不一定可以使用switch-case写了.
 
    2). switch结构只能做等值判断.不能直接做范围判断.并且case后面的数据不能有变量.
        if结构既可以做等值判断 也可以做范围判断.
 
    3). 使用建议:
        如果是做等值判断 建议使用switch
        如果是做范围判断 才用if
 
 
 
 
 */

#include <stdio.h>

int main(int argc, const char * argv[])
{
    
//    int num = 10;
//    if(num > 0)
//    {
//        printf("哈哈\n");
//    }
//    else
//    {
//        printf("呵呵\n");
//    }
//    
//    
//    switch (num)
//    {
//        case 10 > 0 :
//            printf("哈哈\m");
//            break;
//        case num < 0:
//            printf("呵呵\n");
//            break;
//        default:
//            break;
//    }
    
    
    
    
    
    
    //1. 先输入年份和月份.
//    int year = 0, month = 0;
//    printf("请输入年份和月份: ");
//    scanf("%d%d",&year,&month);
//    //2. 先判断月份
//    //   1、3、5、7、8、10、12月份,无论是那个年份 都有31天.
//    //   4、6、9、11月份,无论是那个年份，都是30天.
//    //   2 判断年份是否为闰年.
//    switch(month)
//    {
//        case 1:
//        case 3:
//        case 5:
//        case 7:
//        case 8:
//        case 10:
//        case 12:
//            printf("%d年%d月有31天.\n",year,month);
//            break;
//        case 4:
//        case 6:
//        case 9:
//        case 11:
//            printf("%d年%d月有30天.\n",year,month);
//            break;
//        case 2:
//            //判断年份是否为闰年.
//            if(year % 400 == 0 || (year % 4 == 0 && year % 100 != 0))
//            {
//                printf("%d年%d月有29天.\n",year,month);
//            }
//            else
//            {
//                printf("%d年%d月有28天.\n",year,month);
//            }
//            break;
//        default:
//            printf("你丫的是派来逗我的吗?\n");
//    }
    
 
    
    
    
    
    
    
    
//    //double num =  1.1;
//    switch (1.1 + 1.1)
//    {
//            case 10:
//            case 20:
//        
//    }
    
    
    
    //请用户输入1个月份.输出这个月份所属的季节/
    //123 春 456 789 101112
    
    
    
//    int month = 0;
//    printf("请输入1个月份: ");
//    scanf("%d",&month);
//    
//    switch(month)
//    {
//        case 1:
//        case 2:
//        case 3:
//        {
//            int num = 10;
//            printf("春天来了,万物复苏.\n");
//            break;
//        }
//        case 4:
//        case 5:
//        case 6:
//            
//            printf("夏天夏天悄悄过去留下小秘密\n");
//            break;
//            
//        case 7:
//        case 8:
//        case 9:
//            printf("秋风扫落叶\n");
//            break;
//            
//        case 10:
//        case 11:
//        case 12:
//            
//            
//            printf("冬天来了. 春天还会远吗?");
//            break;
//            
////        default:
////            
////            printf("你是从火星来的吗?");
////            break;
//            
//    }
    
    
    
    
    
    
    
    
    
    
    
    
//    int num = 10;
//    
//    switch(num + num)//20
//    {
//        case 10:
//            printf("AAAAA\n");
//            
//        case 20:
//            printf("BBBBBBBB\n");
//            
//        case 30:
//            printf("CCCCCCCC\n");
//            
//        default:
//            printf("DDDDDDDDD\n");
//            
//    }
//    
//    
//    printf("OVER\n");
    
    
    
    
    
//    switch (10)
//    {
//        case 1:
//            printf("AAA");
//            break;
//        case 10:
//            printf("BBBBB");
//            break;
//        default:
//            printf("CCC");
//    }
    
    
//    //1.接收输入整型星期天.
//    int weekDay = 0;
//    printf("请输入数字的星期天: ");
//    scanf("%d",&weekDay);
//    //2.判断输入的数是否等于 1 2 3 4 5 6 7
//    switch(weekDay)
//    {
//       case 1:
//            printf("XingQiYi\n");
//            break;
//        case 2:
//            printf("XingQiEr\n");
//            break;
//        case 3:
//            printf("XingQiSan\n");
//            break;
//        case 4:
//            printf("XingQiSi\n");
//            break;
//        case 5:
//            printf("XingQiWu\n");
//            break;
//        case 6:
//            printf("XingQiLiu\n");
//            break;
//        case 7:
//            printf("XingQiTian\n");
//            break;
//        default:
//            printf("Are You From FireStar\n");
//            break;
//    }
//    
    //3.否则 火星.
    
    
    
//    int num = 7;
//    
//    switch(num + num)//20
//    {
//        case 10:
//            printf("AAAAA\n");
//            break;
//        case 20:
//            printf("BBBBBBBB\n");
//            break;
//        case 30:
//            printf("CCCCCCCC\n");
//            break;
//        default:
//            printf("DDDDDDDDD\n");
//            break;
//    }
//    
//    
//    printf("OVER\n");
    
    
    
    
    
    
    
    
    
    
    
    
    
    return 0;
}
