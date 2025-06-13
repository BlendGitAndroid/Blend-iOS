//
//  Dog.h
//  Day02-类与对象
//
//  Created by 传智播客 on 15/12/15.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject
{
    @public
    NSString *_name;
    NSString *_color;
    NSString *_age;
}

//狗的叫的行为.
- (void)shout;

@end
