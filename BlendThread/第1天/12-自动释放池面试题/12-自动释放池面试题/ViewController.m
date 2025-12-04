//
//  ViewController.m
//  12-自动释放池面试题
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
    for (int i=0; i < 100000000; i++) {
        @autoreleasepool {

            NSString *str = [NSString stringWithFormat:@"hello %d",i];
        }
    }
    
    
}

@end
