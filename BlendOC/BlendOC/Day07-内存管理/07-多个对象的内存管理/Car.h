//
//  Car.h
//  Day07-内存管理
//
//  Created by apple on 15/11/9.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject
{
    int _speed;
}
- (void)setSpeed:(int)speed;
- (int)speed;


- (void)run;
@end
