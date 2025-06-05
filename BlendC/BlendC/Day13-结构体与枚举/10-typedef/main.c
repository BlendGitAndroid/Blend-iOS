/*
 1. typedef ----> type define  类型定义.
 
    作用: 为一个已经存在的数据类型取1个别名.
         如果我们想要使用这个类型,直接使用这个别名就可以了.
 
 
    语法格式:
 
    typedef 已经存在的数据类型 别名;`
 
    typedef int itheima;  为int数据类型取了1个别名,叫做itheima
    
    如果我们要使用int类型. 就可以直接使用itheima
 
    这个时候 itheima 完全等价于 int 
    因为itheima是int的1个别名.
 
 
    typedef char* string;
    将char* 类型取1个别名.叫做string
 
    所以,就可以使用string代替char*
    size_t  其实就是 unsigned long
 
 
 
 2. 什么时候为已经存在的数据类型取1个别名呢?
 
 
    当数据类型很长的时候, 就可以为这个数据类型取1个短1点的别名.
    这样用起来就很方便.
    
 
 
 
 3. 使用typedef为结构体类型取别名.
 
    1). 先声明结构体类型.然后在使用typedef为这个结构体类型取1个短别名.
 
         struct Student
         {
            char *name;
            int age;
            int score;
         };
         typedef struct Student Student;
 
    2). 声明结构体类型的同时,就使用typedef来为结构体类型取1个短别名.
 
         typedef struct Student
         {
             char *name;
             int age;
             int score;
         } Student;
 
 
    3). 声明匿名结构体的同时,就使用typedef来为结构体类型取1个短别名.
 
         typedef struct
         {
             char *name;
             int age;
             int score;
         } Student;
 
         这是最常用的方式.
 
 
 
 
 4. 使用typedef为枚举类型取1个短别名
 
    1). 先声明枚举类型,然后再使用typedef来为枚举类型取1个短别名.
 
 
         enum Direction
         {
             DirectionEast,
             DirectionSouth,
             DirectionWest,
             DirectionNorth
         };
         
         
         typedef enum Direction Direction;
 
 
    2). 声明枚举类型的同时,就使用typedef来为枚举体类型取1个短别名
    
         typedef enum Direction
         {
             DirectionEast,
             DirectionSouth,
             DirectionWest,
             DirectionNorth
         } Direction;
 
 
    3). 使用上面这种方式的时候,枚举的名称就没有必要写了.
 
 
         typedef enum
         {
             DirectionEast,
             DirectionSouth,
             DirectionWest,
             DirectionNorth
         } Direction;

 
 
 
 
 
 */

#include <stdio.h>
#include <stdlib.h>

typedef struct
{
    char *name;
    int age;
    int score;
} Student;

//typedef struct Student Student;


typedef enum
{
    DirectionEast,
    DirectionSouth,
    DirectionWest,
    DirectionNorth
} Direction;


//typedef enum Direction Direction;


int main(int argc, const char * argv[])
{
    
    
    Direction dir= DirectionEast;
    //enum Direction dir = DirectionEast;
    
    //Student s1;
    
    
    
    
    
    
    //typedef  int itheimaitcasthahahahah;
//  
//    typedef  unsigned long long int  hm;
//    
//    
//    unsigned long long int num = 10;
//    hm num1 = 100;
//    
//    
    
    
    
    
   
//    typedef char* string;
//    
//    string name = "rose";
//    string address = "人民路12号";
//    
//    
//    typedef double liKai;
//    
//    
    
    
//    typedef int itheima;
//    
//    
//    int num = 10;
//    itheima num1 = 10;
//    
//    num
    
    
    
    
    
    
    return 0;
}
