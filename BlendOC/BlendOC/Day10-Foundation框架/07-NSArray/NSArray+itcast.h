//
//  NSArray+itcast.h
//  Day10-Foundation框架
//
//  Created by apple on 15/11/13.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (itcast)

//添加1个遍历当前这个数组对象中的所有的元素方法.

- (void)bianliWithBlock:(void (^)(id obj,int index,BOOL *stop))block;




@end
