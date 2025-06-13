//
//  Pig.h
//  Day08-ARC与分类
//
//  Created by apple on 15/11/10.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pig : NSObject

@property(nonatomic,retain)NSString *name;
@property(nonatomic,assign)int age;
@property(nonatomic,assign)float weight;

- (instancetype)initWithName:(NSString *)name andAge:(int)age andWeight:(float)weight;

+ (instancetype)pig;

+ (instancetype)pigWithName:(NSString *)name andAge:(int)age andWeight:(float)weight;



@end
