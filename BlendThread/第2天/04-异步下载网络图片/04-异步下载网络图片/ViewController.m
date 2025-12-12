//
//  ViewController.m
//  04-异步下载网络图片
//
//  Created by Apple on 15/10/14.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation ViewController

- (void)loadView {
    self.scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.scrollView.backgroundColor = [UIColor whiteColor];
    self.view = self.scrollView;
    
    self.imageView = [[UIImageView alloc] init];
    [self.scrollView addSubview:self.imageView];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //开启异步执行，下载网络图片
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSURL *url = [NSURL URLWithString:@"http://img02.tooopen.com/images/20141231/sy_78327074576.jpg"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *img = [UIImage imageWithData:data];
        
        //回到主线程更新UI
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.imageView.image = img;
            [self.imageView sizeToFit];
            
            self.scrollView.contentSize = img.size;
        });
    });
}



@end
