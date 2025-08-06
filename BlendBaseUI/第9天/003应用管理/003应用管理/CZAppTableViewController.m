//
//  CZAppTableViewController.m
//  003应用管理
//
//  Created by apple on 15/3/6.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZAppTableViewController.h"
#import "CZApp.h"
#import "CZAppCell.h"

@interface CZAppTableViewController () <CZAppCellDelegate>

@property (nonatomic, strong) NSArray *apps;

@end

@implementation CZAppTableViewController

#pragma mark - *************** CZAppCell的代理方法 ***************
- (void)appCellDidClickDownloadButton:(CZAppCell *)appCell
{
    // 1. 创建一个Label
    UILabel *lblMsg = [[UILabel alloc] init];
    // 1.1. 设置文字
    lblMsg.text = @"正在下载...";
    // 1.2. 设置背景色
    lblMsg.backgroundColor = [UIColor blackColor];
    // 1.3. 设置文字颜色
    lblMsg.textColor = [UIColor redColor];
    // 1.4 设置frame
    CGFloat msgW = 200;
    CGFloat msgH = 30;
    CGFloat msgX = (self.view.frame.size.width - msgW) * 0.5;
    CGFloat msgY = (self.view.frame.size.height - msgH) * 0.5;
    lblMsg.frame = CGRectMake(msgX, msgY, msgW, msgH);
    NSLog(@"%@", NSStringFromCGRect(lblMsg.frame));
    
    // 1.5 修改Lable的文字大小
    lblMsg.font = [UIFont systemFontOfSize:14];
    
    // 1.6 设置Label中的文字居中显示
    lblMsg.textAlignment = NSTextAlignmentCenter;
    
    // 1.7 设置label的透明度
    lblMsg.alpha = 0.0;
    
    // 1.8 设置Label圆角显示
    lblMsg.layer.cornerRadius = 5;
    lblMsg.layer.masksToBounds = YES;
    
    
    // 2. 把Label加到self.view
    // 因为现在使用的是UITableViewController控制器, 所以self.view就是UITableView
    // 当把lblMsg加到self.view中, 也就是加到了UITableView中, 所以当UITableView滚动的时候, lblMsg也会随着滚动。
    //[self.view addSubview:lblMsg];
    [[[UIApplication sharedApplication] keyWindow] addSubview:lblMsg];
    
    
    
    // 3.通过动画的方式慢慢显示label
//    [UIView animateWithDuration:1.0 animations:^{
//        lblMsg.alpha = 0.6;
//    }];
    
    [UIView animateWithDuration:1.0 animations:^{
        // 当前要执行的动画方法
        lblMsg.alpha = 0.6;
        
    } completion:^(BOOL finished) {
        // 当动画执行完毕以后执行这里的代码
        
        
        // 再开启一个新的动画
        [UIView animateWithDuration:1.0 delay:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
            
            lblMsg.alpha = 0;
            
        } completion:^(BOOL finished) {
            
            [lblMsg removeFromSuperview];
        }];
        
        
        
    }];
}




#pragma mark - *************** 懒加载数据 ***************
- (NSArray *)apps
{
    if (_apps == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"apps_full.plist" ofType:nil];
        NSArray *arrayDicts = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *arrayModels = [NSMutableArray array];
        for (NSDictionary *dict in arrayDicts) {
            CZApp *model = [CZApp appWithDict:dict];
            [arrayModels addObject:model];
        }
        _apps = arrayModels;
    }
    return _apps;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 统一设置UITableView的行高
    self.tableView.rowHeight = 60;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view 数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.apps.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1. 获取模型数据
    CZApp *model = self.apps[indexPath.row];
    
    // 2. 创建单元格
//    // 通过Xib加载
//    static NSString *ID = @"app_cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    if (cell == nil) {
//        // 通过xib加载
//        cell = [NSBundle mainBundle] loadNibNamed:@"xx" owner:<#(id)#> options:<#(NSDictionary *)#>
//    }
    
    
    // 通过stroyboard中的cell模板来加载单元格
    static NSString *ID = @"app_cell";
    CZAppCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 设置单元格的代理
    cell.delegate = self;

    // 3. 把模型设置给单元格
    cell.app = model;
    
    
    // 4. 返回单元格
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
