//
//  Dog.h
//  Day05-特有语法
//
//  Created by 传智播客 on 15/9/16.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject

@property NSString *name;
@property int age;

- (void)shout;

- (instancetype)initWithName:(NSString *)name andAge:(int)age;




@end
