//
//  Person.h
//  Day05-特有语法
//
//  Created by 传智播客 on 15/9/16.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Person : NSObject


@property NSString *name;
@property int age;
@property float weight,height;


- (instancetype)initWithName:(NSString *)name andAge:(int)age andWeight:(float)weight andHeight:(float)height;





- (void)sayHi;


@end
