//
//  ViewController.m
//  05-异步下载网络图片
//
//  Created by Apple on 15/10/16.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"
#import "HMAppInfo.h"
#import "HMAppInfoCell.h"
#import "NSString+Sandbox.h"
@interface ViewController ()
@property(nonatomic, strong) NSArray *appInfos;

// 全局队列
@property(nonatomic, strong) NSOperationQueue *queue;

// 图片的缓存池
@property(nonatomic, strong) NSMutableDictionary *imageCache;

// 下载操作缓存池
@property(nonatomic, strong) NSMutableDictionary *downloadCache;
@end

// 1 创建模型类，获取数据，测试

// 2 数据源方法

// 3 同步下载图片--如果网速比较慢，界面会卡顿

// 4 异步下载图片--图片显示不出来，点击cell或者上下拖动图片可以显示
// cell内部的控件都是懒加载的，当返回当前cell的时候，会调用cell的layoutSubViews方法，因为imageView是异步的，当返回cell的时候，image控件还没被加载
// 解决：使用占位图片

// 5 图片缓存--把网络上下载的图片，保存到内存--图片存储在模型对象中
// 解决，图片重复下载，把图片缓存到内存中，节省用户的流量 （拿空间换取执行时间）

// 6 解决图片下载速度特别慢，出现的错行问题。
// 当图片下载完成之后，重新加载对应的cell,cell重用导致图片加载不一致
// 解决：解决图片显示错行，使用[self.tableView reloadRowsAtIndexPaths:@[
// indexPath]withRowAnimation:UITableViewRowAnimationNone];
// 解决：当图片下载完成之后，重新加载对应的cell,cell重用导致图片加载不一致

// 7
// 当收到内存警告，要清理内存，如果图片存储在模型对象中，不好清理内存，需要使用缓存池
// 图片的缓存池

// 8 当有些图片下载速度比较慢，上下不停滚动的时候，会重复下载图片，会浪费流量
// 判断当前是否有对应图片的下载操作，如果没有添加下载操作，如果有不要重复创建操作
// 下载操作的缓存池

// 9 分析是否有循环引用的问题
// block里面有self就得小心了，看是否有循环引用
// vc -> queue 和 downloadCache ->  op  -> block  -> self(vc)

// 10 如果没有联网的话，返回cell的方法会不停执行。
// 判断下载的图片是否为空，也就是判断img是否为空

// 11 沙盒缓存

@implementation ViewController
// 懒加载
- (NSArray *)appInfos {
    if (_appInfos == nil) {
        _appInfos = [HMAppInfo appInfos];
    }
    return _appInfos;
}

- (NSOperationQueue *)queue {
    if (_queue == nil) {
        _queue = [NSOperationQueue new];
    }
    return _queue;
}

- (NSMutableDictionary *)imageCache {
    if (_imageCache == nil) {
        _imageCache = [NSMutableDictionary dictionaryWithCapacity:10];
    }
    return _imageCache;
}

- (NSMutableDictionary *)downloadCache {
    if (_downloadCache == nil) {
        _downloadCache = [NSMutableDictionary dictionaryWithCapacity:10];
    }
    return _downloadCache;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 1 测试模型数据
    //    NSLog(@"%@",self.appInfos);
}

// 2 数据源方法, UI视图继承自
- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {
    return self.appInfos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1 创建可重用的cell
    static NSString *reuseId = @"appInfo";
    HMAppInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];

    // 2 获取数据，给cell内部子控件赋值
    HMAppInfo *appInfo = self.appInfos[indexPath.row];

    // 设置文本内容
    cell.appInfo = appInfo;

    // 判断有没有图片缓存
    if (self.imageCache[appInfo.icon]) {
        NSLog(@"从缓存加载图片...");
        cell.iconView.image = self.imageCache[appInfo.icon];
        return cell;
    }

    // 设置占位图片，解决第一次加载图片看不到的问题
    cell.iconView.image = [UIImage imageNamed:@"user_default"];

    // 检查沙盒缓存中是否有图片
    NSData *data = [NSData dataWithContentsOfFile:[appInfo.icon appendCache]];
    if (data) {
        UIImage *img = [UIImage imageWithData:data];
        // 缓存到内存
        self.imageCache[appInfo.icon] = img;
        //
        cell.iconView.image = img;
        NSLog(@"从沙盒加载图片...");
        return cell;
    }

    // 异步下载图片
    [self downloadImage:indexPath];
    // 3 返回cell
    return cell;
}

// 异步下载图片
- (void)downloadImage:(NSIndexPath *)indexPath {

    HMAppInfo *appInfo = self.appInfos[indexPath.row];

    // 判断下载操作缓存池 中是否有对应的操作
    if (self.downloadCache[appInfo.icon]) {
        NSLog(@"正在拼命下载图片...");
        return;
    }

    // 异步下载图片
    // 模拟网速比较慢
    //     __weak typeof(self) weakSelf = self;
    // 下载操作
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
      //        [NSThread sleepForTimeInterval:0.5];
      // 模拟图片下载速度慢
      if (indexPath.row > 9) {
          //          [NSThread sleepForTimeInterval:5];
      }

      // 下载图片
      NSLog(@"下载网络图片...");

      NSURL *url = [NSURL URLWithString:appInfo.icon];
      NSData *data = [NSData dataWithContentsOfURL:url];
      UIImage *img = [UIImage imageWithData:data];

      // 把图片保存到沙盒中
      if (img) {
          // appendCache是调用的分类
          [data writeToFile:[appInfo.icon appendCache] atomically:YES];
      }

      // 主线程上更新UI
      [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        // 如果图片不为空，才执行。如果图片为空，会不停的返回cell
        // img为空，说明下载失败，不执行任何操作
        if (img) {
            // 线程不安全的，在主线程上执行
            // 缓存图片
            self.imageCache[appInfo.icon] = img;
            // 移除下载操作缓存池
            [self.downloadCache removeObjectForKey:appInfo.icon];

            //            cell.imageView.image = img;
            // 解决图片显示错行
            [self.tableView reloadRowsAtIndexPaths:@[ indexPath ]
                                  withRowAnimation:UITableViewRowAnimationNone];
        }
      }];
    }];

    // 把操作添加到队列中
    [self.queue addOperation:op];
    // 把操作添加到下载操作缓存池中
    self.downloadCache[appInfo.icon] = op;
}

// 接收到内存警告
- (void)didReceiveMemoryWarning {
    // 清理内存
    [self.imageCache removeAllObjects];
    // 清理下载操作缓存池
    [self.downloadCache removeAllObjects];
}

- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 点击cell的时候，输出当前队列的操作数
    NSLog(@"队列的操作数：%zd", self.queue.operationCount);
}

// 如果有循环引用，则这个界面就不会被释放，也就不会调用dealloc方法
- (void)dealloc {
    NSLog(@"dealloc");
}

@end
