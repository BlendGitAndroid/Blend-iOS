//
//  ViewController.m
//  15-柱状图(三方框架)
//
//  Created by Romeo on 15/7/24.
//  Copyright (c) 2015年 heima. All rights reserved.
//

#import "ViewController.h"
#import "UUChart.h"

@interface ViewController () <UUChartDataSource>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    UUChart* chart = [[UUChart alloc] initwithUUChartDataFrame:CGRectMake(0, 30, 375, 300) withSource:self withStyle:UUChartBarStyle];

    [chart showInView:self.view];
}

- (NSArray*)UUChart_xLableArray:(UUChart*)chart
{
    return @[ @"111", @"222" ];
}

- (NSArray*)UUChart_yValueArray:(UUChart*)chart
{
    return @[ @[ @"110", @"50" ], @[ @"10", @"150" ] ];
}

- (NSArray*)UUChart_ColorArray:(UUChart*)chart
{
    return @[ [UIColor redColor], [UIColor blueColor] ];
}
@end
