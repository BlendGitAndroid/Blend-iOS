/*
 
 1. 如果函数的参数是1个一维数组,那么我们在传递的时候,
    可以传递二维数组的某1行.
    二维数组的行其实是1个一维数组.
 
 
 
 2. 二维数组可以作为函数的参数.
 
    1). 如果函数的参数是1个二维数组.那么在调用的时候,实参也必须是1个同类型的二维数组.
 
    2). 当二维数组作为函数的参数的时候.会丢失这个二维数组的行数和列数.
        因为声明参数二维数组的时候 并不是去创建1个二维数组.
        而是创建1个用来存储数组地址的指针变量
        而指针变量是占据8个字节.
        所以这个时候,在函数的内部使用sizeof去计算参数二维数组的占用的字节的时候永远都是8个字节.
 
    3). 当二维数组作为函数的参数的时候,
        行数可以省略不写,但是列数不能省略必须要写.
        并且实参二维数组和形参二维数组
        实参的行数可以任意,但是列数必须要和形参的列数一致.
 
 
    4). 解决方案:
 
        让调用者将二维数组的行数和列数都传递到函数内部来.
        所以,至少还要加2个参数,1个行 1个列.
 
 
        实参二维数组的列数必须要和形参二维数组的列数一致.
        写参数的时候,先写行数和列数,最后再写二维数组,然后二维数组的列数用参数指定.
        void test2(int rows,int cols,int arr[][cols]);
 
        基本上这个时候,传递的二维数组的行数和列数任意的了.
 
 
 
 3. 课堂案例:
 
    从控制台接收用户输入1个二维数组的行数和列数.
    1). 然后创建这个二维数组.
    2). 写1个函数,为这个二维数组的元素赋值.
        元素的值 = (行 * 列) + 10;
    3). 再写1个函数,打印二维数组的所有的元素.
 
 
 
 
 
 
 
 
 
 
 */

#include <stdio.h>

void test1(int arr[],int len)
{
    for(int i = 0; i < len; i++)
    {
        printf("%d \n",arr[i]);
    }
}

void test2(int rows,int cols,int arr[][cols])
{
    for(int i = 0; i < rows;i++)
    {
        for(int j = 0; j < cols; j++)
        {
            printf("%d\t",arr[i][j]);
        }
        printf("\n");
    }
}

//为二维数组的每1个元素赋值.
void setValue(int rows,int cols,int arr[][cols])
{
    for(int i = 0; i < rows; i++)
    {
        for(int j = 0; j < cols; j++)
        {
            arr[i][j] = (i * j)+10;
        }
    }
}


void bianLi(int rows,int cols,int arr[][cols])
{
    for(int i = 0; i < rows; i++)
    {
        for(int j = 0; j < cols; j++)
        {
            printf("%d ",arr[i][j]);
        }
        printf("\n");
    }
}


int main(int argc, const char * argv[])
{
    
    
    //1.接收用户输入行数和列数.
    int rows = 0,cols = 0;
    printf("请输入行数和列数: ");
    scanf("%d%d",&rows,&cols);
    
    //2.创建1个二维数组.
    int arr[rows][cols];
    
    //3.调用函数为数组赋值.
    setValue(rows, cols, arr);
    
    //4.调用函数遍历二维数组
    bianLi(rows, cols, arr);
    
    
    
    
    
    
    
//    int arr[7][6] = {10,20,30,40,50,60,70,80,90,100,110,120};
//
//   
//    
//    test2(7, 6, arr);
    
    //test1(arr[0],4);
    
    
    return 0;
}
