//
//  ViewController.m
//  10-strong和weak
//
//  Created by Apple on 15/10/13.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"
#import "HMPerson.h"
@interface ViewController ()
// 因为是weak修饰的
@property (nonatomic, weak) HMPerson *p1;
@property (nonatomic, weak) HMPerson *p2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.p1 = [[HMPerson alloc] init];
    // 到这里p1就被释放了
    self.p1.name = @"zs";
    NSLog(@"p1 : %@",self.p1.name);
    
    
    self.p2 = [HMPerson personWithName:@"ls"];
    // 到这里P2不会被释放，原因是被自动释放池引用
    NSLog(@"p2 : %@",self.p2.name);
    // 在大括号结束的时候，p2就释放了
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"p1 : %@",self.p1.name);
    NSLog(@"p2 : %@",self.p2.name);

}



@end
