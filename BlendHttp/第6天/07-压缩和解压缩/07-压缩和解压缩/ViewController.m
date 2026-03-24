//
//  ViewController.m
//  07-压缩和解压缩
//
//  Created by Apple on 15/10/26.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"
#import "SSZipArchive.h"

@interface ViewController ()

@end

@implementation ViewController


// SSZipArchive 是一个流行的 iOS/macOS ZIP 处理库
// 提供简单易用的 ZIP 文件创建和解压功能
// GitHub: https://github.com/ZipArchive/ZipArchive
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // 这是使用 SSZipArchive 第三方库来创建 ZIP 压缩文件的代码。
    // createZipFileAtPath: - 要创建的 ZIP 文件的完整路径
    // withContentsOfDirectory: - 要压缩的目录路径
    [SSZipArchive createZipFileAtPath:@"/Users/Apple/Desktop/123.zip"
              withContentsOfDirectory:@"/Users/Apple/Desktop/images"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/itcast/images.zip"];
    [[[NSURLSession sharedSession]
        downloadTaskWithURL:url
          completionHandler:^(NSURL *_Nullable location,
                              NSURLResponse *_Nullable response,
                              NSError *_Nullable error) {
            // 解压
            [SSZipArchive
                unzipFileAtPath:location.path
                  toDestination:[NSSearchPathForDirectoriesInDomains(
                                    NSCachesDirectory, NSUserDomainMask, YES)
                                    lastObject]];
            NSLog(@"解压完成 %@", location);
          }] resume];
}

@end
