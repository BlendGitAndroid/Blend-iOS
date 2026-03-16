//
//  ViewController.m
//  08-模拟登陆
//
//  Created by Apple on 15/10/22.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(weak, nonatomic) IBOutlet UITextField *nameView;
@property(weak, nonatomic) IBOutlet UITextField *pwdView;

@end

@implementation ViewController
// 点击登陆
- (IBAction)loginClick:(id)sender {
    NSString *name = self.nameView.text;
    NSString *pwd = self.pwdView.text;

    [self login:name pwd:pwd];
}
// 登陆
- (void)login:(NSString *)name pwd:(NSString *)pwd {
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/php/login.php"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // 设置post
    request.HTTPMethod = @"post";

    // 对密码进行“加密”
    pwd = [self base64Encode:pwd];

    NSLog(@"%@", pwd);

    // 设置请求体
    NSString *body =
        [NSString stringWithFormat:@"username=%@&password=%@", name, pwd];
    request.HTTPBody = [body dataUsingEncoding:NSUTF8StringEncoding];

    [NSURLConnection
        sendAsynchronousRequest:request
                          queue:[NSOperationQueue mainQueue]
              completionHandler:^(NSURLResponse *_Nullable response,
                                  NSData *_Nullable data,
                                  NSError *_Nullable connectionError) {
                if (connectionError) {
                    NSLog(@"连接错误 %@", connectionError);
                    return;
                }

                //
                NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                if (httpResponse.statusCode == 200 ||
                    httpResponse.statusCode == 304) {
                    // 解析数据
                    NSDictionary *dic =
                        [NSJSONSerialization JSONObjectWithData:data
                                                        options:0
                                                          error:NULL];
                    // 判断登陆成功，还是失败
                    if ([dic[@"userId"] intValue] > 0) {
                        NSLog(@"登陆成功");

                        // 登陆成功之后，把账号和密码记录到沙盒中
                        [self saveUserInfo];
                    } else {
                        NSLog(@"登陆失败");
                    }

                } else {
                    NSLog(@"服务器内部错误");
                }
              }];
}

#define kHMUSERNAMEKEY @"name"
#define kHMPASSWORDKEY @"pwd"

// 登陆成功之后，把账号和密码记录到沙盒中（偏好设置）
- (void)saveUserInfo {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

    [userDefaults setObject:self.nameView.text forKey:kHMUSERNAMEKEY];
    [userDefaults setObject:[self base64Encode:self.pwdView.text]
                     forKey:kHMPASSWORDKEY];

    // 立即保存
    [userDefaults synchronize];
}

// 当重新加载应用，读取沙盒中的用户信息
- (void)loadUserInfo {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    self.nameView.text = [userDefaults objectForKey:kHMUSERNAMEKEY];
    NSString *pwd = [userDefaults objectForKey:kHMPASSWORDKEY];

    //"解密"
    pwd = [self base64Decode:pwd];
    self.pwdView.text = pwd;
}

// base64 “加密”密码     无论是编码解码还是加密解密 都是直接操作的二进制数据
- (NSString *)base64Encode:(NSString *)str {
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:0];
}
// base64 "解密"密码
- (NSString *)base64Decode:(NSString *)str {
    // base64解码
    NSData *data = [[NSData alloc] initWithBase64EncodedString:str options:0];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadUserInfo];
}

@end
