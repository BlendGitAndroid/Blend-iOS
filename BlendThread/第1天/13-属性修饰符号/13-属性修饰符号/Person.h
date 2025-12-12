//
//  Person.h
//  13-属性修饰符号
//
//  Created by Apple on 15/10/13.
//  Copyright © 2015年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

// 代理这里要被设置成weak，防止循环引用
@property (nonatomic, weak) id delegate;

@property (nonatomic, copy) NSString *name;
@end
