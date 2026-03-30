//
//  ViewController.m
//  06-计步器
//
//  Created by dream on 15/12/22.
//  Copyright © 2015年 dream. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (nonatomic, strong) CMPedometer *pedometer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //iOS8的 计步器
    //1. 判断硬件是否可用
    if (![CMPedometer isStepCountingAvailable]) {
        return;
    }
    
    //2. 创建计步器的类
    self.pedometer = [CMPedometer new];
    
    //3. 开始计步统计
    [self.pedometer startPedometerUpdatesFromDate:[NSDate date] withHandler:^(CMPedometerData * _Nullable pedometerData, NSError * _Nullable error) {
        
        
        // 4. 主线程中去更新UI
        NSNumber *number = pedometerData.numberOfSteps;
        [self performSelectorOnMainThread:@selector(updateUI:) withObject:number waitUntilDone:NO];
        
    }];
}

- (void)updateUI:(NSNumber *)number
{
    self.label.text = [NSString stringWithFormat:@"您当前一共走了%@步",number];
}

- (void)setpCounter {
    //iOS7的 计步器
    if (![CMStepCounter isStepCountingAvailable]) {
        return;
    }
    
    CMStepCounter *stepCounter = [CMMotionManager new];
    
    [stepCounter startStepCountingUpdatesToQueue:[NSOperationQueue new] updateOn:5 withHandler:^(NSInteger numberOfSteps, NSDate * _Nonnull timestamp, NSError * _Nullable error) {
        NSLog(@"numberSteps: %zd", numberOfSteps);
    }];

}

@end
