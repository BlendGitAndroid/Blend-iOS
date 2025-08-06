//
//  CZApp.h
//  003应用管理
//
//  Created by apple on 15/3/6.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZApp : NSObject

// 软件大小
@property (nonatomic, copy) NSString *size;
// 软件图片
@property (nonatomic, copy) NSString *icon;

// 软件名称
@property (nonatomic, copy) NSString *name;

// 下载量
@property (nonatomic, copy) NSString *download;


// 增加一个用来标记是否被"下载过"（点击过）的一个属性
@property (nonatomic, assign) BOOL isDownloaded;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)appWithDict:(NSDictionary *)dict;





@end
