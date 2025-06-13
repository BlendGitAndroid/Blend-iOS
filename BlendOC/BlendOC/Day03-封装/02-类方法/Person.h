//
//  Person.h
//  Day03-封装
//
//  Created by 传智播客 on 20/7/4.
//  Copyright (c) 2020年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    @public
    NSString *_name;
    int _age;
}

//show

- (void)sayHi;

+ (void)hehe;

+ (Person *)person;

+ (Person *)personWithName:(NSString *)name andAge:(int)age;

@end
