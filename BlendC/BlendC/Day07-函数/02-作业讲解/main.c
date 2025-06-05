/*
 
 
 
 
 
 */

#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char * argv[])
{
    
    /*
     8. 打印100 - 999中不能被7整除又不包含7的数
     思路:先找出100-999之间的不能被7整除的数. 再判断这个数中是否有7 如果没有就打印.
     
     
    for(int i = 100; i < 1000; i++)
    {
        if(i % 7 != 0)
        {
            int bai = i / 100;
            int shi = i % 100 / 10;
            int ge = i % 10;
            if(bai != 7 && shi != 7 && ge != 7)
            {
                printf("%d\n",i);
                
            }
            
        }
    }
     */

    
    
    
    /*
     本金10000元存入银行，年利率是千分之三，每过1年，将本金和利息相加作为新的本金。计算5年后，获得的本金是多少？
     思路:
     先计算第1年: 10030
            2    10030 * 1.003;
            3.   10030 * 1.003 * 1.003;
            4.   10030 * 1.003 * 1.003 * 1.003;
            5.   10030 * 1.003 * 1.003 * 1.003 * 1.003;
     
     从第1年开始算,1年1年的往下算 算5年.
     循环5次.每次循环就算下1年的.
     
     
   
    
    double money = 10000;
    
    for(int i = 0; i < 5; i++)
    {
        money *= 1.003;
    }
    
    
    printf("%.2lf\n",money);
    */
    
    
    
    

    /*
     
    3. 随机产生10个3-200之间的随机数,求出其中的最大值.
     
    int max = INT32_MIN;
    for(int i = 0; i < 10; i++)
    {
        int num = arc4random_uniform(198) + 3;
        printf("随机数是:%d\n",num);
        if(num > max)
        {
            max = num;
        }
    }
    
    printf("max = %d\n",max);
    */
    
    
    
    
    
    return 0;
}
