/*
 1. 应该将游戏地图上的每1个格子的类型保存起来.
    只有保存起来.我们后面在移动的时候 才可以直到下1个格子是个什么东西. 
    使用1个二维数组来保存游戏格子的类型是最合适的.
 
    所以,第1步骤.就应该用1个二维数组. 将地图上的每一个格子的类型保存起来.
 
 
 2. 游戏的流程:
 
    1). 根据map二维数组显示游戏地图.
 
 
    while(1)
    {
        2). 接收用户输入小人的前进方向.

        3). 根据用户输入的小人的前进方向来移动小人.
    }
 
 
 
 
 */

#include <stdio.h>
#include <stdlib.h>
#define ROWS 6
#define COLS 8


//map数组.二维数组.1个char类型的二维数组.
//这个二维数组的作用,用来保存地图上每1个格子的类型.
//这个数组中的元素的值和地图上的每1个格子的类型是相互对应的.
char map[ROWS][COLS] = {
    {'#','#','#','#','#','#','#','#'},
    {'#','O','#','#',' ',' ',' ','#'},
    {'#',' ','#','#',' ','#',' ','#'},
    {'#',' ',' ','#',' ','#',' ','#'},
    {'#','#',' ',' ',' ','#',' ','#'},
    {'#','#','#','#','#','#',' ','#'}
};

/**
 *  保存小人当前在地图上的行坐标
 */
int personCurrentRow = 1;

/**
 *  保存小人当前在地图上的列坐标.
 */
int personCurrentCol = 1;





/**
 *  打印游戏地图
 */
void showMap();

/**
 *  接收用户输入小人的前进方向.
 */
char enterDirection();

/**
 *  将小人向上移动
 */
void moveToUp();

/**
 *  将小人向下移动
 */
void moveToDown();

/**
 *  将小人向左移动
 */
void moveToLeft();

/**
 *  将小人向右移动
 */
void moveToRight();


int main(int argc, const char * argv[])
{
    

    
    while (1)
    {
        //1.第一步骤.先根据map数组打印游戏地图.
        //  很明显 这是1个独立的功能.所以我将其封装为1个函数.
        //将屏幕上的所有的显示信息清空.
        system("clear");
        
        showMap();
        
        //2.接收用户输入小人的前进方向.
        //  这也是1个独立的功能.所以,我们又封装1个函数.
        char dir =  enterDirection();
        
        //3. 判断用户输入的小人的前进方向.根据方向来移动小人.
        switch (dir)
        {
            case 'a':
            case 'A':
                //将小人向左移动
                moveToLeft();
                break;
            case 'd':
            case 'D':
                //将小人向右移动
                moveToRight();
                break;
            case 'w':
            case 'W':
                //将小人向上移动.
                moveToUp();
                break;
            case 's':
            case 'S':
                //将小人向下移动.
                moveToDown();
                break;
            case 'q':
            case 'Q':
                //结束游戏
                printf("你的智商真低!\n");
                return 0;
                break;
        }
        
    }
    
    
    return 0;
}


/**
 *  打印游戏地图
 */
void showMap()
{
    //根据map数组打印地图
    for(int i = 0; i < ROWS; i++)
    {
        for(int j = 0; j < COLS; j++)
        {
            printf("%c ",map[i][j]);
        }
        printf("\n");
    }
}


/**
 *  接收用户输入小人的前进方向.
 */
char enterDirection()
{
    //1. 提示输入前进方向.
    printf("请输入小人的前进方向: w.上 s.下 a.左 d.右 q.结束游戏");
    //2. 接收
    char dir = 'a';
    rewind(stdin);
    scanf("%c",&dir);
    return dir;
}


/**
 *  将小人向上移动
 */
void moveToUp()
{
    
}

/**
 *  将小人向下移动
 */
void moveToDown()
{
    
    /*
     让小人向下移动.
     必须要判断1下小人的下面的那个格子的类型.
     如果下面的那个格子是墙 就不要移动了.
     如果下面的那个格子是路 就移动.
     
     那么你如何知道小人下面的那个格子的类型是什么?
     
     要知道小人的下1个格子的类型.
     就要知道小人的下1个格子的坐标.
     
     要知道小人的下1个格子的坐标 就要知道小人的坐标.
     
     小人的坐标?
     1开始的时候.小人的左边在第1行的第1列.并且小人的坐标随时都会变化.
     所以,我们使用两个变量来保存小人当前的行列坐标.
     
     
     
     1. 要得到小人的下1个坐标.
     
     2. 判断小1个格子的类型是墙还是路.
     
     3. 如果是路.移动.
     
     */
    
    //小人下1个格子的行坐标
    int personNextRow = personCurrentRow + 1; //3
    //小人下1个格子的列坐标
    int personNextCol = personCurrentCol; //4
    //判断小人的下1个格子的类型是不是路.
    //只需要去map数组中判断指定的元素的值就可以了.
    if(map[personNextRow][personNextCol] == ' ')
    {
        //说明下1个是路.可以将小人向下移动.
        //为下1个格子赋值为 O
        //为小人当前的位置赋值 ''
        map[personNextRow][personNextCol] = 'O';
        map[personCurrentRow][personCurrentCol] = ' ';
        //立即修改小人的当前位置.
        personCurrentRow = personNextRow;
        personCurrentCol = personNextCol;
    }
}

/**
 *  将小人向左移动
 */
void moveToLeft()
{

}

/**
 *  将小人向右移动
 */
void moveToRight()
{
    
}

