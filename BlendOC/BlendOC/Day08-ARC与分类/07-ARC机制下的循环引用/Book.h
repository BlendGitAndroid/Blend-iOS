//
//  Book.h
//  Day08-ARC与分类
//
//  Created by apple on 15/11/10.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;

@interface Book : NSObject

@property(nonatomic,weak)Person *owner;

@end
