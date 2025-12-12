//
//  ViewController.m
//  15-线程间通信
//
//  Created by Apple on 15/10/14.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//全局队列
@property (nonatomic, strong) NSOperationQueue *queue;
@end

@implementation ViewController

//懒加载
- (NSOperationQueue *)queue {
    if (_queue == nil) {
        _queue = [[NSOperationQueue alloc] init];
    }
    return _queue;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self.queue addOperationWithBlock:^{
      //异步下载图片
        NSLog(@"异步下载图片");
        
        //获取当前队列
//        [NSOperationQueue currentQueue]
        
        //线程间通信，回到主线程更新UI
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            NSLog(@"更新UI");
        }];
        
    }];
}





@end
