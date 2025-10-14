//
//  ViewController.m
//  控件为什么用weak？
//
//  Created by 刘春牢 on 15/11/29.
//  Copyright © 2015年 liuchunlao. All rights reserved.
//

#import "ViewController.h"
#import "HMRedView.h"

@interface ViewController ()

/** 红色的视图控件 */
//@property (weak, nonatomic) IBOutlet HMRedView *redView;


@property (strong, nonatomic) IBOutlet HMRedView *redView;

@end

@implementation ViewController

#pragma mark - 控件为什么用weak修饰而不用strong修饰？
/**
 在界面上显示View有两种方式：
 1> 通过代码去创建一个view视图并且通过addSubview方法将其添加到控制器的view
 2> 通过拖拽控件的形式将view视图添加到 控制器的view内的
 
    本质上都相当于控制器的view 强引用 这个子view视图。也就是说有一个强指针指向这个视图。
    也就是这个控制器的self.view强引用了这个子view，这是一个强指针
    还有就是控制器的属性，如果也是强指针指向这个子view，那相当于就有两个强指针指向这个子view了
 
 使用weak修饰和strong修饰的区别：
 > 如果用weak修饰，当这个子视图移除控制器的view的时候就可以销毁了，能够及时的释放内存。
 > 那么在引用的时候如果再用strong修饰的话，相当于两个强指针指向同一个view，多余一个强指针导致视图被移除控制器后并没有被销毁。因为还有一个strong修饰的属性在指向它，导致很多无用的对象占用内存。
 */


#pragma mark - 懒加载控件的时候为什么用strong？
/**
 因为懒加载本身是重写这个控件的get方法，如果这个控件不存在，那就去创建这个控件，但是如果用weak去修饰的话，这个控件在创建好后就会被直接销毁。根本拿不到控件对象。
 所以需要通过strong的方式进行修饰，保证这个对象能够始终存在。
 */

#pragma mark - 移除按钮的点击
- (IBAction)removeBtnClick:(UIButton *)sender {
    
    // 将红色控件移除
    [self.redView removeFromSuperview];
    
    // 将本身的强指针变为空
    self.redView = nil;

}


- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    
}

@end
