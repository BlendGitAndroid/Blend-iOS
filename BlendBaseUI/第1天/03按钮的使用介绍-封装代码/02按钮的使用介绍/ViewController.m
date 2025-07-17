//
//  ViewController.m
//  02按钮的使用介绍
//
//  Created by apple on 15/2/5.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)move:(UIButton *)sender;


- (IBAction)scale:(UIButton *)sender;



@property (weak, nonatomic) IBOutlet UIButton *btnIcon;

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







// 点击上下左右执行该方法
- (IBAction)move:(UIButton *)sender {
    
    // 通过frame移动位置
    {
        
    
    
//    // 为每个按钮设置不同的tag值, 然后在这个方法中就可以根据sender.tag来判断用户当前点击的是哪个按钮
//    
//    // 1. 获取原始的frame
//    CGRect originFrame = self.btnIcon.frame;
//    
//    // 2. 修改frame
//    switch (sender.tag) {
//        case 10:
//            // 上
//            originFrame.origin.y -= 10;
//            break;
//            
//        case 20:
//            // 右
//            originFrame.origin.x += 10;
//            break;
//            
//        case 30:
//            // 下
//            originFrame.origin.y += 10;
//            break;
//            
//        case 40:
//            // 左
//            originFrame.origin.x -= 10;
//            break;
//    }
//    
//    
//    // 3. 重新赋值
//    self.btnIcon.frame = originFrame;
    
    
    
    //NSLog(@"00000");
    }
    
    // 通过center移动位置
    // center表示的是控件中心点的坐标
    // frame获取的x和y表示的是元素左上角的坐标
    CGPoint centerPoint =  self.btnIcon.center;

    
    // 修改center
    switch (sender.tag) {
        case 10:
            // 上
            centerPoint.y -= 100;
            break;

        case 20:
            // 右
            centerPoint.x += 100;
            break;

        case 30:
            // 下
            centerPoint.y += 100;
            break;
            
        case 40:
            // 左
            centerPoint.x -= 100;
            break;
    }
    
    
    
    // 重新赋值center
    // 没有动画，直接执行
    //self.btnIcon.center = centerPoint;
    
    
    
    
    // 通过动画的方式来执行
    
//    // 1.开启一个动画
//    [UIView beginAnimations:nil context:nil];
//    // 2.设置动画执行时间
//    [UIView setAnimationDuration:1];
//    
//    //============= 中间这里是要执行的动画的代码======================
//    self.btnIcon.center = centerPoint;
//    //============= 中间这里是要执行的动画的代码======================
//    
//    
//    // 3.提交动画、
//    [UIView commitAnimations];
    
    
    
    //--------block方式实现动画
    [UIView animateWithDuration:0.5 animations:^{
        self.btnIcon.center = centerPoint;
    }];
}


// 缩放
- (IBAction)scale:(UIButton *)sender {
    
    // 通过frame修改大小
    
        // 1. 获取原始frame
        CGRect originFrame = self.btnIcon.frame;
        
        // 2. 修改
        if (sender.tag == 100) {
            // 放大
            originFrame.size.width += 10;
            originFrame.size.height += 10;
        } else {
            // 缩小
            originFrame.size.width -= 10;
            originFrame.size.height -= 10;
        }
        
        
        // 3. 重新赋值
        //self.btnIcon.frame = originFrame;
    
    // 通过block方式来实现动画
    [UIView animateWithDuration:1.0 animations:^{
        // 执行动画的代码
        self.btnIcon.frame = originFrame;
    }];
    
    
    
    
    
    
    // 通过bounds改变大小
    {
//    // 通过bounds修改大小
//    // bounds虽然也是CGRect类型, 但是x,y的值始终是0.所以只能通过bounds修改大小
//    // 1. 获取原始的bounds
//    CGRect originBounds = self.btnIcon.bounds;
//    //NSLog(@"%@", NSStringFromCGRect(originBounds));
//    
//    
//    // 2.修改boudns的值
//    if (sender.tag == 100) {
//        originBounds.size.width += 100;
//        originBounds.size.height += 100;
//    } else {
//        originBounds.size.width -= 100;
//        originBounds.size.height -= 100;
//    }
//    
//    
//    // 3. 重新赋值
//    //self.btnIcon.bounds = originBounds;
//    
//    
//    
//    // 通过动画实现
//    
//    // 开启动画
//    [UIView beginAnimations:nil context:nil];
//    // 设置动画执行时间
//    [UIView setAnimationDuration:1];
//    
//    //------------- 要指定动画的代码--------------
//    self.btnIcon.bounds = originBounds;
//    
//    
//    
//    // 提交动画
//    [UIView commitAnimations];
        
    }
    
    
    
    
}




@end




















