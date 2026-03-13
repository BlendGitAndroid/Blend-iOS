//
//  HMMessage.h
//  05-JSON数据转模型
//
//  Created by Apple on 15/10/20.
//  Copyright © 2015年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMMessage : NSObject
@property(nonatomic, copy) NSString *message;
//@property (nonatomic, assign) int messageId;
@property(nonatomic, strong) NSNumber *messageId;

+ (instancetype)messageWithDic:(NSDictionary *)dic;
@end
