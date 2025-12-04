//
//  HMPerson.h
//  10-strong和weak
//
//  Created by Apple on 15/10/13.
//  Copyright © 2015年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMPerson : NSObject
@property (nonatomic, copy) NSString *name;

+ (instancetype)personWithName:(NSString *)name;
@end
