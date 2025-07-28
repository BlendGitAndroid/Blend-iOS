//
//  ViewController.m
//  01加法计算器
//
//  Created by apple on 15/2/5.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "ViewController.h"

// 类扩展
@interface ViewController ()


- (IBAction)compute;

// 表示第一个文本框
@property (weak, nonatomic) IBOutlet UITextField *txtNum1;

// 第二个文本框
@property (weak, nonatomic) IBOutlet UITextField *txtNum2;

// 显示结果的Label
@property (weak, nonatomic) IBOutlet UILabel *lblResult;


// 减法的声明
- (IBAction)jianfa;

// 显示减法的第一个文本框
@property (weak, nonatomic) IBOutlet UITextField *textNum3;

// 显示减法的第二个文本框
@property (weak, nonatomic) IBOutlet UITextField *textNum4;

@property (weak, nonatomic) IBOutlet UILabel *jianfaResult;


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




// 点击计算按钮
- (IBAction)compute {
    // 实现计算功能
    // 1. 获取用户的输入
    NSString *num1 = self.txtNum1.text;
    NSString *num2 = self.txtNum2.text;
    
    // 将NSString转换为int的两种方式
    int n1 = [num1 intValue];
    int n2 = num2.intValue;
    
    
    
    // 2. 计算和
    int result = n1 + n2;
    
    // 3. 把结果显示到结果Label上
    self.lblResult.text = [NSString stringWithFormat:@"%d", result];
    
    
//    // 4. 把键盘叫回去
//    // 谁叫出的键盘, 那么谁就是"第一响应者", 让"第一响应者"辞职, 就可以把键盘叫回去
//    [self.txtNum2 resignFirstResponder];
//    [self.txtNum1 resignFirstResponder];
    
    // 5. 把键盘叫回去的第二种做法
    // self.view就表示是当前控制器所管理的那个view（每一个控制器都会管理一个view）
    // 这时把键盘叫回去的思路就是：让控制器所管理的view停止编辑，这样的话, 凡是这个view中的子控件叫出的键盘就都回去了。
    [self.view endEditing:YES];
}
- (IBAction)jianfa {
    
    NSString *num3 = self.textNum3.text;
    NSString *num4 = self.textNum4.text;
    
    int n3 = num3.intValue;
    int n4 = [num4 intValue];
    
    int result = n3 - n4;
    self.jianfaResult.text = [NSString stringWithFormat:@"%d", result];
    
    [self.view endEditing:YES];
}
@end









