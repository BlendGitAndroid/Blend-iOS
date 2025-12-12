//
//  ViewController.m
//  06-并行队列
//
//  Created by Apple on 15/10/14.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self demo2];
}

//1 并行队列，同步执行  ----- 串行队列，同步执行   不开线程，顺序执行
- (void)demo1 {
    //并行队列
    dispatch_queue_t queue = dispatch_queue_create("hm", DISPATCH_QUEUE_CONCURRENT);
    
    for (int i = 0; i < 10; i++) {
        dispatch_sync(queue, ^{
            NSLog(@"hello %d  %@",i,[NSThread currentThread]);
        });
    }
}
//2 并行队列，异步执行     开多个线程，无序执行
- (void)demo2 {
    //并行队列
    dispatch_queue_t queue = dispatch_queue_create("hm", DISPATCH_QUEUE_CONCURRENT);
    
    for (int i = 0; i < 10; i++) {
        dispatch_async(queue, ^{
            NSLog(@"hello %d  %@",i,[NSThread currentThread]);
        });
    }
}
@end
