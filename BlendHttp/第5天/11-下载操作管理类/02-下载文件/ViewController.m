//
//  ViewController.m
//  02-下载文件
//
//  Created by Apple on 15/10/25.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"
#import "HMDownloaderManager.h"
#import "HMProcessView.h"

@interface ViewController ()
@property(weak, nonatomic) IBOutlet HMProcessView *processView;
@end

@implementation ViewController
// 暂停
- (IBAction)pause:(id)sender {
    //    [self.downloader pause];

    [[HMDownloaderManager sharedManager] pause:@"http://127.0.0.1/abc.hm"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[HMDownloaderManager sharedManager] download:@"http://127.0.0.1/abc.hm"
        successBlock:^(NSString *path) {
          NSLog(@"下载完成,%@", path);
        }
        processBlock:^(float process) {
          dispatch_async(dispatch_get_main_queue(), ^{
            // 点语法 - 设置
            // 点语法写法
            // self.processView.process = process;

            // 编译器实际转换成：
            // [[self processView] setProcess:process];
            // 或者等价于：
            // [self.processView setProcess:process];
            self.processView.process = process;
          });
        }
        errorBlock:^(NSError *error) {
          NSLog(@"%@", error);
        }];
}

@end
