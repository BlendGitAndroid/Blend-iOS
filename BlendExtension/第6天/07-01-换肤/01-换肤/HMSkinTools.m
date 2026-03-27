//
//  HMSkinTools.m
//  01-换肤
//
//  Created by dream on 15/12/19.
//  Copyright © 2015年 dream. All rights reserved.
//

#import "HMSkinTools.h"

//专门写常量值的

// 以下的格式, 只是对常量的声明
NSString *const HMSkinToolLabelTextDayColor = @"labelTextDayColor";
NSString *const HMSkinToolLabelBackgroundDayColor = @"labelBackgroundDayColor";

static NSString *_skinName;

//#1. 创建一个static的可变字典
static NSMutableDictionary *_colorDict;

@implementation HMSkinTools

/**
 保证代码只加载一次:
 1. 多线程 --> dispatchOnce
 2. 只调用一次的方法
 */

/** load方法, 只要头文件参与了编译就会调用此方法 */
+ (void)load
{
    NSLog(@"%s",__func__);
}

/** 类的实例创建时, 才会调用此方法*/
+ (void)initialize
{
    //1. 读取偏好设置信息 --> 访问磁盘是耗性能的, 所以只需要加载一次即可
    _skinName = [[NSUserDefaults standardUserDefaults] objectForKey:@"skinName"];
    
    if (_skinName == nil) {
        _skinName = @"green";
    }
    
    //#2. 可变字典做初始化
    _colorDict = [NSMutableDictionary dictionary];
    
    //#3. 加载颜色plist
    [self loadColorDict];
}


/** 返回对应的皮肤的图像*/
+ (UIImage *)imageWithImageName:(NSString *)imageName
{
    //1. 拼接文件路径
    NSString *imageStr = [NSString stringWithFormat:@"skin/%@/%@",_skinName,imageName];
    
    //2. 返回一个指定的图像
    return [UIImage imageNamed:imageStr];
}

/** 保存皮肤信息*/
+ (void)saveSkinName:(NSString *)skinName
{
    
    //当皮肤读取改变成一次之后, 那么我们做皮肤切换保存操作, 原来的_skinName
    
    //更改皮肤
    _skinName = skinName;
    
    // 当设置了不同皮肤时, 我们还需要将皮肤plist颜色信息进行重新加载
    [self loadColorDict];
    
    //保存皮肤
    [[NSUserDefaults standardUserDefaults] setObject:skinName forKey:@"skinName"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


/** 返回制定标识符所对应的颜色*/
+ (UIColor *)colorWithName:(NSString *)name
{
    return _colorDict[name];
}

/** 初始化时需要调用一次, 来加载字典及转换颜色*/
+ (void)loadColorDict
{
    //1. 获取plist列表
    //2. 颜色转换(255,0,0,1 --> UIColor对象)
    
    //1. plist只需要加载一次
    //2. 将转换后的UIColor做保存
    
    //1. 获取plist路径
    NSString *pathStr = [NSString stringWithFormat:@"skin/%@/SkinColors.plist",_skinName];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:pathStr ofType:nil];
    
    //2. 获取字典
    NSDictionary *colorDict = [NSDictionary dictionaryWithContentsOfFile:path];
    
    //3. 直接获取所有颜色值将其转换成UIColor对象
    [colorDict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull colorStr, BOOL * _Nonnull stop) {
        
        //4. 截取字符串
        NSArray *colorArr = [colorStr componentsSeparatedByString:@","];
        
        //5. 创建颜色赋值给缓存字典
        CGFloat r = [colorArr[0] doubleValue];
        CGFloat g = [colorArr[1] doubleValue];
        CGFloat b = [colorArr[2] doubleValue];
        CGFloat a = [colorArr[3] doubleValue];
        
        //字典的里面存的是转换好的UIColor对象, 当设置切换皮肤后, 需要重新调用此方法, 进行_colorDict的更新
        _colorDict[key] = [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:a];
    }];
}

@end
