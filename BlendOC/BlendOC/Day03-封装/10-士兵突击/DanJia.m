//
//  DanJia.m
//  Day03-封装
//
//  Created by 传智播客 on 20/7/4.
//  Copyright (c) 2020年 itcast. All rights reserved.
//

#import "DanJia.h"

@implementation DanJia
- (void)setMaxCapcity:(int)maxCapcity
{
    _maxCapcity = maxCapcity;
}
- (int)maxCapcity
{
    return _maxCapcity;
}

- (void)setBulletCount:(int)bulletCount
{
    if(bulletCount >= 0 && bulletCount <= _maxCapcity)
    {
        _bulletCount = bulletCount;
    }
    else
    {
        _bulletCount = 10;
    }
}

/*
 - (void)setBulletCount: (int)bulletCount
 {
    //子弹数在0到最大弹夹量之间   不在这范围的就赋值10
    _bulletCount=(bulletCount >=0 && bulletCount <= _maxCapcity) ? bulletCount : 10;
 }
 
 */
- (int)bulletCount
{
    return _bulletCount;
}
@end
