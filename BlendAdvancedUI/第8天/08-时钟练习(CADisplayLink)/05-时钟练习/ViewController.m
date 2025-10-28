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
//     修改 clock.bounds = CGRectMake(0, 0, 200, 200) 中第一个和第二个参数（即bounds的origin坐标）没有视觉效果的原因如下：

// 1. bounds属性的作用 ：bounds定义了图层的内部坐标系统，其中origin(x,y)表示图层内部坐标系的原点位置，size(width,height)表示图层的大小。
// 2. origin参数的特性 ：对于大多数普通图层，修改bounds的origin值通常不会产生明显的视觉变化，因为：
   
//    - CALayer默认使用自身的中心点作为参照
//    - position属性已经确定了图层在父坐标系中的位置
//    - 单独修改origin不会改变图层在屏幕上的显示位置
// 3. 为什么没有作用 ：在时钟练习中，clock图层的position属性已经设置为(200, 200)，这个position决定了图层在父视图中的位置。bounds的origin主要影响图层内部的坐标计算，而不是图层本身的位置。
// 4. 什么时候origin会有影响 ：
   
//    - 当修改anchorPoint时，origin会影响position的相对关系
//    - 当图层有子图层时，父图层的bounds.origin会影响子图层的定位
//    - 当进行旋转或其他复杂变换时
// 总结：对于单独的图层，bounds的size参数(width,height)决定了图层的可见大小，而origin(x,y)参数通常不会产生直接的视觉效果。
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
//     anchorPoint （锚点）是CALayer类的一个属性，用于确定图层旋转、缩放等变换操作的中心点。它的作用和含义如下：

// 1. 定义 ： anchorPoint 是一个CGPoint类型的值，表示锚点在图层坐标系中的位置，取值范围为(0.0, 0.0)到(1.0, 1.0)。
// 2. 默认值 ：默认值为(0.5, 0.5)，即图层的中心点。
// 3. 工作原理 ：当对图层进行旋转、缩放等变换时，图层会绕着锚点进行变换操作。
// 4. 与position属性的关系 ： position 属性定义了锚点在父图层坐标系中的位置。也就是说，图层的 position 点始终对应其 anchorPoint 点。
// 5. 在时钟练习中的应用 ：代码 second.anchorPoint = CGPointMake(0.5, 0.8) 将秒针图层的锚点设置为水平中心、垂直方向80%的位置，这样秒针就会绕着表盘中心旋转，而不是绕着自身中心旋转，从而实现真实时钟的效果。
// 6. 注意事项 ：修改锚点不会改变图层在屏幕上的显示位置，但会改变图层的几何变换基准点。
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

// 旋转
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

    //  Affine Transform（仿射变换） 就是：
    // 一个线性变换（旋转、缩放、剪切） + 一个平移变换。
    self.second.affineTransform = CGAffineTransformMakeRotation(second * angle);
    self.minute.affineTransform = CGAffineTransformMakeRotation(minute * angle);
    self.hour.affineTransform = CGAffineTransformMakeRotation(hour * angle * 5);
    
}

@end
