/*
  1. 求1堆数的最大值或者最小值.
 
    
     请用户输入5个数,求着5个数中的最大数.
 
 
  
  2. 实现步骤.
 
     1). 摆擂台. 声明1和擂台变量.
 
     2). 拿到这1堆数中的每1个数,将这堆数中的每1个数遍历出来
 
     3). 将遍历出来的数和擂台上的数进行比较,比得过就上 比不过就滚蛋.
 
     4). 当遍历完成以后,擂台上的数就是他们中的最大数.
 
 
 
 3. 问题.
 
 
 
 
 
 */

#include <stdio.h>

int main(int argc, const char * argv[])
{
    
    int min = INT32_MAX;
    
    int i = 0;
    while (i < 5)
    {
        printf("请输入第%d个数: ",i+1);
        int num = 0;
        scanf("%d",&num);
        
        if(num < min)
        {
            min = num;
        }
        
        
        i++;
    }
    
    printf("min = %d\n",min);
    
    
    
    
//    //1. 声明1个擂台变量,用来保存最大数.
//    int max = INT32_MIN;
//    
//    //2. 拿到每个数.这5个数是输入的 所以我们使用1个循环.来输入.
//    int i = 0;
//    while (i < 5)
//    {
//        printf("请输入第%d个数: ",i+1);
//        int num = 0;
//        scanf("%d",&num);
//        
//        //如果是第1次输入数据.
////        if(i == 0)
////        {
////            max = num;
////        }
////        //num的值就是用户每次输入的数据.
//        if(num > max)
//        {
//            max = num;
//        }
//        i++;
//    }
//    
//    printf("max = %d\n",max);
//    
    
    
    return 0;
}
