//
//  BLueViewController.m
//  01-modal(代码)
//
//  Created by swcheng on 15/12/6.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "BLueViewController.h"

@interface BLueViewController ()

@end

@implementation BLueViewController

// storyboard模式下消失还是得代码
- (IBAction)dismiss:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
