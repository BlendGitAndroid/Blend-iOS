//
//  CZApp.h
//  01应用管理
//
//  Created by apple on 15/2/8.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZApp : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;


- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)appWithDict:(NSDictionary *)dict;

@end
