//
//  ViewController.m
//  05-时钟练习
//
//  Created by Romeo on 15/12/9.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) CALayer* second;
@property (nonatomic, weak) CALayer * minute;
@property (nonatomic, weak) CALayer *hour;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // 创建表盘
    CALayer* clock = [[CALayer alloc] init];
    clock.bounds = CGRectMake(0, 0, 200, 200); // 大小
    clock.position = CGPointMake(200, 200); // 位置
    // 设置图片
    clock.contents = (__bridge id)[UIImage imageNamed:@"clock"].CGImage;
    // 设置圆角
    clock.cornerRadius = 100;
    clock.masksToBounds = YES;

    // 创建秒针
    CALayer* second = [[CALayer alloc] init];
    second.bounds = CGRectMake(0, 0, 2, 100); // 大小
    second.position = clock.position; // 位置
    second.backgroundColor = [UIColor redColor].CGColor; // 颜色
    // 锚点 定位点
    second.anchorPoint = CGPointMake(0.5, 0.8);
    
    // 创建分针
    CALayer *minute  = [[CALayer alloc] init];
    minute.bounds = CGRectMake(0, 0, 4, 80);
    minute.position = clock.position;
    minute.backgroundColor = [UIColor blackColor].CGColor;
    minute.cornerRadius = 2;
    // 在iOS开发中， anchorPoint 是CALayer的一个重要属性，用于确定图层的锚点或定位点。
    // anchorPoint 是一个CGPoint类型的值，默认值为 (0.5, 0.5) ，表示图层的中心点。这个值是相对于图层自身坐标系的比例值，取值范围为0.0到1.0：
    // - X坐标：0.0表示图层左侧边缘，1.0表示右侧边缘
    // - Y坐标：0.0表示图层顶部边缘，1.0表示底部边缘
    minute.anchorPoint = CGPointMake(0.5, 0.8);
    
    // 创建时针
    CALayer *hour = [[CALayer alloc] init];
    hour.bounds = CGRectMake(0, 0, 6, 60);
    hour.position = clock.position;
    hour.backgroundColor = [UIColor blackColor].CGColor;
    hour.cornerRadius = 3;
    hour.anchorPoint = CGPointMake(0.5, 0.8);

    // 添加表盘
    [self.view.layer addSublayer:clock];

    // 添加秒针
    [self.view.layer addSublayer:second];
    
    [self.view.layer addSublayer:minute];
    
    [self.view.layer addSublayer:hour];

    // 给全局属性赋值
    self.second = second;
    self.minute = minute;
    self.hour = hour;

    // 计时器
    //    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];

    // 显示连接
    CADisplayLink* link = [CADisplayLink displayLinkWithTarget:self selector:@selector(timeChange)];
    // 把显示连接添加到主循环当中
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];

    [self timeChange];
}

// 旋转(一秒一次)
- (void)timeChange
{
    // 一秒钟旋转的角度
    CGFloat angle = 2 * M_PI / 60;

    NSDate* date = [NSDate date];

    // 真实的时间
    // 15:00:20 000

    // 15:00:20 999

    //    // 1.nsdate
    //    // 创建一个时间格式化的对象
    //    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    //    formatter.dateFormat = @"ss";
    //    CGFloat time = [[formatter stringFromDate:date] floatValue];

    // 2.日历
    NSCalendar* cal = [NSCalendar currentCalendar];
    CGFloat second = [cal component:NSCalendarUnitSecond fromDate:date];
    CGFloat minute = [cal component:NSCalendarUnitMinute fromDate:date];
    CGFloat hour = [cal component:NSCalendarUnitHour fromDate:date] % 12;
    
    NSLog(@"%f", hour);

    self.second.affineTransform = CGAffineTransformMakeRotation(second * angle);
    self.minute.affineTransform = CGAffineTransformMakeRotation(minute * angle);
    self.hour.affineTransform = CGAffineTransformMakeRotation(hour * angle * 5);
    
}

@end
