//
//  HMMessage.m
//  05-JSON数据转模型
//
//  Created by Apple on 15/10/20.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMMessage.h"

@implementation HMMessage
+ (instancetype)messageWithDic:(NSDictionary *)dic {
    HMMessage *msg = [self new];
    // KVC字典转模型
    [msg setValuesForKeysWithDictionary:dic];
    return msg;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@{message:%@,messageId:%d}",
                                      [super description], self.message,
                                      self.messageId.intValue];
}
@end
