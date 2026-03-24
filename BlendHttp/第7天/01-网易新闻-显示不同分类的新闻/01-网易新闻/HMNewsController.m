//
//  HMNewsController.m
//  01-网易新闻
//
//  Created by Apple on 15/10/28.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import "HMNewsController.h"
#import "HMNews.h"
#import "HMNewsCell.h"
@interface HMNewsController ()
@property (nonatomic, strong) NSArray *newsList;
@end

@implementation HMNewsController

- (void)setNewsList:(NSArray *)newsList {
    _newsList = newsList;
    //重新加载tableview
    [self.tableView reloadData];
}

//当获取到新闻地址之后。发送请求
- (void)setUrlString:(NSString *)urlString {
    self.newsList = nil;
    //异步加载数据
    [HMNews newsListWithURLString:urlString successBlock:^(NSArray *array) {
        self.newsList = array;
        
    } errorBlock:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //1
    HMNews *news = self.newsList[indexPath.row];
    HMNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:[HMNewsCell getReuseId:news]];
    //2
    cell.news = news;
    //3
    return cell;
}

//返回不同行的行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    HMNews *news = self.newsList[indexPath.row];
    return [HMNewsCell getRowHeight:news];
}

@end
