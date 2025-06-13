//
//  Person.h
//  Day08-ARC与分类
//
//  Created by apple on 15/11/10.
//  Copyright © 2015年 ITCAST. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    int _age;
}
- (void)setAge:(int)age;
- (int)age;

- (void)sayHi;



@end
