//
//  ViewController.m
//  03-CoreMotion
//
//  Created by dream on 15/12/22.
//  Copyright © 2015年 dream. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>

//CoreMotion框架 加速计 陀螺仪 磁力计

/**
 加速计 : 检测力在某个方向上有作用 (摇一摇)
 陀螺仪 : 检测转动的角速度 (绕着Y轴旋转, 玩手机赛车游戏)
 磁力计 : 检测磁场变化, 主要用于导航
 */

@interface ViewController ()

/** 运动管理器对象*/
@property (nonatomic, strong) CMMotionManager *motionMgr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     磁力计Pull方式 --> 在需要的时候来获取值
     */
    //1. 创建CMMotionManager对象
    self.motionMgr = [CMMotionManager new];
    
    //2. 判断磁力计是否可用
    if (![self.motionMgr isMagnetometerAvailable]) {
        return;
    }
    
    //3. 开始采样
    [self.motionMgr startMagnetometerUpdates];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //1. 点击时获取加速计的值
    // 运动管理器会记录所有的值, 在自己的属性中
//    CMAcceleration acceleration = self.motionMgr.accelerometerData.acceleration;
//    
//    NSLog(@"x : %f, y : %f, z : %f", acceleration.x, acceleration.y, acceleration.z);
    
    //2. 点击时获取陀螺仪的值
//    CMRotationRate rotationRate = self.motionMgr.gyroData.rotationRate;
//    
//    NSLog(@"x : %f, y : %f, z : %f", rotationRate.x, rotationRate.y, rotationRate.z);
    
    
    //3. 点击时获取磁力计的值
    //单位特斯拉, 不是车
    CMMagneticField magneticField = self.motionMgr.magnetometerData.magneticField;
    
    NSLog(@"x : %f, y : %f, z : %f", magneticField.x, magneticField.y, magneticField.z);
}


- (void)accelerometerPull
{
    /**
     加速计Pull方式 --> 在需要的时候来获取值
     */
    //1. 创建CMMotionManager对象
    self.motionMgr = [CMMotionManager new];

    //2. 判断加速计是否可用
    if (![self.motionMgr isAccelerometerAvailable]) {
        return;
    }

    //3. 开始采样
    [self.motionMgr startAccelerometerUpdates];
}

- (void)accelerometerPush {
    /**
       加速计Push方式
             */
    //1. 创建CMMotionManager对象
    self.motionMgr = [CMMotionManager new];
    
    //2. 判断加速计是否可用
    if (![self.motionMgr isAccelerometerAvailable]) {
        return;
    }
    
    //3. 设置采样间隔 单位是秒 --> 只有push方式需要采样间隔
    self.motionMgr.accelerometerUpdateInterval = 1;
    
    //4. 开始采样
    [self.motionMgr startAccelerometerUpdatesToQueue:[NSOperationQueue new] withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
        
        //5 获取data中的数据值
        
        // 正值负值: 轴的方向, 哪个指向地面, 就会打印出打个方向的值
        // 只要在某个轴上, 进行快速移动, 那么值就会发生变化
        CMAcceleration acceleration = accelerometerData.acceleration;
        
        NSLog(@"x : %f, y : %f, z : %f", acceleration.x, acceleration.y, acceleration.z);
        
    }];
}

- (void)gyroPush
{
    /**
     陀螺仪Push方式
     */
    //1. 创建CMMotionManager对象
    self.motionMgr = [CMMotionManager new];
    
    //2. 判断陀螺仪是否可用
    if (![self.motionMgr isGyroAvailable]) {
        return;
    }
    
    //3. 设置采样间隔 单位是秒 --> 只有push方式需要采样间隔
    self.motionMgr.gyroUpdateInterval = 1;
    
    //4. 开始采样
    [self.motionMgr startGyroUpdatesToQueue:[NSOperationQueue new] withHandler:^(CMGyroData * _Nullable gyroData, NSError * _Nullable error) {
        
        //5 获取data中的数据值
        
        // 正值负值: 轴的方向, 哪个指向地面, 就会打印出打个方向的值
        // 只要在某个轴上, 进行快速移动, 那么值就会发生变化
        CMRotationRate rotationRate = gyroData.rotationRate;
        
        NSLog(@"x : %f, y : %f, z : %f", rotationRate.x, rotationRate.y, rotationRate.z);
        
    }];

}

- (void)gyroPull
{
    /**
     加速计Pull方式 --> 在需要的时候来获取值
     */
    //1. 创建CMMotionManager对象
    self.motionMgr = [CMMotionManager new];
    
    //2. 判断加速计是否可用
    if (![self.motionMgr isGyroAvailable]) {
        return;
    }
    
    //3. 开始采样
    [self.motionMgr startGyroUpdates];
}

@end
