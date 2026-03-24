//
//  ViewController.m
//  11-https
//
//  Created by Apple on 15/10/26.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSURLSessionTaskDelegate>
@property(nonatomic, strong) NSURLSession *session;
@end

@implementation ViewController

- (NSURLSession *)session {
    if (_session == nil) {

        NSURLSessionConfiguration *config =
            [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:config
                                                 delegate:self
                                            delegateQueue:nil];

        //        _session = [NSURLSession sessionWithConfiguration:config];
    }
    return _session;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // https://kyfw.12306.cn/otn/
    NSURL *url = [NSURL URLWithString:@"https://kyfw.12306.cn/otn/"];

    [[self.session dataTaskWithURL:url
                 completionHandler:^(NSData *_Nullable data,
                                     NSURLResponse *_Nullable response,
                                     NSError *_Nullable error) {
                   NSString *html =
                       [[NSString alloc] initWithData:data
                                             encoding:NSUTF8StringEncoding];
                   NSLog(@"%@", html);
                 }] resume];
}

// 代理的方法

// 接受服务器的挑战，信任服务器，这里是无条件信任服务器，属于不安全的做法
// challenge - 包含身份验证挑战信息
// completionHandler - 回调，告诉系统如何处理挑战
- (void)URLSession:(NSURLSession *)session
    didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge
      completionHandler:
          (void (^)(NSURLSessionAuthChallengeDisposition,
                    NSURLCredential *_Nullable))completionHandler {
    // 判断服务器的挑战是否是服务器信任,authenticationMethod 的可能值：
    // 常见的身份验证方法：
    // NSURLAuthenticationMethodServerTrust    // 服务器证书信任
    // NSURLAuthenticationMethodHTTPBasic      // HTTP 基本认证
    // NSURLAuthenticationMethodHTTPDigest     // HTTP 摘要认证
    // NSURLAuthenticationMethodNTLM          // NTLM 认证
    // NSURLAuthenticationMethodNegotiate     // 协商认证
    if (challenge.protectionSpace.authenticationMethod ==
        NSURLAuthenticationMethodServerTrust) {
        // 基于服务器提供的证书创建一个信任凭证
        NSURLCredential *credential = [NSURLCredential
            credentialForTrust:challenge.protectionSpace.serverTrust];
        // 完成回调，告诉系统信任服务器
        // 0 对应 NSURLSessionAuthChallengeUseCredential - 使用提供的凭证
        // credential - 要使用的凭证
        // NSURLSessionAuthChallengeDisposition 的值
        // typedef NS_ENUM(NSInteger, NSURLSessionAuthChallengeDisposition) {
        //     NSURLSessionAuthChallengeUseCredential = 0,        // 使用凭证（信任）
        //     NSURLSessionAuthChallengePerformDefaultHandling,  // 执行默认处理
        //     NSURLSessionAuthChallengeCancelAuthenticationChallenge, // 取消认证 
        //     NSURLSessionAuthChallengeRejectProtectionSpace     // 拒绝保护空间
        // };
        completionHandler(0, credential);
    }
}

@end
