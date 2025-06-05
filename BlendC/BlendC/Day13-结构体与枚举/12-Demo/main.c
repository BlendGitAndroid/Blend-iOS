//
//  main.c
//  12-Demo
//
//  Created by 黑马程序员 on 20/3/9.
//  Copyright © 2020年 itheima. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
    
    typedef struct
    {
        char *name;
        int age;
    }Person;
    
    
    char str[] = "jack";
    Person p1;
    p1.name = str;
    
    printf("%s",p1.name);
    
    
    
    
//    
//    Person p1;
//    p1.name = "jack";
//    p1.age = 19;
//    
    
    
    
    
    return 0;
}
