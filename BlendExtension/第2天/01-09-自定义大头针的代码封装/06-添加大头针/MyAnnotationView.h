//
//  MyAnnotationView.h
//  06-添加大头针
//
//  Created by dream on 15/12/11.
//  Copyright © 2015年 dream. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MyAnnotationView : MKAnnotationView

/** 提供快速创建View的方法*/
+ (instancetype)myAnnotationViewWithMapView:(MKMapView *)mapView;

@end
