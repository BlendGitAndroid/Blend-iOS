/*
 --------这两个函数的声明是在stdio.h中---------
 1. puts()函数.
    作用:用来输出字符串的.
    语法格式: puts(存储字符串的字符数组名);
    优点:输出完毕之后,自动换行.
    缺点:只能输出字符串.也不能使用占位符.
 
 
 2. gets()函数
    作用: 从控制台接收用户输入1个字符串数据.
    语法格式: gets(存储字符串的字符数组名);
    优点: 当用户输入的数据包含空格的时候 它会连空格一起接收.
 
    缺点:和scanf函数一样 不安全.
        当用来存储字符串的数据的字符数组的长度不够的时候 程序就会崩溃.
 
 ------下面四个函数 是声明在string.h这个头文件中------
 
 3. strlen();函数
 
    作用: 得到存储在字符数组中字符串数据的长度.
 
    语法格式:   strlen(字符串);
 
 
 4. strcmp()函数.
    cmp --> compare 比较.
 
    作用: 用来比较两个字符串的大小的.
 
    语法格式:
    strcmp(字符串1,字符串2);
    返回值是int类型的.
    
    如果返回的是负数.就说明字符串1比字符串2小.
    如果返回的是正数 就说明字符串1比字符串2大.
    如果返回的是0 就说明一样.
 
    比较的规则:比的是相同位置的字符的ASCII码的大小.
 
 
 
 5. strcpy()函数  copy 
 
    作用: 把存储在1个字符数组中的字符串数据拷贝到另外1个字符数组中存储.
 
    格式:
    strcpy(字符串1,字符串2);
    将字符串2拷贝到字符串1数组中.
 
 
    可能的问题.
    存储字符串1的字符数组长度不够,无法存储字符串2 这个时候运行就会崩溃.
 
 
 
 6. strcat()函数. concat: 连接.
 
    语法格式: 
    strcat(字符数组1,字符数组2);
 
    作用: 把存储在字符数组2的字符串数据链接在字符串1的后面.
         将两个字符串合成1个字符串.
 
    存在的问题:
    如果字符数组1中无法存储下字符数组2的字符串数据,运行就会报错.
 
 
 
 
 
 
 
 
 */
#include <stdio.h>
#include <string.h>

int main(int argc, const char * argv[])
{
    
    char name1[] = "jack";
    char name2[] = "rose";
    
    
    strcat(name1, name2);
    
    puts(name1);
    
    
    
//    char name1[] = "s";
//    char name2[] = "jack";
//    
//    
//    strcpy(name1, name2);
//    
//    printf("name1 = %s\n",name1);
    
    
    
//    char name1[] = "afk";
//    char name2[] = "afk";
//    
//    
//    int res =  strcmp(name1, name2);
//    
//    
//    printf("res = %d\n",res);
    
    
//    char name[100] = "jack";
//    unsigned long len =  strlen(name);
//    printf("len = %lu\n",len);
//    
    
    
    
    
    
//    //1.声明1个用来保存字符串数据的1个字符数组.
//    char name[10];
//    
//    //2.使用gets函数接收用户输入字符串数据并存储到指定的字符数组中.
//    printf("请输入你的姓名: ");
//    gets(name);
//    
//    //3. 打印,
//    puts(name);
    
    

//    char name[] = "jack";
//    
//    
//    puts(name);
    
    
    
    
    return 0;
}
