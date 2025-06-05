/*
 
  1. 要处理学生信息.
 
     而1个学生信息是由:
     编号.
     姓名
     年龄
     性别
     成绩
     组合而成的.
 
     毫无疑问.应该自定义1个结构体类型来保存1个学生的数据.
     发现性别, 最好是用枚举. 所以我们定义了1个枚举来表示性别.
 
 
 2. 程序默认有10个学生的信息.
 
    那就使用1个长度为10的结构体数组来存储就可以了.
    这个数组中就是存储这10个学生的信息.
    很明显.这个数组中存储的学生的信息 是需要被多个函数访问的.
    所以,我们把这个数组定义为全局的.
 
 
    这个时候.我们的数据源,我们就准备好了.
 
 
 3. 业务流程    
    while(1)
    {

        1). 显示操作菜单.并接收用户的选择.
 
 
        2). 判断用户的选择.根据用户的选择来做不同的事情.
 
    }
 
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>


//#define NUM 10


/**
   性别枚举. 表示学员的性别.
 */
typedef enum
{
    GenderMale,
    GenderFemale
} Gender;



/**
 *  学生结构体,表示1个学生数据.
 */
typedef struct
{
    int id;//学生编号
    char *name;//学生姓名
    int age;//学生年龄
    Gender gender;//学生性别
    int score;//学生成绩
}Student;



/**
 *  结构体数组,这个数组中存储的是10个学生信息.
 */
//Student students[NUM] =
//{
//     {1,"jack",18,GenderMale,100},
//     {2,"rose",21,GenderFemale,45},
//     {3,"lily",26,GenderFemale,23},
//     {4,"jim1",12,GenderMale,89},
//     {5,"poly",3,GenderMale,67},
//     {6,"meimei",19,GenderFemale,89},
//     {7,"likai",31,GenderMale,88},
//     {8,"Qiang",45,GenderMale,12},
//     {9,"aDong",29,GenderMale,76},
//     {10,"asan",35,GenderMale,91},
//};

//只是声明了1个结构体指针.要在堆区创建1个长度为20数组.
//把默认的数据存储在堆中的这个数组中.
Student *students;





/**
 *  代表数组中真正的存储了多少个学生的信息.
 */
int realLength = 10;


/**
 *  数组的长度
 */
int arrayLength = 10;



/**
 *  在堆区创建1个长度为20的结构体数组.并设置前面10个默认数据.
 *  然后将创建的数组的地址赋值给全局变量students指针.
 */
void initData();



/**
 *  显示一级菜单.并接收用户的选择.
 */
int showMenu();

/**
 *  查询学生
 */
void query();

/**
 *  新增学生
 */
void addStudent();

/**
 *  删除学生
 */
void deleteStudent();


/**
 *  修改学生
 */
void modifyStudent();


/**
 *  显示查询的二级菜单.
 */
int showQueryMenu();


/**
 *  查询所有的学生信息
 */
void queryAll();

/**
 *  根据编号查询
 */
void queryById();

/**
 *  根据姓名查询
 */
void queryByName();

/**
 * 根据年龄查询
 */
void queryByAge();

/**
 *  根据性别查询
 */
void queryByGender();


/**
 *  根据成绩查询
 */
void queryByScore();













int main(int argc, const char * argv[])
{
    //调用函数创建数组,并初始化数据.
    initData();
    
    
    while (1)
    {

        
        //1. 显示操作菜单.并接收用户的选择.
        int userSelect =  showMenu();
        
        //2.判断用户的选择.根据用户的选择来做不同的事情.
        switch (userSelect)
        {
            case 1:
                //查询学生
                query();
                break;
            case 2:
                //新增学生
                addStudent();
                break;
            case 3:
                //删除学生
                deleteStudent();
                break;
            case 4:
                //修改学生
                modifyStudent();
                break;
            default:
                //结束程序.
                break;
        }
        
    }
    
    return 0;
}


/**
 *  在堆区创建1个长度为20的结构体数组.并设置前面10个默认数据.
 *  然后将创建的数组的地址赋值给全局变量students指针.
 */
