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
- (IBAction)scale {
    //self.btnIcon.transform = CGAffineTransformMakeScale(0.5, 0.5);
    self.btnIcon.transform = CGAffineTransformScale(self.btnIcon.transform, 1.5, 1.5);
}

// 让控件回到原始的位置
- (IBAction)goBack:(id)sender {
    self.btnIcon.transform = CGAffineTransformIdentity;
}
@end
