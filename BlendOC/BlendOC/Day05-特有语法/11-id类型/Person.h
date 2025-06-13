//
//  Person.h
//  Day05-特有语法
//
//  Created by 传智播客 on 15/9/16.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    GenderMale,
    GenderFemale
} Gender;


@interface Person : NSObject

@property NSString *name;
@property int age;
@property Gender gender;


+ (instancetype)person;



- (void)sayHi;


@end
