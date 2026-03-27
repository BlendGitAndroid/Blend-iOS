//
//  HMOneViewController.m
//  01-换肤
//
//  Created by dream on 15/12/19.
//  Copyright © 2015年 dream. All rights reserved.
//

#import "HMOneViewController.h"
#import "HMSkinTools.h"

@interface HMOneViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *rectView;
@property (weak, nonatomic) IBOutlet UIImageView *faceView;
@property (weak, nonatomic) IBOutlet UIImageView *heartView;

@end

@implementation HMOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.faceView.image = [HMSkinTools imageWithImageName:@"face"];
    self.heartView.image = [HMSkinTools imageWithImageName:@"heart"];
    self.rectView.image = [HMSkinTools imageWithImageName:@"rect"];

}

@end
