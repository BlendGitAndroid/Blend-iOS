//
//  ViewController.m
//  11-单例
//
//  Created by Apple on 15/10/14.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"
#import "NetworkTools.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    NetworkTools *t1 = [NetworkTools sharedNetworkToolsOnce];
//    
//    NetworkTools *t2 = [NetworkTools sharedNetworkToolsOnce];
//    
//    NSLog(@"%@ ",t1);
//    NSLog(@"%@ ",t2);

    
    [self demo1];
    [self demo2];
}

//获取加锁，创建的时间
- (void)demo1 {
    CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
    for (int i=0; i<10000000; i++) {
        [NetworkTools sharedNetworkTools];
    }
    CFAbsoluteTime end = CFAbsoluteTimeGetCurrent();
    NSLog(@"加锁： %f",end - start);
}
//获取once，创建的时间
- (void)demo2 {
    CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
    for (int i=0; i<10000000; i++) {
        [NetworkTools sharedNetworkToolsOnce];
    }
    CFAbsoluteTime end = CFAbsoluteTimeGetCurrent();
    NSLog(@"once： %f",end - start);
}

@end






