//
//  Person.h
//  Day11-Foundation框架
//
//  Created by apple on 15/11/14.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject


@property(nonatomic,assign)int width;
@property(nonatomic,assign)int height;

+ (instancetype)sharedPerson;
+ (instancetype)defaultPerson;

@end
