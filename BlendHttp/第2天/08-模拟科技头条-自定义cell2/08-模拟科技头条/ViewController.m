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
    self.refreshControl.attributedTitle = [[NSAttributedString alloc]
        initWithString:@"正在拼命加载..."
            attributes:@{NSForegroundColorAttributeName : [UIColor redColor]}];

    //    NSString *str;
    //    [str sizeWithAttributes:(nullable NSDictionary<NSString *,id> *)]

    [self.refreshControl beginRefreshing];
    // 发送异步请求，获取数据
    [self loadNews];
}

// 发送异步请求获取数据
- (IBAction)loadNews {
    NSLog(@"获取数据中");

    [HMNews
        newsWithSuccess:^(NSArray *array) {
          self.newsList = array;
          NSLog(@"获取数据");
        }
        error:^{
          NSLog(@"获取数据出错");
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
