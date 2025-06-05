/*
 
 有1个字符串 
 "dhiwdhiwdniwneiwneriwneiwneiwnewnerwneriwnrenwieniwneiwneiwneiwneiwnewi";
 
 
 求这个字符串中 字符'e' 出现的次数.
 
 
 思路:
 
 声明1个整型的变量记数:
 
 遍历每1个字符.判断这个字符如果是'e' 计数器++
 
 
 
 
 
-----
 
 以字符指针存储字符串数据 和 字符数组 存储字符串数据的优势.
 
 
 建议大家使用字符指针来存储字符串数据.
 
 
 1). 以字符数组来存储字符串数据: 长度固定. 一旦创建以后,就最多只能存储这么多个长度的字符串数据了.
 
     以字符指针的形式存储字符串数据.长度任意.
 
 
 
 
 
 
 
 
 
 
 
 */
#include <stdio.h>

int main(int argc, const char * argv[])
{
    
    char name[] = "jaeed1eddsckd2qd2wf2f2f2ff3f3f";
    
    
    
    
    char *name1 = "jack";
    name1 = "dwnifhiwnfiwnfiewnfiwnfiwfnb";

    
    char *str = "edhiwdhiwdniwneiwneriwneiwneiwnewnerwneriwnrenwieniwneiwneiwneiwneiwnewi";
    
    int count = 0;//计数器.
    
    //遍历字符串中的每1个字符.
    //通过指针可以找到字符串的第1个字符.
    //那么我们就可以不断+1 找下1个字符. 直到遇到'\0'结束.
    
    int i = 0;
    while (str[i] != '\0') //中括弧的本质.  str[i]  ====  *(str+i)
    {
        if(str[i] == 'e')
        {
            count++;
        }
        i++;
    }
    
    printf("count = %d\n",count);
    
    
    
    
    
    
    
    
    
    
    
    return 0;
}
