//
//  Person.h
//  Day07-内存管理
//
//  Created by apple on 15/11/9.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

@interface Person : NSObject
{
    Car *_car;
}
- (void)setCar:(Car *)car;
- (Car *)car;

- (void)drive;

@end