void initData()
{
    //1. 先向堆内存申请空间. 在堆内存中创建了1个长度为20的结构体数组.
    //   然后将其赋值给全局变量.
    students =  calloc(arrayLength, sizeof(Student));
    
    //2. 初始化前面10个学生信息.
    *students     =  (Student){1,"jack",18,GenderMale,100};
    *(students+1) =  (Student){2,"rose",21,GenderFemale,45};
    *(students+2) =  (Student){3,"lily",26,GenderFemale,23};
    *(students+3) =  (Student) {4,"jim1",12,GenderMale,89};
    *(students+4) =  (Student) {5,"poly",3,GenderMale,67};
    *(students+5) =  (Student) {6,"meimei",19,GenderFemale,89};
    *(students+6) =  (Student) {7,"likai",31,GenderMale,88};
    *(students+7) =  (Student) {8,"Qiang",45,GenderMale,12};
    *(students+8) =  (Student) {9,"aDong",29,GenderMale,76};
    *(students+9) =  (Student) {10,"asan",35,GenderMale,91};
    
    
}



/**
 *  显示一级菜单.并接收用户的选择.
 */
int showMenu()
{
    //1.显示菜单
    printf("******************************************************\n");
    printf("*        请 使 用 传 智 播 客 学 生 管 理 系 统          *\n");
    printf("*                    1. 查 询 学 生                   *\n");
    printf("*                    2. 新 增 学 生                   *\n");
    printf("*                    3. 删 除 学 生                   *\n");
    printf("*                    4. 修 改 学 生                   *\n");
    printf("*                    5. 退 出 系 统                   *\n");
    printf("******************************************************\n");
    //2.接收用户的选择.
    printf("请输入你的选择: ");
    int userSelect = 0;
    scanf("%d",&userSelect);
    //3.将用户的选择返回.
    return userSelect;

}


/**
 *  查询学生
 */
void query()
{
    //查询学生.
    //1. 显示查询的二级菜单.并接收用户的选择.
    //   很明显这是1个独立的功能,我们再次的封装1个函数.
    int userSlect =  showQueryMenu();
    //2. 判断用户的选择,根据用户的的选择做出不同的查询.
    switch (userSlect)
    {
        case 1:
            //查询所有
            queryAll();
            break;
        case 2:
            //根据编号查询
            queryById();
            break;
        case 3:
            //根据姓名查询
            queryByName();
            break;
        case 4:
            //根据年龄查询
            queryByAge();
            break;
        case 5:
            //根据性别查询
            queryByGender();
            break;
        case 6:
            //根据成绩查询
            queryByScore();
            break;
    }
    
}

/**
 *  显示查询的二级菜单.
 */
int showQueryMenu()
{
    //1. 显示查询二级菜单.
    printf("***********欢迎使用学生查询系统***********\n");
    printf("*           1. 查询所有学生信息          *\n");
    printf("*           2. 根据编号查询             *\n");
    printf("*           3. 根据姓名查询             *\n");
    printf("*           4. 根据年龄查询             *\n");
    printf("*           5. 根据性别查询             *\n");
    printf("*           6. 根据成绩查询             *\n");
    printf("***************************************\n");
    //2.接收用户的选择.
    printf("请输入你要进行的查询编号: ");
    int userSelect = 0;
    scanf("%d",&userSelect);
    //3. 返回用户的选择.
    return userSelect;
}


/**
 *  查询所有的学生信息
 */
void queryAll()
{
    //查询所有的学生信息.
    //所有的学生的信息是存储在全局数组中.
    //只需要遍历打印就可以了.
    
    //{1,"jack",18,GenderMale,100},
    
    
    
    printf("编号\t\t姓名\t\t\t年龄\t\t性别\t\t成绩\n");
    
    for(int i = 0; i < realLength;i++)
    {
        printf("%d\t\t%s\t\t%d\t\t%s\t\t%d\n",
               students[i].id,
               students[i].name,
               students[i].age,
               students[i].gender == GenderMale ? "男" : "女",
               students[i].score
               );
    }
    
    
    
}

/**
 *  根据编号查询
 */
void queryById()
{
    
}

/**
 *  根据姓名查询
 */
void queryByName()
{
    
}

/**
 * 根据年龄查询
 */
void queryByAge()
{
    
}

/**
 *  根据性别查询
 */
void queryByGender()
{
    
}


/**
 *  根据成绩查询
 */
