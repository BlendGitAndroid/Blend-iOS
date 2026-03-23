//
//  ViewController.m
//  02-下载文件
//
//  Created by Apple on 15/10/25.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"
#import "HMDownloader.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    HMDownloader *downloader = [HMDownloader new];
    [downloader download:@"http://127.0.0.1/abc.hm"];
    
}

@end
