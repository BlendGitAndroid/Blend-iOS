//
//  HMTwoViewController.m
//  01-换肤
//
//  Created by dream on 15/12/19.
//  Copyright © 2015年 dream. All rights reserved.
//

#import "HMTwoViewController.h"
#import "HMSkinTools.h"

@interface HMTwoViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *rectView;
@property (weak, nonatomic) IBOutlet UIImageView *faceView;
@property (weak, nonatomic) IBOutlet UIImageView *heartView;

@end

@implementation HMTwoViewController

#pragma mark 在视图出现之前, 重新加载皮肤

//viewWillAppear: 视图将要显示的时候会调用的方法
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.faceView.image = [HMSkinTools imageWithImageName:@"face"];
    self.heartView.image = [HMSkinTools imageWithImageName:@"heart"];
    self.rectView.image = [HMSkinTools imageWithImageName:@"rect"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}



@end
