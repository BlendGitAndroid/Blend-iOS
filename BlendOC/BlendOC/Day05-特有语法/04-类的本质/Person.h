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
{
    NSString *_name;
    
    Gender _gender;
    
    int _age;
}

- (void)setName:(NSString *)name;
- (NSString *)name;

- (void)setGender:(Gender)gender;
- (Gender)gender;

- (void)setAge:(int)age;
- (int)age;


+ (void)sayHi;

- (void)haha;



@end
