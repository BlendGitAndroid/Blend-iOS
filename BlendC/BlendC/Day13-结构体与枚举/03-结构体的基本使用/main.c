/*
 
 1. 我们前面学习了很多种的数据类型
 
    int 
    double
    float
    char
    数组
    指针
    .....
 
    不同的数据类型的变量是用来保存不同类型的数据的.
 
    请声明1个变量,来保存1个人的年龄.
 
    0 200 整数.
    1个字节.
 
    unsigned char age = 18;
 
    int age = 10;
 
 
    保存1个人的身高.
    float height;
 
 
    int num;
    double avg;
 
    1个变量就来存储1个数据.描述这个数据.
 
 
    请声明1个变量,来保存1个学生信息.
    感觉无能为力.
 
    使用我们之前学习的任何1个变量,好像都不行.
 
    1个学生的信息:
    姓名 字符串
    年龄 int
    性别 字符串
    成绩 int
 
 
    1个学生的信息至少是上面的那几个数据联合起来描述的.
    如果我们要表示1个学生.就需要多个普通的变量和起来描述.
 
    学生信息:
    char *name;
    int age;
    char *gender;
    int score;
 
    要这四个变量合起来才能表示1个学生的信息.
    首先数组,然后打击了. 数组要求元素的类型一致.
    数组拜拜.
 
 
    就希望: 有一种数据类型. 我们声明这个个数据类型的变量. 这个变量就是由其他的几个普通的小变量组成的.
 
           这个变量是由其他的几个普通变量组合而成的.
 
    问题: 现在没有这种类型的变量.
    希望: 有一种数据类型.是由多个其他的普通变量联合成的.
          声明这个数据类型的变量.这个变量中就是有这些普通变合起来的.
 
 
 2. 没有这种类型的变量怎么办?
 
    那么我们就自己定义这样的数据类型.
    指定这个数据类型的变量由哪些小变量合成的.
 
 
    新类型NewType: int,int,char*,double;
 
 
    NewType type;
 
 

 3. 使用结构体来创建新的数据类型.
 
 
    1). 如何使用结构体来创建新的数据类型呢?
 
        语法格式:
 
        struct 新类型名称
        {
            //在这里面写上,你创建的新类型是由哪些变量联合而成的.
            数据类型1 小变量名称1;
            数据类型2 小变量名称2;
            数据类型3 小变量名称3;
        };
 
        
        struct Student
        {
            char *name;
            int age;
            int score;
            float height;
        };
 
        代表我们新创建了1个数据类型.这个数据类型的名称叫做 struct Student.
        这个新的类型是由 1个char* int int float的小变量联合而成的.

 
 
 
 4. 声明结构体类型的变量.
 
    1). 我们使用结构体仅仅是创建了1个新的类型而已,并没有变量.
        结构体的作用:是在指定新的数据类型是由哪些小变量组合而成的.
 
 
    2). 声明结构体类型的变量.
        
        语法格式:
 
        struct 新类型名称 变量名;
 
        struct Student stu;
        代表声明了1个 struct Student类型的变量.变量名字叫做stu
        这个时候, stu才是1个变量.才会在内存中申请空间.
 
        这个变量中,是由这个新的结构体类型规定的小变量组合而成的.
 
 
        这个结构体大变量是由结构体类型规定的小变量组合而成的.
 
 
    3). 结构体变量的类型:
 
        struct Student stu;
 
        这个时候stu结构结构体变量的类型是struct Student. 而不是Student
 
 
 
 5. 为啥要这么弄?
 
    因为我们要把学生的信息存储在内存中.
    而1个学生的信息是由多个变量联合在一起描述的.
 
    姓名
    年龄
    成绩
    身高
 
    1). 就声明4个变量嘛.不好. 不方便管理.
    2). 能不能有1个大变量. 这1个大变量中就有这4个小变量组成的.
        要声明这个类型的大变量.首先得有这样的数据类型.
 
        而C语言中并没有这样的类型. 但是C语言提供了一种机制,可以让我们自定义数据类型
        让我们自定义1个大变量是由哪些小变量合成的.;
 
        结构体.
    3). 如何使用结构体来定义1个新的数据类型.指定这个新的数据类型由哪些小变量而成的.
 
        strcut 新类型名称
        {   
           你想要这个新的类型由哪些小变量组成,就把这些小变量的类型和名称写在这里.
           相当于,就把哪些小变量声明在里面.
           数据类型1 小变量名1;
           数据类型2 小变量名2;
           .......
 
        };
 
        定义1个变量,来保存1辆车的信息.
        char *品牌
        char *型号
        double 价格
        int 座位数量.
        char *颜色.
 
 
        使用结构体,来定义这个类型.
 
        struct Car
        {
            char *brand;
            char *model;
            double price;
            int seatNum;
            char *color;
        };
    
 
 
    4). 结构体只是创建了1个新的数据类型.
        所以,你真的要保存1个信息的话,还要去声明这个类型的变量.
 
        struct Car bmw;
 
        结构体变量里面就是由结构体类型规定的小变量联合而成的.
 
 
 
 6. 结构体变量的初始化.
 
    1). 意义: 为结构体变量中的小变量赋值.
 
    2). 初始化的语法:
 
        结构体变量名称.小变量名 = 数据;
 
        成员.
          
        结构体变量名.成员名 = 数据;
 
    3).
 
 
 
 7. 什么时候我们自己要定义结构体.
 
 
    当我们要保存1个数据.但是发现这个数据是1个大数据,因为这个数据是由其他的小数据联合起来组成的.
    那么这个时候 
    先使用结构体类自定义这个数据类型由哪些小变量合成的
    让后再根据这个结构体类型声明变量 来保存数据.]
    
    风扇
    重量
    颜色
    功率
    转速
    价格
 
 
 
 8. 使用结构体需要注意的几个小问题.
 
    1). 一定要先使用结构体定义新的类型.
        然后才可以根据这个类型 声明这个类型的变量.
 
    
    2). 结构体变量是1个变量.所以可以批量声明.
 
        struct Student xiaoHua,jim,meimei,lilei;
 
    3). 结构体的名称的的命名规范,要求每一个单词的首字母大写.
 
 
    4). 我们之前,是先声明结构体类型,再根据这个类型声明变量.
        实际上这两步 可以简化为1个步骤.
 
         struct Computer
         {
            char *cpuModel;
            int memSize;
            char *brand;
         } iMac,lenvol,hp,dell;

        声明结构体类型的同时,声明结构体类型的变量.
 
    
    5). 匿名结构体
 
        就是这个结构体类型没有名称.
 
 
         struct
         {
             char *barnd;
             char *color;
             int price;
         }fengshan1;
 
         a. 只能在声明结构体的同时就创建变量.
         b. 不能单独的声明这个结构体类型的变量.
         
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 */

