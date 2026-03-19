//
//  ViewController.m
//  07-上传多个文件
//
//  Created by Apple on 15/10/23.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"
#import "HMUploadFiles.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 获取文件的路径
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"01.jpg"
                                                      ofType:nil];
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"06.jpg"
                                                      ofType:nil];
    NSArray *filePaths = @[ path1, path2 ];

    // 获取参数
    NSDictionary *params = @{@"username" : @"zhangsan"};

    [HMUploadFiles uploadFiles:@"http://127.0.0.1/php/upload/upload-m.php"
                     fieldName:@"userfile[]"
                     filePaths:filePaths
                        params:params];
}

@end
