//
//  DanJia.h
//  Day03-封装
//
//  Created by 传智播客 on 20/7/4.
//  Copyright (c) 2020年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  弹夹类
 */
@interface DanJia : NSObject
{
    /**
     *  弹夹可以装载的最大的子弹数量.
     */
    int _maxCapcity;
    
    /**
     *  弹夹中有多少发子弹.
     */
    int _bulletCount;
}

- (void)setMaxCapcity:(int)maxCapcity;
- (int)maxCapcity;

- (void)setBulletCount:(int)bulletCount;
- (int)bulletCount;

@end
