//
//  Book.m
//  Day05-特有语法
//
//  Created by 传智播客 on 15/9/16.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "Book.h"

@implementation Book
- (void)setName:(NSString *)name
{
    _name = name;
}
- (NSString *)name
{
    return _name;
}

- (void)setPublisherName:(NSString *)publisherName
{
    _publisherName = publisherName;
}
- (NSString *)publisherName
{
    return _publisherName;
}

- (void)setAuthor:(Author *)author
{
    _author = author;
}
- (Author *)author
{
    return _author;
}

- (void)setPublishDate:(Date)publishDate
{
    _publishDate = publishDate;
}
- (Date)publishDate
{
    return _publishDate;
}

@end
