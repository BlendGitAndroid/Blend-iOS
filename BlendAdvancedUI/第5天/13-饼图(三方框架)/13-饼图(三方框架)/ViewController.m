//
//  ViewController.m
//  13-饼图(三方框架)
//
//  Created by Romeo on 15/7/24.
//  Copyright (c) 2015年 heima. All rights reserved.
//

#import "ViewController.h"
#import "XYPieChart.h"

@interface ViewController () <XYPieChartDelegate, XYPieChartDataSource>

@property (nonatomic, strong) NSMutableArray* array;

@end

@implementation ViewController

- (NSArray*)array
{
    if (!_array) {
        _array = [NSMutableArray array];
    }
    return _array;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    for (int i = 0; i < 5; ++i) {
        [self.array addObject:@(i)];
    }

    XYPieChart* pie = [[XYPieChart alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    [pie setDelegate:self];
    [pie setDataSource:self];

    [self.view addSubview:pie];

    [pie reloadData];
}

- (UIColor*)pieChart:(XYPieChart*)pieChart colorForSliceAtIndex:(NSUInteger)index
{

    if (index == 1) {
        return [UIColor blueColor];
    }
    else {
        return [UIColor grayColor];
    }
}

- (NSUInteger)numberOfSlicesInPieChart:(XYPieChart*)pieChart
{
    return self.array.count;
}

- (CGFloat)pieChart:(XYPieChart*)pieChart valueForSliceAtIndex:(NSUInteger)index
{
    return [[self.array objectAtIndex:index] intValue];
}
@end
