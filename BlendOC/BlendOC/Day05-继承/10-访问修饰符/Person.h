//
//  Person.h
//  Day05-继承
//
//  Created by 传智播客 on 20/7/5.
//  Copyright (c) 2020年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    @private
    NSString *_name;
    
    @public
    int _age;
    
    int _x;
    @protected
    int _y;
}


- (void)setName:(NSString *)name;
- (NSString *)name;

- (void)sayHi;


@end
