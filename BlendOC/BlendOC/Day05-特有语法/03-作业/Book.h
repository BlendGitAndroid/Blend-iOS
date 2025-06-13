//
//  Book.h
//  Day05-特有语法
//
//  Created by 传智播客 on 15/9/16.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Author.h"


typedef struct
{
    int year;
    int month;
    int day;
} Date;

@interface Book : NSObject
{
    NSString *_name;
    NSString *_publisherName;
    Author *_author;
    Date _publishDate;
    
    
    
}

- (void)setName:(NSString *)name;
- (NSString *)name;

- (void)setPublisherName:(NSString *)publisherName;
- (NSString *)publisherName;

- (void)setAuthor:(Author *)author;
- (Author *)author;

- (void)setPublishDate:(Date)publishDate;
- (Date)publishDate;



@end
