//
//  CZQQFriendsTableViewController.m
//  002好友列表
//
//  Created by apple on 15/3/6.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZQQFriendsTableViewController.h"
#import "CZGroup.h"
#import "CZFriend.h"
#import "CZFriendCell.h"
#import "CZGroupHeaderView.h"

@interface CZQQFriendsTableViewController () <CZGroupHeaderViewDelegate>

// 保存所有的朋友信息（分组信息）
@property (nonatomic, strong) NSArray *groups;
@property (nonatomic, strong) CZGroupHeaderView *HeaderView;
@end

@implementation CZQQFriendsTableViewController

#pragma mark - *********** 懒加载 ***********
- (NSArray *)groups
{
    if (_groups == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil];
        NSArray *arrayDicts = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *arrayModels = [NSMutableArray array];
        for (NSDictionary *dict in arrayDicts) {
            CZGroup *model = [CZGroup groupWithDict:dict];
            [arrayModels addObject:model];
        }
        _groups = arrayModels;
        
    }
    return _groups;
}


#pragma mark - *********** CZGroupHeaderViewDelegate的代理方法 ***********
- (void)groupHeaderViewDidClickTitleButton:(CZGroupHeaderView *)groupHeaderView
{
    // 刷新table view
    //[self.tableView reloadData];
    
    // 局部刷新(只刷新某个组)
    // 创建一个用来表示某个组的对象
    NSIndexSet *idxSet = [NSIndexSet indexSetWithIndex:groupHeaderView.tag];
    
    if (self.tableView.style == UITableViewStyleGrouped && groupHeaderView.tag == 0) {
        
        groupHeaderView.group = self.groups[groupHeaderView.tag];
    }
   
    [self.tableView reloadSections:idxSet withRowAnimation:UITableViewRowAnimationFade];
}





#pragma mark - *********** 实现数据源方法 ***********
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 因为在这个方法中, 要根据当前组的状态（是否是展开）, 来设置不同的返回值
    // 所以, 需要为CZGroup模型增加一个用来保存"是否展开"状态的属性
  
    CZGroup *group = self.groups[section];
    if (group.isVisible) {
        return group.friends.count;
    } else {
        return 0;
    }
    
}

// 返回每行的单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1. 获取模型对象（数据）
    CZGroup *group = self.groups[indexPath.section];
    CZFriend *friend = group.friends[indexPath.row];
    
    // 2. 创建单元格(视图)
    CZFriendCell *cell = [CZFriendCell friendCellWithTableView:tableView];
    
    // 3. 设置单元格数据(把模型设置给单元格)
    cell.friendModel = friend;
    
    // 4. 返回单元格
    return cell;
}


//// 设置每一组的组标题(下面的这个方法只能设置每一组的组标题字符串, 但是我们要的是每一组中还包含其他子控件)
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    CZGroup *group = self.groups[section];
//    return group.name;
//}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    // 不要在这个方法中直接创建一个UIView对象返回, 因为这样无法实现重用该UIView
    // 为了能重用每个Header中的UIView, 所以这里要返回一个UITableViewHeaderFooterView
    // 1. 获取模型数据
    CZGroup *group = self.groups[section];
    

    // 2. 创建UITableViewHeaderFooterView
    CZGroupHeaderView *headerVw = [CZGroupHeaderView groupHeaderViewWithTableView:tableView];
    headerVw.tag = section;
    
    // 3. 设置数据
    headerVw.group = group;
    
    // 设置headerView的代理为当前控制器
    headerVw.delegate = self;
    
    
    // 在刚刚创建好的header view中获取的header view的frame都是0, 因为刚刚创建好的header view我们没有为其frame赋值, 所以frame都是 0
    // 但是, 程序运行起来以后, 我们看到的header view是有frame的。原因是: 在当前方法当中, 将header view返回以后, UITableView在执行的时候, 会用到header view， UITableView既然要用Header View， 那么就必须将header view添加到UITableview中, 当把header view添加到UITableView中的时候, UITableView内部会根据一些设置来动态的为header view的frame赋值，也就是说在UITableView即将使用header view的时候, 才会为header view的frame赋值。
    
    // 4. 返回view
    return headerVw;
    
    
}



#pragma mark - *********** 隐藏状态栏 ***********
- (BOOL)prefersStatusBarHidden
{
    return YES;
}


#pragma mark - *********** 控制器的viewDidLoad方法 ***********
- (void)viewDidLoad
{
    [super viewDidLoad];

    // 统一设置每组的组标题的高度
    self.tableView.sectionHeaderHeight = 44;
    
    if (self.tableView.style == UITableViewStyleGrouped) {
        self.HeaderView = (CZGroupHeaderView *)[self tableView:nil viewForHeaderInSection:0];
        self.HeaderView.frame = CGRectMake(0, 0, self.view.frame.size.width, 44);
        self.tableView.tableHeaderView = self.HeaderView;
    }


}


@end











