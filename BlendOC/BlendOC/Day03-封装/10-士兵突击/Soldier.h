/*
 
 
 士兵类:
 属性: 姓名 兵种.
 行为: 开火的方法.
 
 */
#import <Foundation/Foundation.h>
#import "Gun.h"

@interface Soldier : NSObject
{
    NSString *_name;
    NSString *_type;
    Gun *_gun;
}

- (void)setName:(NSString *)name;
- (NSString *)name;

- (void)setType:(NSString *)type;
- (NSString *)type;

- (void)setGun:(Gun *)gun;
- (Gun *)gun;

- (void)fire;


@end
