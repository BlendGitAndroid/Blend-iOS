/*
 
 1. 应该将我们地图上的每一个格子的类型保存起来.
 
    墙: 
    路:
    人:
    箱子:
 
    并且地图是1个有行有列的表格.所以所以二维数组来保存我们的地图是非常合适的了.
 
 
 2. 游戏的流程.
 
 
 
    while(1)
    {
        1). 打印地图.
 
        2). 接收输入小人的前进方向.
 
        3). 根据小人的前进方向来前进或者推箱子.
    }
 
 
 
 
 
 
 
 */

#include <stdio.h>
#include <stdlib.h>
#define ROWS 10
#define COLS 11


/**
 *  地图数组,用来保存地图上的每一个格子的类型.
 */
char map[ROWS][COLS] = {
    "##########",
    "#  ####  #",
    "# X####  #",
    "# O      #",
    "######   #",
    "#  ####  #",
    "#        #",
    "#   ######",
    "#         ",
    "##########"
};



//小人当前所在的行左边. 默认在第3行
int personCurrenRow = 3;
//小人当前所在的列坐标. 默认在第2列.
int personCurrentCol = 2;



/**
 *  根据map数组打印地图.
 */
void showMap();

/**
 *  接收输入小人的前进方向
 *
 *  @return 前进方向
 */
char enterDirection();



/**
 *  将小人向指定的方向移动
 *
 *  @param dir 指定的方向
 */
void movePerson(char dir);


/**
 *  根据小人的前进方向计算小人的下1个坐标
 *
 *  @param dir 前进方向
 */
void getNextPosition(char dir,int currentRow,int currentCol,int* pNextRow,int* pNextCol);


int main()
{
    while (1)
    {
        system("clear");
        //1.打印地图.
        showMap();
        //2.接收输入小人的前进方向.
        char dir = enterDirection();
        //3. 根据小人的前进方向,来移动小人或者推箱子.
        if(dir == 'q')
        {
            //结束
        }
        else
        {
            movePerson(dir);
        }
    }
    
    return 0;
}


/**
 *  根据map数组打印地图.
 */
void showMap()
{
    for(int i = 0; i < ROWS; i++)
    {
        printf("%s\n",map[i]);
    }
}

/**
 *  接收输入小人的前进方向
 *
 *  @return 前进方向
 */
char enterDirection()
{
    printf("请输入小人的前进方向 a.左 w.上 d.右 s.下 q.结束\n");
    char dir = 'a';
    rewind(stdin);
    scanf("%c",&dir);
    return dir;
}




/**
 *  将小人向指定的方向移动
 *
 *  @param dir 指定的方向
 */
void movePerson(char dir)
{
    //1. 拿到小人的下1个坐标.
    //   根据小人的前进方向而不同.
    //   这段代码做的事情:是根据小人的当前坐标和前进方向计算出小人的下个坐标.
    int personNextRow = 0;
    int personNextCol = 0;
    
    
    getNextPosition(dir, personCurrenRow, personCurrentCol, &personNextRow, &personNextCol);

    
    //2. 判断小人的下1个坐标是1个什么东西.
    if(map[personNextRow][personNextCol] == ' ')
    {
        //移动小人
        map[personNextRow][personNextCol] = 'O';
        map[personCurrenRow][personCurrentCol] = ' ';
        //改变小人的位置.
        personCurrenRow = personNextRow;
        personCurrentCol = personNextCol;
    }
    else if(map[personNextRow][personNextCol] == 'X')
    {
        //说明下1个是1个箱子.
        //还要判断箱子能不能推.
        //就要拿到这个箱子的下1个坐标.
        //可以根据箱子的坐标 计算出箱子的下1个坐标/
        //而现在箱子的坐标是 personNextRow personNextCol
        
        //这段代码是根据箱子现在的坐标 算出箱子的下1个坐标.
    
        
        int boxNextRow = 0;
        int boxNextCol = 0;
        
        getNextPosition(dir, personNextRow, personNextCol, &boxNextRow, &boxNextCol);
        
        //这段代码执行完毕之后 boxNextRow 和 boxNextCol 就是箱子的下1个坐标.
        //继续判断箱子的下1个坐标是路.
        if(map[boxNextRow][boxNextCol] == ' ')
        {
            map[boxNextRow][boxNextCol] = 'X';
            
            //b. 把当前箱子的格子设置为小人.
            map[personNextRow][personNextCol] = 'O';
            //c. 把小人的位置设置空格.
            map[personCurrenRow][personCurrentCol] = ' ';
            
            //推完之后 改小人的位置.
            personCurrenRow = personNextRow;
            personCurrentCol = personNextCol;

        }
    }
}


/**
 *  根据小人的前进方向计算小人的下1个坐标
 *
 *  @param dir 前进方向
 */
void getNextPosition(char dir,int currentRow,int currentCol,int* pNextRow,int* pNextCol)
{
    int nextRow = 0;
    int nextCol = 0;
    
    //函数中的基准坐标不一样
    
    switch (dir)
    {
        case 'a':
        case 'A':
            nextRow = currentRow;
            nextCol = currentCol -1;
            break;
        case 'w':
        case 'W':
            nextRow = currentRow -1;
            nextCol = currentCol;
            break;
        case 'd':
        case 'D':
            nextRow = currentRow;
            nextCol = currentCol + 1;
            break;
        case 's':
        case 'S':
            nextRow = currentRow + 1;
            nextCol = currentCol;
            break;
    }
    
    
    *pNextRow = nextRow;
    *pNextCol = nextCol;

}




