//
//  NetworkTools.h
//  11-单例
//
//  Created by Apple on 15/10/14.
//  Copyright © 2015年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkTools : NSObject
//单例的方法
+ (instancetype)sharedNetworkTools;
+ (instancetype)sharedNetworkToolsOnce;

@end
