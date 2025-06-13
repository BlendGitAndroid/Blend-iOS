//
//  Person.h
//  Day02-类与对象
//
//  Created by 传智播客 on 20/7/2.
//  Copyright (c) 2020年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gender.h"



@interface Person : NSObject
{
    @public
    NSString *_name;
    int _age;
    Gender _gender;
    int _leftLife;
}


- (void)show;

@end
