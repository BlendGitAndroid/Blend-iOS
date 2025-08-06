//
//  ViewController.m
//  001团购案例
//
//  Created by apple on 15/3/2.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "CZGoods.h"
#import "CZGoodsCell.h"
#import "CZFooterView.h"
#import "CZHeaderView.h"

// 这里自定义了Delegate
@interface ViewController () <UITableViewDataSource, CZFooterViewDelegate>

// 用来存储所有的团购商品的数据
@property (nonatomic, strong) NSMutableArray *goods;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController


#pragma mark - 懒加载数据
- (NSMutableArray *)goods
{
    if (_goods == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil];
        NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayModels = [NSMutableArray array];
        for (NSDictionary *dict in arrayDict) {
            CZGoods *model = [CZGoods goodsWithDict:dict];
            [arrayModels addObject:model];
        }
        _goods = arrayModels;
    }
    return _goods;
}

#pragma mark - 数据源方法
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.goods.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1. 获取模型数据
    CZGoods *model = self.goods[indexPath.row];
    
    // 2. 创建单元格
    // 通过xib的方式来创建单元格
    CZGoodsCell *cell = [CZGoodsCell goodsCellWithTableView:tableView];
   
    
    // 3. 把模型数据设置给单元格
    // 在控制器中直接为cell的每个子控件赋值数据造成的问题：
    // 1. 控制器强依赖于Cell, 一旦cell内部的子控件发生了变化, 那么控制器中的代码也得改（这就造成了紧耦合）
    // 2. cell的封装不够完整, 凡是用到这个cell的地方, 每次都要编写为cell的子控件依次赋值的语句，比如：cell.xxx = model.title;
    // 3. 解决: 直接把模型传递给自定义Cell, 然后在自定义cell内部解析model中的数据赋值给自定义cell内部的子控件。
    cell.goods = model;
    
    // 4.返回单元格
    return cell;
}



#pragma mark - 隐藏状态栏
- (BOOL)prefersStatusBarHidden
{
    return YES;
}





- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 44;
    
    // 设置UITableView的footerView
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
//    
//    btn.backgroundColor = [UIColor redColor];
//    btn.frame = CGRectMake(20, 50, 30, 100);
//    // tableView的footerView的特点: 只能修改x和height的值, Y 和 width不能改。
//    self.tableView.tableFooterView = btn;
    
    
    
    // 通过Xib设置UITableView的footerView
    CZFooterView *footerView = [CZFooterView footerView];
    // 设置footerView的代理
    footerView.delegate = self;
    self.tableView.tableFooterView = footerView;
    
    
    // 创建Header View
    CZHeaderView *headerView = [CZHeaderView headerView];
    self.tableView.tableHeaderView = headerView;
    
    
    
    
    
}

#pragma mark - CZFooterView的代理方法

- (void)footerViewUpdateData:(CZFooterView *)footerView
{
    // 3. 增加一条数据
   
    
    // 3.1 创建一个模型对象
    CZGoods *model = [[CZGoods alloc] init];
    model.title = @"驴肉火烧";
    model.price = @"6.0";
    model.buyCount = @"1000";
    model.icon = @"37e4761e6ecf56a2d78685df7157f097";
    
    // 3.2 把模型对象加到控制器的goods集合当中
    [self.goods addObject:model];
    
    // 4. 刷新UITableView
    [self.tableView reloadData];
    
//    // 局部刷新(只适用于UITableView总行数没有发生变化的情况)
//    NSIndexPath *idxPath = [NSIndexPath indexPathForRow:self.goods.count - 1 inSection:0];
//    [self.tableView reloadRowsAtIndexPaths:@[idxPath] withRowAnimation:UITableViewRowAnimationLeft];
    
    
    // 5. 把UITableView中的最后一行的数据滚动到最上面，即每次都显示的最新一行
     NSIndexPath *idxPath = [NSIndexPath indexPathForRow:self.goods.count - 1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:idxPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
