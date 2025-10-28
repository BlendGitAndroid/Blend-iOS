//
//  ViewController.m
//  02-CALayer 基本属性
//
//  Created by Romeo on 15/12/9.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) CALayer* layer;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // CALayer中的"CA"代表‌Core Animation‌
    // CALayer和UIView的关系：
    // CALayer 负责视图中显示内容和动画
    // UIView 负责监听和响应事件
//    在iOS中，你能看得见摸得着的东西基本上都是UIView，比如一个按钮、一个文本标签、一个文本输入框、一个图标等等，这些都是UIView
//
//    其实UIView之所以能显示在屏幕上，完全是因为它内部的一个图层
//
//    在创建UIView对象时，UIView内部会自动创建一个图层(即CALayer对象)，通过UIView的layer属性可以访问这个层
//    @property(nonatomic,readonly,retain) CALayer *layer;
//
//    当UIView需要显示到屏幕上时，会调用drawRect:方法进行绘图，并且会将所有内容绘制在自己的图层上，绘图完毕后，系统会将图层拷贝到屏幕上，于是就完成了UIView的显示
//
//     换句话说，UIView本身不具备显示的功能，是它内部的层才有显示功能



    UIView* redView = [[UIView alloc] init];
    redView.frame = CGRectMake(100, 100, 100, 100);
    redView.backgroundColor = [UIColor redColor];
    // 1>边框
    redView.layer.borderWidth = 10; // 边框的宽度
    redView.layer.borderColor = [UIColor grayColor].CGColor; // 边框的颜色
    // 2>阴影
    redView.layer.shadowOffset = CGSizeMake(10, 10); // 阴影的偏移量（合理值）
    redView.layer.shadowColor = [UIColor blueColor].CGColor; // 阴影的颜色
    redView.layer.shadowRadius = 50; // 阴影的半径（合理值）
    redView.layer.shadowOpacity = 1; // 阴影的透明度

    // 3>圆角
    redView.layer.cornerRadius = 50; // 圆角半径
    redView.layer.masksToBounds = YES; // 裁剪超出 layer 范围的东西，但是与显示阴影冲突

    // 4>bounds
    //    redView.layer.bounds = CGRectMake(0, 0, 200, 200);

    // 5>postion属性和view.center的关系 // 默认 center 跑到 position 的位置上
//    redView.layer.position = CGPointMake(0, 0);

    // 6>设置内容(图片)
    redView.layer.contents = (__bridge id)([UIImage imageNamed:@"me"].CGImage);

    [self.view addSubview:redView];

    self.layer = redView.layer;
}

- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{

    //    self.layer.opacity = 0; // 透明度

    //    self.layer.bounds = CGRectMake(0, 0, 200, 200);

    // 获取触摸对象
    UITouch* t = touches.anyObject;

    // 获取手指当前的位置
    CGPoint p = [t locationInView:t.view];

    // 让layer 跑到手指的位置，因为是center跑到position的位置，所以手指点到哪里就显示到哪里
    self.layer.position = p;
}

@end
