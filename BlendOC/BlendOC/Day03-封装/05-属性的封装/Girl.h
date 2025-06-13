//
//  Girl.h
//  Day03-封装
//
//  Created by 传智播客 on 20/7/4.
//  Copyright (c) 2020年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Girl : NSObject
{
    int _age;
    int _money;
}
- (void)setMoney:(int)money;

- (int)age;



@end