#include <stdio.h>

int main(int argc, const char * argv[])
{
    
    
    
    
    
//    int arr[] = {10,20,30};

    
//    printf("arr = %p\n",arr+1);
//    printf("arr = %p\n",&arr+1);

    
    
//    
//    char arr[10][81] = {"aaaa","bbbb","ccccc"};
//    
//    printf("*arr = %p\n",*arr);
//    printf("arr = %p\n",arr);
//    
//    //数组名代表数组的地址.第0个元素的地址 .也就是第0行的地址.
//    char *t = *(arr+1);
//    
//   
//    
//    printf("t = %p\n", t);
//    
//     printf("t = %p\n", arr[1]);
//    
    
    
    
    
    
    return 0;
    
    
    
    
    
    
    
    
    
    struct Student
    {
        char *name;
        int age;
        int score;
        float height;
    };
    
    //jack 17 100 189.8
    struct Student stu;
    stu.name = "jack";
    stu.score = 100;
    stu.age = 17;
    stu.height = 189.8;
    
    
    printf("姓名:%s. 年龄:%d  成绩:%d 身高:%.2f\n",
           stu.name,
           stu.age,
           stu.score,
           stu.height
           );
    
    
    //小明.
    struct Student xiaoMing;
    xiaoMing.name = "小明";
    xiaoMing.age = 18;
    xiaoMing.score = 99;
    xiaoMing.height = 175.4;
    
    printf("姓名:%s. 年龄:%d  成绩:%d 身高:%.2f\n",
           xiaoMing.name,
           xiaoMing.age,
           xiaoMing.score,
           xiaoMing.height
           );
    
    
    struct Student xiaoHua,jim,meimei,lilei;
    
    
    
    
    struct Computer
    {
        char *cpuModel;
        int memSize;
        char *brand;
    } iMac,lenvol,hp,dell;
    
    iMac.cpuModel = "i5";
    iMac.memSize = 16;
    iMac.brand = "Apple";
    
    
    struct Computer acer;
   
    
    
    
    
    struct
    {
        char *barnd;
        char *color;
        int price;
    }fengshan1;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    
//    struct Computer iMac;
//    iMac.cpu = "i5";
//    //....
    
    
    
    
    
    
    return 0;
}
