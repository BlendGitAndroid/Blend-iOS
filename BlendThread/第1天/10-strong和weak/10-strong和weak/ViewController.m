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
@property (nonatomic, weak) HMPerson *p1;
@property (nonatomic, weak) HMPerson *p2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.p1 = [[HMPerson alloc] init];
    self.p1.name = @"zs";
    NSLog(@"p1 : %@",self.p1.name);
    
    
    self.p2 = [HMPerson personWithName:@"ls"];
    NSLog(@"p2 : %@",self.p2.name);
    
       
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"p1 : %@",self.p1.name);
    NSLog(@"p2 : %@",self.p2.name);

}



@end
