/*
 1. 我们班有1个学习小组 5个人 每1个人有自己的名字.
    要将这5个人的名字全部存储起来..
 
 
    1). 声明5个字符数组或者5个字符指针.
 
 
        char name1[] = "jack";
        char name2[] = "rose";
        char name3[] = "lily";
        ......
 
 
        char *name1 =  "jack";
        char *name2 = "rose";
 
        .......
 
        一共有5个名字,要把这5个名字全部存储起来.
 
 
    2). 使用一个二维的字符数组 来存储多个字符串. 每1行就是1个字符串.
 
        char names[][10] = 
        {
            "jack","rose","lily"
        };
 
        这个数组的每一行是 1个长度为10的char一维数组.最多存储长度为9的字符串.
        缺点: 每1个字符串的长度不能超过 列数-1
 
 
 
    3). 使用字符指针数组来存储多个字符串数据.
 
        char* names[4];
        这是1个一维数组.每1个元素的类型是char指针.
 
        char* names[4] = {"jack","rose","lily","lilei"};
 
        names数组的元素的类型是char指针
        初始化给元素的字符串数据是存储在常量区的.
        元素中存储的是 字符串在常量区的地址.
 
        优点: 每1个字符串的长度不限制.
 
 
 
 
 
 
 
 */




#include <stdio.h>

int main(int argc, const char * argv[])
{
    
    char* names[4] = {"jadcwdwfwfwfwfwfwfwfwffwfwfwfck","rfwfose","lily","lilei"};
    
    
    
    for(int i = 0; i < 4; i++)
    {
        //            names[0]
        printf("%s\n",names[i]);
    }
    
    
    
    return 0;
    
    
    
    
    
//    char names[][10] =
//    {
//        "jack1ddqdwddqdq","rose","lily"
//    };
//    
//    
//    for(int i = 0; i < 3; i++)
//    {
//        printf("%s\n",names[i]);
//    }
//    
 
    
    
    return 0;
}
