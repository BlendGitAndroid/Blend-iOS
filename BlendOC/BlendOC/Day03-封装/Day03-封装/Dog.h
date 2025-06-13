//
//  Dog.h
//  Day03-封装
//
//  Created by 传智播客 on 20/7/4.
//  Copyright (c) 2020年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject
{
    @public
    NSString *_name;
    NSString *_color;
    int _age;
}

- (void)shout;


//写1个方法. 判断当前这个狗对象的年龄是否比另外1条狗大
- (BOOL)compareAgeWithOtherDog:(Dog *)otherDog;

@end