void queryByScore()
{
    //1. 让用户输入1个最小成绩.再让用户输入1个最大成绩.
    int min = 0, max = 0;
    printf("请输入最小成绩和最大成绩 使用空格分隔 :");
    scanf("%d%d",&min,&max);
    
    //2. 在学生数组中去找.看学生的成绩是否在这范围之中.
    //   如果在就打印
    printf("编号\t\t姓名\t\t\t年龄\t\t性别\t\t成绩\n");
    //   遍历数组中的每1个学生.
    for(int i = 0; i < realLength; i++)
    {
        if(students[i].score >= min && students[i].score <= max)
        {
            printf("%d\t\t%s\t\t%d\t\t%s\t\t%d\n",
                   students[i].id,
                   students[i].name,
                   students[i].age,
                   students[i].gender == GenderMale ? "男" : "女",
                   students[i].score
                   );
        }
    }
    
    
    
    
}






#pragma mark - 新增学生方法
/**
 *  新增学生
 */
void addStudent()
{
    
    //0. 新增学生的时候 有可能数组已经存储满了.
    //   如果存储满了.就要想办法扩容.
    //   如果没有存储满,那么往里面存储.
    //   首先要判断数组是否存储满了.
    //   判断realLength的值 是否为 数组的长度.
    
    if(realLength == arrayLength)
    {
        //说明满了.
        //满了就要要为数组扩容.
        //realloc(, <#size_t#><#void *#>
        //1. 先在堆区申请1个长度为原来的长度的两倍的数组.
        Student *s1 =  calloc(arrayLength * 2 , sizeof(Student));
        //2. 将旧数组中的数据拷贝到新数组中.
        for (int i = 0; i < realLength; i++)
        {
            s1[i] = students[i];
        }
        //3. 拷贝完成以后.将旧数组释放.
        free(students);
        //4. 让全局指针指向我们的新数组
        students = s1;
        //5. 数组的长度已经发生变化了,要修改
        arrayLength = arrayLength * 2;
    }
    
    //1.我们看到的布置.
    //  输入要新增的学生的信息.
    //  编号不输入.让系统自动生成.
    
    //1.1 先输入姓名
    printf("请输入新增的学生的姓名: ");
    char name1[10];
    rewind(stdin);
    fgets(name1, 10, stdin);
    size_t len = strlen(name1);
    if(name1[len - 1] == '\n')
    {
        name1[len - 1] = '\0';
    }
    
    char *name =  calloc(len+1, sizeof(char));
    strcpy(name, name1);
    //printf("你输入的姓名是:%s\n",name);
    
    //1.2 输入年龄.
    printf("请输入新增的学生的年龄: ");
    int age = 0;
    scanf("%d",&age);
    
    
    //1.3 输入性别
    printf("请输入新增的学生的性别: 0--> 男  1-->女 ");
    int gender = 0;
    scanf("%d",&gender);
    
    
    //1.4 输入成绩.
    printf("请输入新增的学生的成绩: ");
    int score = 0;
    scanf("%d",&score);
    
    
    //2. 创建结构体变量
    Student stu = {students[realLength-1].id+1,name,age,gender,score};
    
    //printf("stu.name = %s\n",stu.name);
    //3. 将输入的学生的信息保存到数组中.
    //   把这个学生的信息构建成1个结构体变量.
    //   然后再把这个结构体变量存储到数组中.
    
    students[realLength] = stu;
    
    //printf("students = %s\n",students[realLength].name);
    realLength++;
}

/**
 *  删除学生
 */
void deleteStudent()
{
    //1. 先输入要删除的学员的编号.
    //编号为5的
    printf("请输入要删除的学生的编号: ");
    int id = 0;
    scanf("%d",&id);
    
    //2. 在数组中找到编号为5的那个人. 确定这个人在第几个下标
    int deleteIndex = -1;
    for(int i = 0; i < realLength; i++)
    {
        if(students[i].id == id)
        {
            //就要删除下标为i的元素.
            deleteIndex = i;
            break;
        }
    }
    if(deleteIndex == -1)
    {
        printf("你输入的编号有误: ");
        return;
    }
    //   然后将后面的元素挨个挨个网上顶.
    //   从deleteIndex+1 这个元素开始, 将每1个元素的值赋值给前面的1个元素.
    for(int i = deleteIndex + 1; i < realLength; i++)
    {
        students[i-1] = students[i];
    }
    
    //删除完毕之后.
    realLength--;
    
    
    
}


/**
 *  修改学生
 */
void modifyStudent()
{
    
}

