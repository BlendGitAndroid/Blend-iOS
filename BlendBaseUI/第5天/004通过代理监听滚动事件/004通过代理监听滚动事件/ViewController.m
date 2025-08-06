//
//  ViewController.m
//  004通过代理监听滚动事件
//
//  Created by apple on 15/2/27.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

/**
    需求: 监听UIScrollView的滚动事件
    分析: 要监听UIScrollView的滚动事件, 需要通过代理来实现, 无法通过addTarget:的方式监听。
    通过代理监听滚动事件的步骤:
    1. 为UIScrollView找一个代理对象, 也就是设置UIScrollView的delegate属性
    self.scrollView.delegate = self;
    提醒: 不需要单独创建一个代理对象, 直接将控制器作为控件的代理对象即可。
 
 
    2. 为了保证代理对象中拥有对应的方法, 所以必须让代理对象（控制器自己）遵守对应控件的代理协议（当前控制器要做为哪个控件的代理对象, 那么控制器就要遵守这个控件的代理协议）
    一般控件的代理协议命名规则都是: 控件名Delegate(UIScrollViewDelegate, UIAlertViewDelegate)
    所以说这里要让当前控制器遵守UIScrollViewDelegate协议。
 
 
    3. 在控制器中实现需要的方法.
 
 */
@implementation ViewController


// 即将开始拖拽
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"即将开始拖拽。。。。");
}

// 正在滚动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //NSLog(@"正在滚动。scrollViewDidScroll");
    
    // 输出当前滚动的位置
    NSString *pointStr = NSStringFromCGPoint(scrollView.contentOffset);
    
    NSLog(@"%@", pointStr);
}

// 拖拽完毕
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"拖拽完毕.scrollViewDidEndDragging");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    self.scrollView.contentSize = self.imgView.image.size;
    
    
    // 为UIScrollView找代理
    // 让当前控制器作为UIScrollView的代理对象
    // 设置代理对象
    self.scrollView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
