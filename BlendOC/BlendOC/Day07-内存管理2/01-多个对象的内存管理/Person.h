//
//  Person.h
//  Day07-内存管理2
//
//  Created by apple on 15/11/9.
//  Copyright (c) 2015年 ITCAST. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

@interface Person : NSObject
{
    NSString *_name;
    Car *_car;
    int _age;
}

- (void)setName:(NSString *)name;
- (NSString *)name;

- (void)setCar:(Car *)car;
- (Car *)car;

- (void)setAge:(int)age;
- (int)age;

- (void)drive;

@end
