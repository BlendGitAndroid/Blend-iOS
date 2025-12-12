//
//  ViewController.m
//  04-NSThread
//
//  Created by Apple on 15/10/13.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // 方式1
    //    NSThread *thread = [[NSThread alloc] initWithTarget:self
    //    selector:@selector(demo) object:nil]; [thread start];

    // 方式2
    //    [NSThread detachNewThreadSelector:@selector(demo) toTarget:self
    //    withObject:nil];

    // 方式3
    //    [self performSelectorInBackground:@selector(demo) withObject:nil];

    // 方式4 参数
    NSThread *thread = [[NSThread alloc] initWithTarget:self
                                               selector:@selector(demo:)
                                                 object:@"蒋卫生"];
    [thread start];
}

// object用于传递参数
- (void)demo:(NSString *)name {
    NSLog(@"%@", [NSThread currentThread]);
    NSLog(@"hello %@", name);
}

//- (void)demo {
//    NSLog(@"hello %@",[NSThread currentThread]);
//}

@end
