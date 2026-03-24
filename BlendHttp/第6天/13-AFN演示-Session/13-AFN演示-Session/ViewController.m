//
//  ViewController.m
//  13-AFN演示-Session
//
//  Created by Apple on 15/10/26.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"
#import "AFHTTPSessionManager.h"
@interface ViewController () <NSXMLParserDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //    [self download];
    [self getXML];
}

- (void)getXML {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 修改响应的序列化器，将服务器返回的xml数据解析成NSXMLParser对象
    manager.responseSerializer = [AFXMLParserResponseSerializer serializer];

    // JSON 相关
    // @"application/json"      // 标准JSON
    // @"text/json"            // 文本JSON

    // HTML 相关
    // @"text/html"            // HTML页面
    // @"application/xhtml+xml" // XHTML

    // XML 相关
    // @"application/xml"       // XML文档
    // @"text/xml"             // 文本XML

    // 图片相关
    // @"image/jpeg"           // JPEG图片
    // @"image/png"            // PNG图片

    // 其他
    // @"text/plain"           // 纯文本
    // @"text/javascript"      // JavaScript
    // @"application/octet-stream" // 二进制数据
    // 修改响应的序列化器的可接受的内容类型，默认是application/xml，如果服务器返回的不是xml数据，就会解析失败，调用failure
    manager.responseSerializer.acceptableContentTypes =
        [NSSet setWithObjects:@"application/json", @"text/json", @"text/html",
                              @"text/javascript", nil];

    [manager GET:@"http://127.0.0.1/videos.xml"
        parameters:nil
        success:^(NSURLSessionDataTask *_Nonnull task,
                  NSXMLParser *responseObject) {
          // 解析xml
          responseObject.delegate = self;
          [responseObject parse];
        }
        failure:^(NSURLSessionDataTask *_Nullable task,
                  NSError *_Nonnull error) {
          NSLog(@"%@", error);
        }];
}

// NSXMLParserDelegate 的代理方法

- (void)parserDidStartDocument:(NSXMLParser *)parser {
    NSLog(@"1 开始解析");
}

- (void)parser:(NSXMLParser *)parser
    didStartElement:(NSString *)elementName
       namespaceURI:(NSString *)namespaceURI
      qualifiedName:(NSString *)qName
         attributes:(NSDictionary<NSString *, NSString *> *)attributeDict {
    NSLog(@"2 开始节点 %@  %@", elementName, attributeDict);
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    NSLog(@"3 节点之间的内容 %@", string);
}

- (void)parser:(NSXMLParser *)parser
    didEndElement:(NSString *)elementName
     namespaceURI:(NSString *)namespaceURI
    qualifiedName:(NSString *)qName {
    NSLog(@"4 结束节点 %@", elementName);
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"5 结束解析");
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    NSLog(@"6 错误");
}

- (void)getBaidu {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 修改响应的序列化器,默认是AFJSONResponseSerializer,如果服务器返回的不是json数据，就会解析失败，调用failure
    // AFJSONResponseSerializer 会把服务器返回的json数据解析成字典
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    [manager GET:@"http://www.baidu.com"
        parameters:nil
        success:^(NSURLSessionDataTask *_Nonnull task,
                  id _Nonnull responseObject) {
          NSString *html = [[NSString alloc] initWithData:responseObject
                                                 encoding:NSUTF8StringEncoding];
          NSLog(@"%@", html);
        }
        failure:^(NSURLSessionDataTask *_Nullable task,
                  NSError *_Nonnull error) {
          NSLog(@"%@", error);
        }];
}

- (void)download {
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/abc.hm"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    // 进度
    NSProgress *progress = nil;
    [[[AFHTTPSessionManager manager] downloadTaskWithRequest:request
        progress:&progress
        destination:^NSURL *_Nonnull(NSURL *_Nonnull targetPath,
                                     NSURLResponse *_Nonnull response) {
          // targetPath : 临时文件的路径,下载完成后会删除这个文件
          NSLog(@"targetPath -- %@", targetPath);
          NSString *path = [[NSSearchPathForDirectoriesInDomains(
              NSCachesDirectory, NSUserDomainMask, YES) lastObject]
              stringByAppendingPathComponent:response.suggestedFilename];

          // 创建一个url，指向要保存文件的路径
          NSURL *url = [[NSURL alloc] initFileURLWithPath:path];

          // 返回要保存文件的路径
          return url;
        }
        completionHandler:^(NSURLResponse *_Nonnull response,
                            NSURL *_Nullable filePath,
                            NSError *_Nullable error) {
          // filePath : 下载完成后文件的路径
          NSLog(@"%@", filePath);
          // resume要手动调用，否则不会下载
        }] resume];

    // 监听进度变化，就是观察者模式，观察progress对象的属性变化
    // 观察progress的某个属性fractionCompleted（进度）是否发生变化
    // KVO (Key-Value Observing) 来监测 NSProgress 对象的进度变化
    [progress
        addObserver:self                         // 观察者是当前对象
         forKeyPath:@"fractionCompleted"         // 要监听的属性,范围是0.0-1.0
            options:NSKeyValueObservingOptionNew // 监听属性发生变化时，获取新值
            context:nil];                        // 上下文，传nil就行
}

// NSObject 已经实现了这个协议，这个方法名是苹果规定死的，不能改名！
// @protocol NSKeyValueObserving
// - (void)observeValueForKeyPath:(NSString *)keyPath
//                       ofObject:(id)object
//                         change:(NSDictionary<NSKeyValueChangeKey, id>
//                         *)change
//                        context:(void *)context;
// @end

// NSKeyValueObserving协议在Object中已经实现
// 监听属性发生变化时调用这个方法
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *, id> *)change
                       context:(void *)context {
    // 判断监听的属性和对象是否是我们要监听的
    if ([object isKindOfClass:[NSProgress class]]) {
        //        NSLog(@"%@",change);
        NSProgress *progress = object;
        NSLog(@"%@",
              progress.localizedDescription); // 下载的描述信息,输出示例："50%
                                              // completed"
        NSLog(
            @"%@",
            progress
                .localizedAdditionalDescription); // 下载的额外描述信息,输出示例："500
                                                  // KB of 1 MB"
        NSLog(
            @"completedUnitCount : %zd",
            progress.completedUnitCount); // 已经完成的单位数量,输出示例：500 KB
        NSLog(@"totalUnitCount : %zd",
              progress.totalUnitCount); // 总单位数量,输出示例：1 MB

        NSLog(@"fractionCompleted : %f",
              progress.fractionCompleted); // 下载的进度,输出示例：0.5

        // 这里在子线程上，需要回到主线程更新UI
        NSLog(@"%@", [NSThread currentThread]);
    }
}

- (void)post {
    //    [AFHTTPSessionManager manager] POST:<#(nonnull NSString *)#>
    //    parameters:<#(nullable id)#>
    //    constructingBodyWithBlock:<#^(id<AFMultipartFormData>  _Nonnull
    //    formData)block#> success:<#^(NSURLSessionDataTask * _Nonnull task, id
    //    _Nonnull responseObject)success#> failure:<#^(NSURLSessionDataTask *
    //    _Nullable task, NSError * _Nonnull error)failure#>
}

- (void)get {
    [[AFHTTPSessionManager manager] GET:@"http://127.0.0.1/demo.json"
        parameters:nil
        success:^(NSURLSessionDataTask *_Nonnull task,
                  id _Nonnull responseObject) {
          NSLog(@"%@", responseObject);
        }
        failure:^(NSURLSessionDataTask *_Nullable task,
                  NSError *_Nonnull error) {
          NSLog(@"%@", error);
        }];
}

@end
