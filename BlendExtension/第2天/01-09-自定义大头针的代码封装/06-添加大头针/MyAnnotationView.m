//
//  MyAnnotationView.m
//  06-添加大头针
//
//  Created by dream on 15/12/11.
//  Copyright © 2015年 dream. All rights reserved.
//

#import "MyAnnotationView.h"
#import "MyAnnotationModel.h"

@interface MyAnnotationView ()

@property (strong, nonatomic) MyAnnotationModel *annoModel;

@end

@implementation MyAnnotationView


/** 提供快速创建View的方法*/
+ (instancetype)myAnnotationViewWithMapView:(MKMapView *)mapView
{
    
    //2. 自定义大头针View --> 跟Cell的创建几乎一样
    static NSString *ID = @"annoView";
    
    //MKAnnotationView : 默认image属性没有赋值
    //MKPinAnnotationView : 子类是默认有View的
    MyAnnotationView *annoView = (MyAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:ID];
    
    if (annoView == nil) {
        annoView = [[MyAnnotationView alloc] initWithAnnotation:nil reuseIdentifier:ID];
        
        //1. 设置可以点击呼唤出来之前设置的标题子标题
        annoView.canShowCallout = YES;
        
//        NSLog(@"model: %@", annoView.annoModel);
        
        //2. 设置左边附属视图
        annoView.leftCalloutAccessoryView = [UISwitch new];
        
        //3. 设置右边附属视图
        annoView.rightCalloutAccessoryView = [UISwitch new];
        
        //4. iOS9新增 自定义详情 --> 子标题
        annoView.detailCalloutAccessoryView = [UISwitch new];
        
    }
    
    return annoView;

}

#pragma mark 系统会自动调用该方法 annotation 的 set方法
- (void)setAnnotation:(id<MKAnnotation>)annotation
{
    
    //1. 必须调用父类方法
    [super setAnnotation:annotation];
    
    _annoModel = annotation;
    
    //2. 设置图像
    MyAnnotationModel *myAnnotation = annotation;
    self.image =  [UIImage imageNamed:myAnnotation.icon];
}



@end
