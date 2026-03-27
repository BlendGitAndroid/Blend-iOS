//
//  ViewController.m
//  02-内存分析工具
//
//  Created by dream on 15/12/17.
//  Copyright © 2015年 dream. All rights reserved.
//

#import "ViewController.h"
#import "Dog.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    Person *p = [Person new];
    Dog *d = [Dog new];

    p.dog = d;
    d.person = p;
}

@end
