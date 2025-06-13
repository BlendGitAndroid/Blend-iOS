//
//  Person.h
//  Day08-ARC与分类
//
//  Created by apple on 15/11/10.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

@interface Person : NSObject

@property(nonatomic,retain)NSString *name;
@property(nonatomic,assign)int age;

@property(nonatomic,retain)Car *car;

@end
