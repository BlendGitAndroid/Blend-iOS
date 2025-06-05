//
//  main.c
//  05-条件编译指令的应用场景
//
//  Created by 黑马程序员 on 20/3/11.
//  Copyright © 2020年 itheima. All rights reserved.
//

#include <stdio.h>


/*
#define ITHEIMA_DEBUG 1


#if ITHEIMA_DEBUG == 0

    #define LOG(val1,val2) printf(val1,val2)
#else
    #define LOG(val1,val2) 

#endif
*/


/*
#define ITHEIMA_DEBUG 1

#ifndef ITHEIMA_DEBUG
    #define LOG(val1,val2) printf(val1,val2)
#else
    #define LOG(val1,val2)
#endif
*/
























void addStudent();

int main(int argc, const char * argv[])
{

//    int num = 10;
//    LOG("num = %d\n", num);
//    

    addStudent();
    
    return 0;
}

void addStudent()
{
    /*
     cewbicbeivc
     vneivnbeiv
     vbeubvuiebhv
     veihvbi
     vebuibhve8u
     bvuebhviue
     vniehvi8ehbv
     nbviuebvi
     */
    
    
    int num = 10;
    
    LOG("num = %d\n", num);
    LOG("num = %d\n", num);
    LOG("num = %d\n", num);
    LOG("num = %d\n", num);
    LOG("num = %d\n", num);
    LOG("num = %d\n", num);
    LOG("num = %d\n", num);
    LOG("num = %d\n", num);
    LOG("num = %d\n", num);
    LOG("num = %d\n", num);
    LOG("num = %d\n", num);
    LOG("num = %d\n", num);
    LOG("num = %d\n", num);
    LOG("num = %d\n", num);
    
    
    
    //printf("num = %d\n",num);
}


















