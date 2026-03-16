//
//  ViewController.m
//  02-XML
//
//  Created by Apple on 15/10/22.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSXMLParserDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self loadXML];
}

// 异步请求xml
- (void)loadXML {
    // 异步请求服务器的xml文件
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/videos.xml"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection
        sendAsynchronousRequest:request
                          queue:[NSOperationQueue new]
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
                    NSXMLParser *parser =
                        [[NSXMLParser alloc] initWithData:data];
                    // 设置代理
                    parser.delegate = self;
                    // 开始执行代理的方法，代理的方法中开始解析的
                    [parser parse];
                } else {
                    NSLog(@"服务器内部错误");
                }
              }];
}

// 代理方法执行  和 设置代理属性在同一个线程
// 代理的方法
// 1 开始解析文档
- (void)parserDidStartDocument:(NSXMLParser *)parser {
    NSLog(@"1 开始解析文档  %@", [NSThread currentThread]);
}
// 2 找开始节点
- (void)parser:(NSXMLParser *)parser
    didStartElement:(NSString *)elementName
       namespaceURI:(NSString *)namespaceURI
      qualifiedName:(NSString *)qName
         attributes:(NSDictionary<NSString *, NSString *> *)attributeDict {
    // elementName 节点的名称
    // attributeDict  标签的属性
    NSLog(@"2 找开始节点  %@--%@", elementName, attributeDict);
}

// 3 找节点之间的内容
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    //
    NSLog(@"3 找节点之间的内容 %@", string);
}

// 4 找结束节点
- (void)parser:(NSXMLParser *)parser
    didEndElement:(NSString *)elementName
     namespaceURI:(NSString *)namespaceURI
    qualifiedName:(NSString *)qName {
    // elementName 节点名称
    NSLog(@"4 找结束节点 %@", elementName);
}

// 5 结束解析文档
- (void)parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"5 结束解析文档");
}
// 6 解析出错
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    NSLog(@"出错");
}

@end
