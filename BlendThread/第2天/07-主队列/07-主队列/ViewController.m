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
    //    [self demo1];
    //    [self demo2];
    [self demo3];
}

// 主队列的特点：先执行完主线程上的代码，才会执行主队列中的任务，类似于Android中的post方法

// 1 异步执行，主队列  主线程，顺序执行
- (void)demo1 {
    for (int i = 0; i < 10; i++) {
        dispatch_async(dispatch_get_main_queue(), ^{
          NSLog(@"hello %d  %@", i, [NSThread currentThread]);
        });
    }
}

// 2 同步执行，主队列  ---   主线程上执行才会死锁
// 同步执行：会等着第一个任务执行完成，才会继续往后执行

- (void)demo2 {
    NSLog(@"begin");
    for (int i = 0; i < 10; i++) {
        // 死锁，当前线程（主线程）正在执行demo2，主队列中的任务需要等待主线程空闲才能执行，但
        // dispatch_sync 又在等待任务执行完成
        dispatch_sync(dispatch_get_main_queue(), ^{
          NSLog(@"hello %d  %@", i, [NSThread currentThread]);
        });
    }
    NSLog(@"end");
}

// 3 解决死锁的问题
- (void)demo3 {
    NSLog(@"begin");

    // 放在非主线程执行
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
      for (int i = 0; i < 10; i++) {
          // 解决死锁，同步操作放在 非主线程 执行，避免了主队列的循环等待
          dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"hello %d  %@", i, [NSThread currentThread]);
          });
      }
    });

    NSLog(@"end");
}

// dispatch_queue_t queue = dispatch_queue_create("mm",
// DISPATCH_QUEUE_CONCURRENT);

// 第一个参数是优先级，填写0就是默认优先级，第二个参数是将来使用，现在还没用，默认是0
// dispatch_get_global_queue(0, 0);

- (void)demo4 {
    //    dispatch_get_global_queue(0, 0)；

    // iOS7以后推荐使用服务质量
    //    *  - QOS_CLASS_USER_INTERACTIVE
    //    *  - QOS_CLASS_USER_INITIATED
    //    *  - QOS_CLASS_DEFAULT
    //    *  - QOS_CLASS_UTILITY
    //    *  - QOS_CLASS_BACKGROUND

    // iOS7以前，队列的优先级， 队列的优先级和服务质量是对应关系
    //    *  - DISPATCH_QUEUE_PRIORITY_HIGH:         QOS_CLASS_USER_INITIATED
    //    *  - DISPATCH_QUEUE_PRIORITY_DEFAULT:      QOS_CLASS_DEFAULT
    //    *  - DISPATCH_QUEUE_PRIORITY_LOW:          QOS_CLASS_UTILITY
    //    *  - DISPATCH_QUEUE_PRIORITY_BACKGROUND:   QOS_CLASS_BACKGROUND
}
@end
