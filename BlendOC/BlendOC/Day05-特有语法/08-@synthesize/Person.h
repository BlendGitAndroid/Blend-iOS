//
//  Person.h
//  Day05-特有语法
//
//  Created by 传智播客 on 15/9/16.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *_name;
    int _age;
    float _height;
    
    float _weight;
    
}

@property float height,weight;
@property NSString *name;
@property int age;

//@property float weight;
///*
// - (void)set_Weight:(float)_weight;
// - (float)_weight;
// 
// 
// 
// 
// */
//
//
//
//@property float height;
//
//@property NSString *name;
///*
// - (void)setName:(NSString *)name;
// - (NSStirng *)name;
// 
// 
// */
//
//@property int age;
///*
// - (void)setAge:(int)age;
// - (int)age;
// 
// 
// */

@end
