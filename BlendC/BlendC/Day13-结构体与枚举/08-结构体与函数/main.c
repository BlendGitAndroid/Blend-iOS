/*
 
 1. 结构体作为函数的参数
 
    1). 结构体是我们自定义的一种数据类型,也是一种数据类型 所以当然可以作为函数的参数.
 
    2). 结构体作为参数传值 是 值传递.
 
    3). 如果你就是希望函数的内部可以修改实参结构体变量的值,那么就是要指针.
 
 
 
 2. 结构体作为函数的返回值.
 
    1). 结构体类型完全可以作为函数的返回值.
 
    2). 在返回的时候 直接将这个结构体变量的值返回即可.
 
    3). 如果你要返回结构体变量的地址.那么就要把这个结构体变量创建在堆区.
 
 
 
 
 
 
 */
#include <stdio.h>
#include <stdlib.h>


struct Student
{
    char *name;
    int age;
    int score;
};


//判断1个学生的成绩是否及格.
void panDuanXueSheng(struct Student* stu)
{
//    if(stu.score >= 60)
//    {
//        printf("恭喜%s你及格了.\n",stu.name);
//    }
//    else
//    {
//         printf("不好意思%s你落榜了.\n",stu.name);
//    }
    
    stu->score = 100;
    
    //stu.score = 100;
    
}


struct Student * getAStudent()
{
//    struct Student s1 = {"rose",21,100};
//    
//    return &s1;
    
    struct Student* p1 =  calloc(1, sizeof(struct Student));
    p1->name = "rose";
    p1->age = 18;
    p1->score = 100;
    return p1;
    
    
}



int main(int argc, const char * argv[])
{
    
    
    struct Student* s1 =  getAStudent();
    
    printf("%s-%d-%d\n",s1->name,s1->age,s1->score);
    
    
//    struct Student s1 = {"小明",18,89};
//    
//    panDuanXueSheng(&s1);
//    
//    printf("s1.score = %d\n",s1.score);
    
    
    
    return 0;
}
