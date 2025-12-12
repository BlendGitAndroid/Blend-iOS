//
//  ViewController.m
//  07-主队列
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
    [self demo3];
}

//1 主队列，异步执行   主线程，顺序执行
//主队列的特点：先执行完主线程上的代码，才会执行主队列中的任务
- (void)demo1 {
    for (int i = 0; i < 10; i++) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"hello %d  %@",i,[NSThread currentThread]);
        });
    }
    
}

//2 主队列，同步执行  ---   主线程上执行才会死锁
//同步执行：会等着第一个任务执行完成，才会继续往后执行

- (void)demo2 {
    NSLog(@"begin");
    for (int i = 0; i < 10; i++) {
        //死锁
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"hello %d  %@",i,[NSThread currentThread]);
        });
    }
    NSLog(@"end");

}

//3 解决死锁的问题
- (void)demo3 {
    NSLog(@"begin");
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i = 0; i < 10; i++) {
            //死锁
            dispatch_sync(dispatch_get_main_queue(), ^{
                NSLog(@"hello %d  %@",i,[NSThread currentThread]);
            });
        }
    });
    
    NSLog(@"end");
}


//dispatch_queue_t queue = dispatch_queue_create("mm", DISPATCH_QUEUE_CONCURRENT);

//dispatch_get_global_queue(0, 0);

- (void)demo4 {
//    dispatch_get_global_queue(0, 0)；
    
    
    //iOS7以后推荐使用服务质量
//    *  - QOS_CLASS_USER_INTERACTIVE
//    *  - QOS_CLASS_USER_INITIATED
//    *  - QOS_CLASS_DEFAULT
//    *  - QOS_CLASS_UTILITY
//    *  - QOS_CLASS_BACKGROUND

    //iOS7以前，队列的优先级， 队列的优先级和服务质量是对应关系
//    *  - DISPATCH_QUEUE_PRIORITY_HIGH:         QOS_CLASS_USER_INITIATED
//    *  - DISPATCH_QUEUE_PRIORITY_DEFAULT:      QOS_CLASS_DEFAULT
//    *  - DISPATCH_QUEUE_PRIORITY_LOW:          QOS_CLASS_UTILITY
//    *  - DISPATCH_QUEUE_PRIORITY_BACKGROUND:   QOS_CLASS_BACKGROUND
}
@end
