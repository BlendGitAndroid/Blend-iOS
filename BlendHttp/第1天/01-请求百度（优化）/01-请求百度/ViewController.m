//
//  ViewController.m
//  01-请求百度
//
//  Created by Apple on 15/10/19.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    NSLog(@"viewDidLoad");
    
    //发送请求
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    //请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //发送异步请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue  mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        //response  服务器返回的响应头
        //data      服务器返回的响应体
        //connectionError  连接错误
        //判断请求是否有错误
        if (!connectionError) {
            //把二进制数据转换成NSString
            NSString *html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",html);
            
            //webView加载html
            [self.webView loadHTMLString:html baseURL:nil];
        }else{
            NSLog(@"连接错误 %@",connectionError);
        }
        
        //编码的故事
        //ASCII
        //a --> 97
        //b --> 98
        
        //GB2312
        //中 --> 0x2312
        
        //GBK
        
        //GB18030
        
        //BIG5
        
        
        //Unicode-->UTF-8
    }];
}



@end
