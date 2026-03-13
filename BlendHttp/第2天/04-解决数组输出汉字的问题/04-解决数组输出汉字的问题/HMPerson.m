//
//  HMPerson.m
//  04-解决数组输出汉字的问题
//
//  Created by Apple on 15/10/20.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMPerson.h"

@implementation HMPerson

// 重写了description方法
- (NSString *)description {

    // 通过调用super的description方法获取默认的描述信息（通常包含类名和内存地址）
    // 第一个%@对应的是的super description的返回值，第二个%@对应的是name属性，%d对应的是age属性
    return [NSString stringWithFormat:@"%@{name:%@,age:%d}",
                                      [super description], self.name, self.age];
}
@end
