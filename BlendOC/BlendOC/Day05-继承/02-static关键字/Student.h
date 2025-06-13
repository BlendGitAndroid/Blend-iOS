//
//  Student.h
//  Day05-继承
//
//  Created by 传智播客 on 20/7/5.
//  Copyright (c) 2020年 ;. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
{
    int _number;
    NSString *_name;
    int _age;
}

- (void)setNumber:(int)number;
- (int)number;

- (void)setName:(NSString *)name;
- (NSString *)name;

- (void)setAge:(int)age;
- (int)age;

+ (instancetype)student;
+ (instancetype)studentWithName:(NSString *)name andAge:(int)age;


@end
