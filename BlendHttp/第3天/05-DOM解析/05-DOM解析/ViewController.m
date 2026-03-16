//
//  ViewController.m
//  05-DOM解析
//
//  Created by Apple on 15/10/22.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"
#import "GDataXMLNode.h"
#import "Video.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self loadXML];
}

- (void)loadXML {
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
                    // DOM 文档对象模型
                    // 1  加载xml文档
                    GDataXMLDocument *document =
                        [[GDataXMLDocument alloc] initWithData:data error:NULL];

                    // 获取xml文档的根元素（标签）
                    GDataXMLElement *rootElement = document.rootElement;

                    //            NSLog(@"%@",rootElement);

                    NSMutableArray *mArray =
                        [NSMutableArray arrayWithCapacity:10];
                    // 2 遍历所有的video节点
                    for (GDataXMLElement *element in rootElement.children) {
                        // 创建对象
                        Video *v = [[Video alloc] init];
                        [mArray addObject:v];

                        // 给对象的属性赋值
                        // 3 遍历video的子标签
                        for (GDataXMLElement *subElement in element.children) {
                            // 给属性赋值
                            [v setValue:subElement.stringValue
                                 forKey:subElement.name];
                        }
                        // 4 遍历video的所有属性

                        //                NSLog(@"%@",element.attributes);
                        for (GDataXMLNode *attr in element.attributes) {
                            [v setValue:attr.stringValue forKey:attr.name];
                        }
                    }
                    NSLog(@"%@", mArray);

                } else {
                    NSLog(@"服务器内部错误");
                }
              }];
}

@end
