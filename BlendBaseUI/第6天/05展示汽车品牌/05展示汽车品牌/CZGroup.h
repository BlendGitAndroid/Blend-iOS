//
//  CZGroup.h
//  05展示汽车品牌
//
//  Created by apple on 15/2/28.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZGroup : NSObject
// 组标题
@property (nonatomic, copy) NSString *title;
// 组描述
@property (nonatomic, copy) NSString *desc;

// 这组里面的汽车品牌信息
@property (nonatomic, strong) NSArray *cars;


- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)groupWithDict:(NSDictionary *)dict;
@end
