//
//  ViewController.m
//  06-模拟 imageView
//
//  Created by Romeo on 15/12/6.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"
#import "HMImageView.h"

@interface ViewController ()

@property (nonatomic, weak) HMImageView* imageView;
//@property (nonatomic, weak) UIImageView* imageView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    HMImageView* imageView = [[HMImageView alloc] initWithImage:[UIImage imageNamed:@"me"]];

    self.imageView = imageView;

    [self.view addSubview:imageView];

    // -------

    //    HMImageView* imageView = [[HMImageView alloc] init];
    //    imageView.frame = CGRectMake(0, 0, 200, 200);
    //    imageView.image = [UIImage imageNamed:@"me"];
    //
    //    self.imageView = imageView;
    //
    //    [self.view addSubview:imageView];

    // *******

    //    UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"me"]];
    //
    //    self.imageView = imageView;
    //
    //    [self.view addSubview:imageView];
    //
    //    // -------
    //
    //    UIImageView* imageView = [[UIImageView alloc] init];
    //    imageView.frame = CGRectMake(0, 0, 200, 200);
    //    imageView.image = [UIImage imageNamed:@"me"];
    //
    //    self.imageView = imageView;
    //
    //    [self.view addSubview:imageView];
}

- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    self.imageView.image = [UIImage imageNamed:@"Press"];
}

@end
