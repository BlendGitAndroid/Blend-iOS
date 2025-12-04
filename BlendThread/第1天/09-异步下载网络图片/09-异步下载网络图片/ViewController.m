//
//  ViewController.m
//  09-异步下载网络图片
//
//  Created by Apple on 15/10/13.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;

@property (strong, nonatomic) IBOutlet UILabel *lbl;
@end

@implementation ViewController

- (void)loadView {
    //初始化scrollview
    self.scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.scrollView.backgroundColor = [UIColor whiteColor];
    self.view = self.scrollView;
    
    //初始化imageView
    self.imageView = [[UIImageView alloc] init];
    [self.scrollView addSubview:self.imageView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(downloadImage) object:nil];
    [thread start];
}


//下载网络图片
- (void)downloadImage {
    //图片的地址
    NSURL *url = [NSURL URLWithString:@"http://img04.tooopen.com/images/20130701/tooopen_20083555.jpg"];
    //下载图片
    NSData *data = [NSData dataWithContentsOfURL:url];
    //把NSData转换成UIImage
    UIImage *img = [UIImage imageWithData:data];
    
    //在主线程上更新UI控件  线程间通信
    //waitUntilDone  值是YES 会等待方法之行完毕，才会执行后续代码
    [self performSelectorOnMainThread:@selector(updateUI:) withObject:img waitUntilDone:YES];
    
   
    
}

- (void)updateUI:(UIImage *)img {
    self.imageView.image = img;
    //让imageview的大小和图片的大小一致
    [self.imageView sizeToFit];
    
    //设置scrollView滚动范围
    self.scrollView.contentSize = img.size;
}


@end
