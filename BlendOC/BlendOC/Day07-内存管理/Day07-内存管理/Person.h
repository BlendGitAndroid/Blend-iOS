//
//  Person.h
//  Day07-内存管理
//
//  Created by apple on 15/11/9.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Person : NSObject
{
    NSString *_name;
}


@property NSString *name;

@property int age;



- (instancetype)initWithName:(NSString *)name andAge:(int)age;


@end
