//
//  Book.h
//  Day07-内存管理
//
//  Created by apple on 15/11/9.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface Book : NSObject

/**
 *  书名
 */
@property(nonatomic,retain)NSString *name;

/**
 *  作者名字
 */
@property(nonatomic,retain)NSString *authorName;


//书有1个拥有者.是人.
@property(nonatomic,retain)Person *owner;


/**
 *  传播知识的方法
 */
- (void)castZhiShi;


@end
