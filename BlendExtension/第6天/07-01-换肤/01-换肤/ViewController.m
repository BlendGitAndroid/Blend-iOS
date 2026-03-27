//
//  ViewController.m
//  01-换肤
//
//  Created by dream on 15/12/19.
//  Copyright © 2015年 dream. All rights reserved.
//

#import "ViewController.h"
#import "HMSkinTools.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *faceView;
@property (weak, nonatomic) IBOutlet UIImageView *heartView;
@property (weak, nonatomic) IBOutlet UIImageView *rectView;

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 启动时加载皮肤
    [self changeSkinWithSkinName:nil];
}

- (IBAction)redClick:(id)sender {
    
    // 切换皮肤
    [self changeSkinWithSkinName:@"red"];
}

- (IBAction)greenClick:(id)sender {
    // 切换皮肤
    [self changeSkinWithSkinName:@"green"];
}

- (IBAction)blueClick:(id)sender {
    // 切换皮肤
    [self changeSkinWithSkinName:@"blue"];
}

- (IBAction)orangeClick:(id)sender {
    // 切换皮肤
    [self changeSkinWithSkinName:@"orange"];
}

//抽取公用方法
- (void)changeSkinWithSkinName:(NSString *)skinName
{
    // 判断如果皮肤名称传了空, 那么不用管保存
    if (skinName != nil) {
        [HMSkinTools saveSkinName:skinName];
    }
    
    // 切换图像
    self.faceView.image = [HMSkinTools imageWithImageName:@"face"];
    self.heartView.image = [HMSkinTools imageWithImageName:@"heart"];
    self.rectView.image = [HMSkinTools imageWithImageName:@"rect"];
    
    // 切换文字颜色
    self.label.textColor = [HMSkinTools colorWithName:HMSkinToolLabelTextDayColor];
    
    // 切换背景颜色
    self.label.backgroundColor = [HMSkinTools colorWithName:HMSkinToolLabelBackgroundDayColor];
}

@end
