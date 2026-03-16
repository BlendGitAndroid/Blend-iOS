//
//  ViewController.m
//  02-XML
//
//  Created by Apple on 15/10/22.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"
#import "Video.h"
@interface ViewController () <NSXMLParserDelegate>
@property(nonatomic, strong) NSMutableArray *videos;
// 当前创建的video对象
@property(nonatomic, strong) Video *currentVideo;
// 存储当前节点的内容
@property(nonatomic, copy) NSMutableString *mString;
@end

@implementation ViewController
// 懒加载
- (NSMutableArray *)videos {
    if (_videos == nil) {
        _videos = [NSMutableArray arrayWithCapacity:10];
    }
    return _videos;
}

- (NSMutableString *)mString {
    if (_mString == nil) {
        _mString = [NSMutableString string];
    }
    return _mString;
}

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

    // 如果是video标签，创建video对象
    if ([elementName isEqualToString:@"video"]) {
        self.currentVideo = [[Video alloc] init];
        self.currentVideo.videoId = @([attributeDict[@"videoId"] intValue]);

        // 添加到数组中
        [self.videos addObject:self.currentVideo];
    }
}

// 3 找节点之间的内容
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    //
    NSLog(@"3 找节点之间的内容 %@", string);
    // 拼接字符串
    [self.mString appendString:string];
}

// 4 找结束节点
- (void)parser:(NSXMLParser *)parser
    didEndElement:(NSString *)elementName
     namespaceURI:(NSString *)namespaceURI
    qualifiedName:(NSString *)qName {
    // elementName 节点名称
    NSLog(@"4 找结束节点 %@", elementName);

    // 判断标签是否是对应的属性
    if (![elementName isEqualToString:@"video"] &&
        ![elementName isEqualToString:@"videos"]) {
        // self.currentVideo.length =
        // kvc 赋值的过程就是地址指向的过程，不会做类型转换
        // KVC 赋值实际上是指针赋值，不是值拷贝
        [self.currentVideo setValue:self.mString forKey:elementName];
    }

    // 清空可变字符串
    [self.mString setString:@""];
}

// 5 结束解析文档
- (void)parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"5 结束解析文档");
    NSLog(@"%@", self.videos);
}
// 6 解析出错
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    NSLog(@"出错");
}

@end
