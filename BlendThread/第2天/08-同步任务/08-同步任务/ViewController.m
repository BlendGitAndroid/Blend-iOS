//
//  ViewController.m
//  08-同步任务
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
    //appStore下载应用--输入密码--扣费--下载应用
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_sync(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"输入密码 %@",[NSThread currentThread]);
        });
        
        dispatch_sync(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"扣费 %@",[NSThread currentThread]);
//            [NSThread sleepForTimeInterval:1];
        });
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"下载应用 %@",[NSThread currentThread]);
        });
    });
    
    

}


@end
