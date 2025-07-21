//
//  ViewController.m
//  01-QQ作业
//
//  Created by apple on 15/2/6.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)login;
@property (weak, nonatomic) IBOutlet UITextField *txtQQ;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login {
    NSString *qq = self.txtQQ.text;
    NSString *pwd = self.txtPassword.text;
    
    NSLog(@"QQ: %@, 密码: %@", qq, pwd);
    
    [self.view endEditing:YES];
}
@end
