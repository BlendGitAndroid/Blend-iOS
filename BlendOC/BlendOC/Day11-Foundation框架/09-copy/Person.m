//
//  Person.m
//  Day11-Foundation框架
//
//  Created by apple on 15/11/14.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)setName:(NSString *)name
{
    //1.NSMuatbleString对象.
    //NSString *name = [NSMutableString new];
    //[name copy]
    _name = [name copy];
}
- (NSString *)name
{
    return _name;
}
@end
