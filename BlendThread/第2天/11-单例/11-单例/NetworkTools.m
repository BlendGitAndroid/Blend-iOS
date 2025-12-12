//
//  NetworkTools.m
//  11-单例
//
//  Created by Apple on 15/10/14.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "NetworkTools.h"

@implementation NetworkTools
+ (instancetype)sharedNetworkTools {
    static id instance = nil;
    //线程同步，保证线程安全
    @synchronized(self) {
        if (instance == nil) {
            instance = [[self alloc] init];
        }
    }
    return instance;
}

+ (instancetype)sharedNetworkToolsOnce {
    static id instance = nil;
    
    //dispatch_once 线程安全的
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (instance == nil) {
            instance = [[self alloc] init];
        }
    });
    return instance;
}
@end
