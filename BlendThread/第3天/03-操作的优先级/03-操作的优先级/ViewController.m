//
//  ViewController.m
//  03-操作的优先级
//
//  Created by Apple on 15/10/16.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong) NSOperationQueue *queue;
@end

@implementation ViewController
// 懒加载
- (NSOperationQueue *)queue {
    if (_queue == nil) {
        _queue = [NSOperationQueue new];
    }
    return _queue;
}

// 服务质量本质上是优先级，但是优先级是针对线程的，而服务质量是针对操作的
// 服务质量也不能保证优先级
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // 操作1
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
      for (int i = 0; i < 20; i++) {
          NSLog(@"op1  %d", i);
      }
    }];
    // 设置优先级最高，设置操作的优先级
    op1.qualityOfService = NSQualityOfServiceUserInteractive;
    [self.queue addOperation:op1];

    // 等操作完成，执行  执行在子线程上
    [op1 setCompletionBlock:^{
      NSLog(@"============op1 执行完成========== %@", [NSThread currentThread]);
    }];

    // 操作2
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
      for (int i = 0; i < 20; i++) {
          NSLog(@"op2  %d", i);
      }
    }];
    // 设置优先级最低
    op2.qualityOfService = NSQualityOfServiceBackground;
    [self.queue addOperation:op2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
