//
//  Student.h
//  Day05-特有语法
//
//  Created by 传智播客 on 15/9/16.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "Person.h"
#import "Book.h"

@interface Student : Person
{
    NSString *_stuNumber;
    Book *_book;
}

- (void)setStuNumber:(NSString *)stuNumber;
- (NSString *)stuNumber;

- (void)setBook:(Book *)book;
- (Book *)book;




@end
