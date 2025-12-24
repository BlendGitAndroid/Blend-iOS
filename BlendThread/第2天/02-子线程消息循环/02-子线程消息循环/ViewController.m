//
//  ViewController.m
//  02-子线程消息循环
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

    // 开启一个子线程
    NSThread *thread = [[NSThread alloc] initWithTarget:self
                                               selector:@selector(demo)
                                                 object:nil];
    [thread start];

    // 往子线程的消息循环中添加输入源，使用指定的线程
    // waitUntilDone:NO 控制当前线程是否等待目标方法执行完成：
    // - YES ：当前线程会阻塞，直到 demo1 方法在目标线程上执行完毕
    // - NO ：当前线程不等待，直接继续执行后续代码
    [self performSelector:@selector(demo1)
                 onThread:thread
               withObject:nil
            waitUntilDone:YES];
    
    // 这里的当前线程就是UI线程
    // 如果 waitUntilDone:NO 为 YES，当前线程会阻塞，先打印I'm running，再打印，I'm running on runloop，最后打印：I am UI Thread
    // 如果 waitUntilDone:NO 为 NO，当前线程不等待，先打印 "I am UI Thread"，再会打印 "I'm running"
    NSLog(@"I am UI Thread");
}

// 执行在子线程上的方法
- (void)demo {
    NSLog(@"I'm running");
    // 开启子线程的消息循环,如果开启，消息循环一直运行
    // 当消息循环中没有添加输入事件，消息循环会立即结束
    // 开启子线程的消息循环
    //    [[NSRunLoop currentRunLoop] run];

    // 开启消息循环，并2秒钟之后消息循环结束
    [[NSRunLoop currentRunLoop]
        runUntilDate:[NSDate dateWithTimeIntervalSinceNow:2]];
    
    NSLog(@"end");
}

// 执行在子线程的消息循环中
- (void)demo1 {
    NSLog(@"I'm running on runloop");
}

@end
