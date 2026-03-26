//
//  HMTimelineViewController.m
//  06-微信
//
//  Created by dream on 15/12/12.
//  Copyright © 2015年 dream. All rights reserved.
//

#import "HMTimelineViewController.h"

@interface HMTimelineViewController ()

@end

@implementation HMTimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)backClick:(id)sender {
    // 需要知道新闻的协议头
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"news://"]
                                       options:@{}
                             completionHandler:nil];
}

@end
