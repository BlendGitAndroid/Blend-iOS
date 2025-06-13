//
//  Book.h
//  Day07-内存管理
//
//  Created by apple on 15/11/9.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;

@interface Book : NSObject

@property(nonatomic,retain)NSString *name;


@property(nonatomic,retain)Person *owner;

//传智播客 传播知识 播撒智慧 的一帮侠客们.
- (void)castZhiShi;

@end
