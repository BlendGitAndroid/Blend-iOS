//
//  main.m
//  08-依赖关系
//
//  Created by 传智播客 on 20/7/4.
//  Copyright (c) 2020年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{
    
    Phone *iPhone = [Phone new];
    
    Person *p1 = [Person new];

    
    [p1 callWithPhone:@"jack"];
    
    
    
    
    return 0;
}
