//
//  ViewController.m
//  02transform属性介绍
//
//  Created by apple on 15/2/6.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnIcon;
// 移动
- (IBAction)move;

// 旋转
- (IBAction)rotate;

// 缩放
- (IBAction)scale;
- (IBAction)goBack:(id)sender;

@end

// Affine Transform：在数学和计算机图形学中，"Affine"（仿射） 指的是一种特殊的几何变换，称为 仿射变换（Affine Transformation）

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)move {
    
    // 2. 修改结构体值
    // 下面这句话的意思是:告诉控件, 平移到距离原始位置-50的位置
    //self.btnIcon.transform = CGAffineTransformMakeTranslation(0, -50); // 向上平移
    
    // 基于一个旧的值, 在进行平移
    // 基于现有的一个值, 再进行平移
    self.btnIcon.transform = CGAffineTransformTranslate(self.btnIcon.transform, 0, 50);
}

- (IBAction)rotate {
    // 45°
    //self.btnIcon.transform = CGAffineTransformMakeRotation(-M_PI_4);
    
    
    [UIView animateWithDuration:2.5 animations:^{
        self.btnIcon.transform = CGAffineTransformRotate(self.btnIcon.transform, -M_PI_4);
        self.btnIcon.transform = CGAffineTransformTranslate(self.btnIcon.transform, 0, 50);
        self.btnIcon.transform = CGAffineTransformScale(self.btnIcon.transform, 1.5, 1.5);
    }];
    
}

// 缩放
// 类似于CGAffineTransformScale这样的，就是一个C语言的方法，
// CG代表的是CoreGraphics的意思
// CGAffineTransformScale是直接定义在.h头文件中，就是一个C语音的方法
- (IBAction)scale {
    //self.btnIcon.transform = CGAffineTransformMakeScale(0.5, 0.5);
    self.btnIcon.transform = CGAffineTransformScale(self.btnIcon.transform, 1.5, 1.5);
}

// 而OC语言，是定义在@interface中的，UI开头的都是定义在UIKit中
// Objective-C 是 C 的超集，所有 C 语法和函数都可以直接在 OC 中使用。

// 让控件回到原始的位置
- (IBAction)goBack:(id)sender {
    self.btnIcon.transform = CGAffineTransformIdentity;
}
@end
