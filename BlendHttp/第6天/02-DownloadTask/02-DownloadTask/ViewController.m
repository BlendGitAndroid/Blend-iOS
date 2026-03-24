//
//  ViewController.m
//  02-DownloadTask
//
//  Created by Apple on 15/10/26.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self downloadTask];
}

// download
- (void)downloadTask {
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/abc.hm"];

    [[[NSURLSession sharedSession]
        downloadTaskWithURL:url
          completionHandler:^(NSURL *_Nullable location,
                              NSURLResponse *_Nullable response,
                              NSError *_Nullable error) {
            NSLog(@"%@", [NSThread currentThread]);

            NSLog(@"%@", location);

            // NSSearchPathForDirectoriesInDomains表示的是在沙盒中寻找Documents目录
            NSString *doc = [[NSSearchPathForDirectoriesInDomains(
                NSDocumentDirectory, NSUserDomainMask, YES) lastObject]
                stringByAppendingPathComponent:@"123.hm"];

            // 复制到其他位置
            // 注意：location路径下的文件下载完成后会被系统删除，所以需要复制到其他位置
            [[NSFileManager defaultManager] copyItemAtPath:location.path
                                                    toPath:doc
                                                     error:NULL];
          }] resume];
}

@end
