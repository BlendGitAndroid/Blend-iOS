//
//  ViewController.m
//  08-模拟科技头条
//
//  Created by Apple on 15/10/20.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"
#import "HMNews.h"
#import "HMNewsCell.h"
@interface ViewController ()
@property(nonatomic, strong) NSArray *newsList;
@end

@implementation ViewController

- (void)setNewsList:(NSArray *)newsList {
    _newsList = newsList;

    // 等着加载完数据，重新刷新tableView
    [self.tableView reloadData];
    // 结束下拉刷新
    [self.refreshControl endRefreshing];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSLog(@"viewDidLoad");

    // 设置refreshControl的显示内容
    self.refreshControl.tintColor = [UIColor blueColor];
    // 用于设置刷新的文字颜色
    // NSForegroundColorAttributeName 是 Foundation 框架中定义的 字符串常量
    // ，用于设置富文本（Attributed String）的前景色（文字颜色）。
    self.refreshControl.attributedTitle = [[NSAttributedString alloc]
        initWithString:@"正在拼命加载..."
            attributes:@{NSForegroundColorAttributeName : [UIColor redColor]}];

    //    NSString *str;
    //    [str sizeWithAttributes:(nullable NSDictionary<NSString *,id> *)]

    // 开始下拉刷新
    // refreshControl 是 UIScrollView 的属性，而 UITableView 继承自 UIScrollView
    // ，所以 UITableViewController 可以直接使用。
    [self.refreshControl beginRefreshing];
    // 发送异步请求，获取数据
    [self loadNews];
}

// 发送异步请求获取数据 - 改进版
- (IBAction)loadNews {
    NSLog(@"📱 开始获取新闻数据...");

    [HMNews
        newsWithSuccess:^(NSArray<HMNews *> *newsList) {
          // 成功获取数据
          NSLog(@"✅ 成功获取 %ld 条新闻", newsList.count);
          self.newsList = newsList;

          // 打印第一条新闻的详细信息用于调试
          if (newsList.count > 0) {
              HMNews *firstNews = newsList.firstObject;
              NSLog(@"📰 第一条新闻: %@", firstNews.title);
              NSLog(@"🔥 热度: %@", firstNews.hot_value);
              NSLog(@"🏷️ 标签: %@ (%@)", firstNews.label, firstNews.label_desc);
          }
        }
        error:^(NSError *error) {
          // 错误处理 - 详细的错误信息
          NSLog(@"❌ 获取数据失败: %@", error.localizedDescription);
          NSLog(@"💡 错误原因: %@", error.localizedFailureReason);

          // 可以在这里添加用户提示，比如显示错误Alert
          dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertController *alert = [UIAlertController
                alertControllerWithTitle:@"网络错误"
                                 message:error.localizedFailureReason
                          preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction =
                [UIAlertAction actionWithTitle:@"确定"
                                         style:UIAlertActionStyleDefault
                                       handler:nil];
            [alert addAction:okAction];
            [self presentViewController:alert animated:YES completion:nil];
          });
        }];
}

// 数据源的方法
- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {
    return self.newsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1
    HMNews *news = self.newsList[indexPath.row];
    // 返回不同的可重用标示，判断模型的img属性是否有值
    HMNewsCell *cell = [tableView
        dequeueReusableCellWithIdentifier:[HMNewsCell getReuseID:news]];
    // 2
    cell.news = news;

    // 3
    return cell;
}

@end
