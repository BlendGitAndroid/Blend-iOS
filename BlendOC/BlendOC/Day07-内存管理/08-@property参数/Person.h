//
//  Person.h
//  Day07-内存管理
//
//  Created by apple on 15/11/9.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

@interface Person : NSObject


@property(nonatomic,retain) Car *car;
@property(nonatomic,assign,getter=xxx,setter=xyz:) int age;

@property(nonatomic,assign,getter=isGoodMan)BOOL goodMan;






/*
 - (void)setAge:(int)age;
 - (int)xxx
 {
    retuan _ahe;
 }
 
 */

- (void)drive;

@end
