//
//  HEIMBaseController.m
//  14-第2天(多控制器管理(UINavigationController))
//
//  Created by 刘春牢 on 15/11/25.
//
//

#import "HEIMBaseController.h"

@interface HEIMBaseController ()

@end

@implementation HEIMBaseController

//- (void)viewDidLoad {
//
//    [super viewDidLoad];
//    
//    NSLog(@"%@--->界面加载完成", [self class]);
//}
//
//
//- (void)viewWillAppear:(BOOL)animated {
//
//    [super viewWillAppear:animated];
//    
//    NSLog(@"%@ --->界面即将显示", [self class]);
//}
//
//- (void)viewDidAppear:(BOOL)animated {
//
//    [super viewDidAppear:animated];
//    
//    NSLog(@"%@ ---> 界面已经显示出来",[self class]);
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//
//    [super viewWillDisappear:animated];
//    
//    NSLog(@"%@ ---> 界面即将消失", [self class]);
//}
//
//- (void)viewDidDisappear:(BOOL)animated {
//
//    [super viewDidDisappear:animated];
//    
//    NSLog(@"%@ ---> 界面已经消失", [self class]);
//}


- (void)dealloc {
    
    NSLog(@"%@ --- dealloc", [self class]);
}














@end
