//
//  ViewController.m
//  06-添加大头针
//
//  Created by dream on 15/12/11.
//  Copyright © 2015年 dream. All rights reserved.
//

#import "ViewController.h"
#import "MyAnnotationModel.h"
#import <MapKit/MapKit.h>

@interface ViewController ()
@property(weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // MKUserLocation --> 大头针模型

    // 1. 添加大头针 --> 需要自定义大头针模型类

    // 2. 创建大头针
    //    MyAnnotationModel *annotationModel = [MyAnnotationModel new];
    //
    //    annotationModel.coordinate = CLLocationCoordinate2DMake(39, 116);
    //    annotationModel.title = @"北京市";
    //    annotationModel.subtitle = @"北京市一个迷人的城市";
    //
    //    //3. 添加到地图上
    //    [self.mapView addAnnotation:annotationModel];
    //
    //    //添加第二个大头针
    //    MyAnnotationModel *annotationModel2 = [MyAnnotationModel new];
    //
    //    annotationModel2.coordinate = CLLocationCoordinate2DMake(23, 108);
    //    annotationModel2.title = @"东莞市";
    //    annotationModel2.subtitle = @"东莞市一个令人向往城市";
    //
    //    //3. 添加到地图上
    //    [self.mapView addAnnotation:annotationModel2];
}

#pragma mark 点击添加大头针
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 1. 获取点击地图的点
    CGPoint point = [[touches anyObject] locationInView:self.mapView];

    // 2. 将点击的点转换成经纬度
    CLLocationCoordinate2D coordinate =
        [self.mapView convertPoint:point toCoordinateFromView:self.mapView];

    // 3. 添加大头针
    MyAnnotationModel *annotationModel = [MyAnnotationModel new];

    annotationModel.coordinate = coordinate;
    annotationModel.title = @"北京市";
    annotationModel.subtitle = @"北京市一个迷人的城市";

    [self.mapView addAnnotation:annotationModel];
}

@end
