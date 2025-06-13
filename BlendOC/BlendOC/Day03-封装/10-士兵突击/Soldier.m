//
//  Soldier.m
//  Day03-封装
//
//  Created by 传智播客 on 20/7/4.
//  Copyright (c) 2020年 itcast. All rights reserved.
//

#import "Soldier.h"

@implementation Soldier
- (void)setName:(NSString *)name
{
    _name = name;
}
- (NSString *)name
{
    return _name;
}
- (void)setType:(NSString *)type
{
    _type = type;
}
- (NSString *)type
{
    return _type;
}
- (void)setGun:(Gun *)gun
{
    _gun = gun;
}
- (Gun *)gun
{
    return _gun;
}

- (void)fire
{
    NSLog(@"预备,开火...");
    [_gun shoot];
}
@end
