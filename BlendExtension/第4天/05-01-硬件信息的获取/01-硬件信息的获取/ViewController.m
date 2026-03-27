//
//  ViewController.m
//  01-硬件信息的获取
//
//  Created by dream on 15/12/17.
//  Copyright © 2015年 dream. All rights reserved.
//

#import "ViewController.h"
#import "SystemServices.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1. 创建SystemServices对象 --> 单例对象
    SystemServices *sys = [SystemServices sharedServices];
    
    //2. 获取对应的值
    self.textView.text = sys.allSystemInformation.description;

}


@end
