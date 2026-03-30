//
//  ViewController.m
//  05-指纹识别
//
//  Created by Romeo on 15/9/25.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //1. 判断系统版本
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        //可以使用指纹识别 --> 5S 以后的机型
        
        //2. 判断时候可以使用指纹识别功能
        
        //2.1 创建 LA 对象上下文
        LAContext *context = [[LAContext alloc] init];
        
        //2.2 判断是否能否使用
        //Evaluate: 评估
        //Policy: 策略
        //LAPolicyDeviceOwnerAuthenticationWithBiometrics : 可以使用指纹识别技术
        if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:nil]) {
            // 可以使用
            
            //3. 开始启用指纹识别
            //localizedReason : 显示在界面上的原因, 一般用于提示用户, 为什么要使用此功能
            [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"请验证指纹, 以打开高级隐藏功能" reply:^(BOOL success, NSError * _Nullable error) {
                
                //判断是否成功
                if (success) {
                    
                    
                    //4. 指纹识别在更新 UI 时, 一定要注意, 在主线程更新
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"这是标题" message:@"你成功了" preferredStyle:UIAlertControllerStyleAlert];
                        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
                        [self presentViewController:alert animated:YES completion:nil];
                    });
                    
                } else {
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"这是标题" message:@"验证失败" preferredStyle:UIAlertControllerStyleAlert];
                        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
                        [self presentViewController:alert animated:YES completion:nil];
                    });
                }
                
                // 判断错误 如果需要区分不同的错误来提示用于, 必须判断 error
                if (error) {
                    NSLog(@"error Code: %ld",error.code);
                    NSLog(@"error : %@",error.userInfo);
                }
                
            }];
            
        } else {
            NSLog(@"对不起, 5S 以上机型才能使用此功能, 请卖肾后重拾");
        }
        
    } else {
        NSLog(@"对不起, 系统版本过低");
    }
}

@end
