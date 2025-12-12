//
//  HMPerson.m
//  10-strong和weak
//
//  Created by Apple on 15/10/13.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMPerson.h"


// -fno-objc-arc这个类使用MRC
// 在MRC中，谁创建谁释放谁销毁
@implementation HMPerson
+ (instancetype)personWithName:(NSString *)name {
 
    // 把对象加入自动释放池
    HMPerson *person = [[HMPerson new] autorelease];
    person.name = name;
    
    return person;
}
@end
