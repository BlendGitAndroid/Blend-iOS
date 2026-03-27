//
//  HMToolsTest.m
//  04-单元测试
//
//  Created by dream on 15/12/17.
//  Copyright © 2015年 dream. All rights reserved.
//

#import "HMTools.h"
#import <XCTest/XCTest.h>

@interface HMToolsTest : XCTestCase

@end


// 新建单元Target, 选择 Unit Testing Bundle, 选择对应的语言, 创建完成后会自动生成一个测试类
@implementation HMToolsTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each
    // test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of
    // each test method in the class.
    [super tearDown];
}

- (void)testSum {
    // 要测试时, 点击左边的菱形按钮即可
    // 运行正常, 会出现绿色
    // 运行不正常, 会出现红色
    // 最顶部还有一个菱形按钮, 用于多个测试代码都需要执行是,
    // 可以点击顶部的按钮来统一测试

    // XCTAssert : 断言
    XCTAssert([HMTools sumNum1:250 num2:38] == 288, @"方法错误");

    //    if ([HMTools sumNum1:250 num2:38] == 288) {
    //        NSLog(@"逻辑代码写的是正确的");
    //    }
}

- (void)testSum1 {
    // 要测试时, 点击左边的菱形按钮即可
    // 运行正常, 会出现绿色
    // 运行不正常, 会出现红色
    //

    // XCTAssert : 断言
    XCTAssert([HMTools sumNum1:250 num2:38] == 288, @"方法错误");

    //    if ([HMTools sumNum1:250 num2:38] == 288) {
    //        NSLog(@"逻辑代码写的是正确的");
    //    }
}

@end
