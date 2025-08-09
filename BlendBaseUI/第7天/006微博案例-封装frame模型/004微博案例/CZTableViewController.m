//
//  CZTableViewController.m
//  004微博案例
//
//  Created by apple on 15/3/2.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZTableViewController.h"
#import "CZWeibo.h"
#import "CZWeiboCell.h"
#import "CZWeiboFrame.h"

@interface CZTableViewController ()

// 现在要求weiboFrames集合中保存的很多个CZWeiboFrame模型，不再是CZWeibo模型了。
// 这个frame模型负责计算和存储cell的frame, 而不是cell的数据模型
@property (nonatomic, strong) NSArray *weiboFrames;
@end

@implementation CZTableViewController

#pragma mark - 懒加载数据
- (NSArray *)weiboFrames
{
    if (_weiboFrames == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"weibos.plist" ofType:nil];
        
        NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *arrayModels = [NSMutableArray array];
        
        for (NSDictionary *dict in arrayDict) {
            // 创建一个数据模型
            CZWeibo *model = [CZWeibo weiboWithDict:dict];
            
            // 创建一个frame 模型
            // 创建了一个空得frame模型
            CZWeiboFrame *modelFrame = [[CZWeiboFrame alloc] init];
            
            // 把数据模型赋值给了modeFrame模型中的weibo属性
            modelFrame.weibo = model;
            
            
            [arrayModels addObject:modelFrame];
        }
        _weiboFrames = arrayModels;
    }
    return _weiboFrames;
}



- (void)viewDidLoad {
    [super viewDidLoad];

    // 统一设置行高
    //self.tableView.rowHeight = 300;
    
//    NSLog(@"%@", self.view);
//    NSLog(@"%@", self.tableView);
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



#pragma mark - Table view 数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {


    return self.weiboFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    // 1. 获取模型数据
    CZWeiboFrame *frameModel = self.weiboFrames[indexPath.row];

    
    // 2. 创建单元格
    CZWeiboCell *cell = [CZWeiboCell weiboCellWithTableView:tableView];
    

    // 3. 设置单元格数据
    cell.weiboFrame = frameModel;
    
    // 4. 返回单元格
    return cell;
}



#pragma mark - Table view 代理方法

// 返回每行的行高的方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CZWeiboFrame *weiboFrame = self.weiboFrames[indexPath.row];
    return weiboFrame.rowHeight;
}


- (BOOL)prefersStatusBarHidden
{
    return YES;
}


@end











