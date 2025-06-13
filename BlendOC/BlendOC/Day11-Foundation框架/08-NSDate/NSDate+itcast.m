//
//  NSDate+itcast.m
//  Day11-Foundation框架
//
//  Created by apple on 15/11/14.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import "NSDate+itcast.h"

@implementation NSDate (itcast)

- (int)year
{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *com =  [calendar components: NSCalendarUnitYear fromDate:self];
    
    return (int)com.year;
}

@end
