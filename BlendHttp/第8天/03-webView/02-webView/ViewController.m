//
//  ViewController.m
//  02-webView
//
//  Created by Apple on 15/10/29.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate>
@property(nonatomic, strong) UIWebView *webView;
@end

@implementation ViewController
// loadView方法会在控制器的view被访问时调用，默认情况下会创建一个空白的view
- (void)loadView {
    // 在loadView方法中创建一个UIWebView，并将其设置为控制器的view
    self.webView =
        [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    // 将UIWebView设置为控制器的view，这样当控制器的view被访问时，就会显示UIWebView
    self.view = self.webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.backgroundColor = [UIColor whiteColor];

    // webview加载本地文件,html,pdf,doc,mp4等都可以
    // NSURL *url = [[NSBundle mainBundle] URLForResource:@"qixi.mp4"
    //                                   withExtension:nil];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"index.html"
                                         withExtension:nil];

    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];

    // 自动检测电话号码，网址，邮件地址
    // UIDataDetectorTypeAll 会自动检测所有类型的数据
    self.webView.dataDetectorTypes = UIDataDetectorTypeAll;
    // 缩放网页
    self.webView.scalesPageToFit = YES;

    // 让oc调用js的代码，遵守UIWebViewDelegate协议，设置代理
    self.webView.delegate = self;
}

// 代理方法

// 等待网页加载完成 才能执行js
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    // 这是 UIWebView 的一个方法，作用是在网页中执行一段 JavaScript
    // 代码，并返回执行结果。
    [webView stringByEvaluatingJavaScriptFromString:
                 @"game.chessboard.drawPlanes();"];
    NSString *str = [webView stringByEvaluatingJavaScriptFromString:@"test();"];
    NSLog(@"%@", str);
}

// 发送请求之前，   JS调用OC的代码
- (BOOL)webView:(UIWebView *)webView
    shouldStartLoadWithRequest:(NSURLRequest *)request
                navigationType:(UIWebViewNavigationType)navigationType {
    //    <a href="source:///showMessage:/helloworld">调用OC的方法</a>

    // 获取url中的协议
    NSLog(@"%@", request.URL.scheme);

    // 判断协议是否是自定义协议
    if ([request.URL.scheme isEqualToString:@"source"]) {

        NSLog(@"%@", request.URL.pathComponents);

        // 方法名
        NSString *methodName = request.URL.pathComponents[1];
        // 参数
        NSString *param = request.URL.pathComponents[2];

        // 调用方法
        // 把字符串的方法名称 转换成一个selector
        // 把字符串 "showMessage:" 转成 SEL 类型（方法选择器）
        SEL method = NSSelectorFromString(methodName);
        // 检查 self 是否有这个方法，防止崩溃
        if ([self respondsToSelector:method]) {
            // 抑制编译器警告
            // 因为 performSelector:
            // 是动态调用，编译器不知道这个方法的返回值类型，无法判断是否需要管理内存（ARC
            // 下可能内存泄漏）
            //  🔇 关掉这个警告
            //      执行代码
            // 🔊 重新打开警告
            // clang 是苹果使用的 C/OC/Swift
            // 编译器，diagnostic是"诊断信息"的意思。 所以 clang diagnostic 就是
            // 编译器的诊断系统，负责在编译时给你报： ⚠️ Warning（警告） ❌
            // Error（错误）
            // #pragma 是一个预处理指令，意思是"给编译器下达一个特殊指令"。
            // pragma 这个词来自希腊语 pragmatikos，意思是"实用的指示"
            // # 表示这是预处理指令（和 #import、#define 一样）
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            // 调用方法
            // 反射调用：运行时才知道调用哪个方法（方法名是字符串变量）
            [self performSelector:method withObject:param];
#pragma mark diagnostic pop
        }

        return NO;
    }

    // 返回no，所有的请求都不执行
    //    return NO;
    return YES;
}

// 执行showMessage方法
- (void)showMessage:(NSString *)str {
    UIAlertController *vc = [UIAlertController
        alertControllerWithTitle:@"js调用OC的方法"
                         message:str
                  preferredStyle:UIAlertControllerStyleAlert];

    // 弹出的按钮
    UIAlertAction *action =
        [UIAlertAction actionWithTitle:@"确定"
                                 style:UIAlertActionStyleDestructive
                               handler:^(UIAlertAction *_Nonnull action) {
                                 NSLog(@"clicker");
                               }];

    [vc addAction:action];

    [self presentViewController:vc animated:YES completion:nil];
}

@end
