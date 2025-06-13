//
//  Gun.m
//  Day03-封装
//
//  Created by 传智播客 on 20/7/4.
//  Copyright (c) 2020年 itcast. All rights reserved.
//

#import "Gun.h"

@implementation Gun

- (void)setModel:(NSString *)model
{
    _model = model;
}
- (NSString *)model
{
    return _model;
}

- (void)setSheCheng:(int)sheCheng
{
    _sheCheng = sheCheng;
}
- (int)sheCheng
{
    return _sheCheng;
}

//- (void)setBulletCount:(int)bulletCount
//{
//    _bulletCount = bulletCount;
//}
//-(int)bulletCount
//{
//    return _bulletCount;
//}

- (void)setDanJia:(DanJia *)danJia
{
    _danJia = danJia;
}
- (DanJia *)danJia
{
    return _danJia;
}


- (void)shoot
{
    //1.先判断当前枪对象的单价中是否还有子弹.
    if([_danJia bulletCount] > 0)
    {
        NSLog(@"突突突......");
        //突完以后 弹夹中的子弹数量要减1.
        int count =  [_danJia bulletCount];
        count--;
        [_danJia setBulletCount:count];
        NSLog(@"剩余子弹数量:%d",count);
    }
    else
    {
        NSLog(@"子弹没有了...");
    }
}

@end
