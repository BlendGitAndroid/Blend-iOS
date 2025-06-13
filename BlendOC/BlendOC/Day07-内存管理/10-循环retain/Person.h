//
//  Person.h
//  Day07-内存管理
//
//  Created by apple on 15/11/9.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"
@interface Person : NSObject

@property(nonatomic,retain)NSString *name;
@property(nonatomic,assign)Book *book;


- (void)read;

@end
