/*
 
 
 枪类:
 属性: 型号.射程.
 行为: 射击.
 
 
 
 */
#import <Foundation/Foundation.h>
#import "DanJia.h"

/**
 *  🔫类.
 */
@interface Gun : NSObject
{
    NSString *_model;
    int _sheCheng;
    //int _bulletCount;
    
    DanJia *_danJia;
}

- (void)setModel:(NSString *)model;
- (NSString *)model;

- (void)setSheCheng:(int)sheCheng;
- (int)sheCheng;

- (void)setDanJia:(DanJia *)danJia;
- (DanJia *)danJia;

//- (void)setBulletCount:(int)bulletCount;
//- (int)bulletCount;

- (void)shoot;



@end
