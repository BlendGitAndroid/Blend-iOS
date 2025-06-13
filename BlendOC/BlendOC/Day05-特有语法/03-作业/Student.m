//
//  Student.m
//  Day05-特有语法
//
//  Created by 传智播客 on 15/9/16.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "Student.h"

@implementation Student
- (void)setStuNumber:(NSString *)stuNumber
{
    _stuNumber = stuNumber;
}
- (NSString *)stuNumber
{
    return _stuNumber;
}

- (void)setBook:(Book *)book
{
    _book = book;
}
- (Book *)book
{
    return _book;
}

@end
