//
//  HMPerson.m
//  10-strong和weak
//
//  Created by Apple on 15/10/13.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMPerson.h"

@implementation HMPerson
+ (instancetype)personWithName:(NSString *)name {
 
    HMPerson *person = [[HMPerson new] autorelease];
    person.name = name;
    
    return person;
}
@end
