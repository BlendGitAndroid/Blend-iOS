//
//  UI_TestUITests.m
//  UI TestUITests
//
//  Created by dream on 15/12/25.
//  Copyright © 2015年 dream. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface UI_TestUITests : XCTestCase

@end

@implementation UI_TestUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    //1. 鼠标放到这里
    //2. 点击下方红色录制按钮
    //3. 停止时再次点击红色按钮
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *button = app.buttons[@"Button"];
    
    for (int i = 0; i < 100; i++) {
        [button tap];
    }
    
    [button tap];
    [button tap];
    [app.staticTexts[@"Label"] tap];
    [app.buttons[@"Second"] tap];
    
    XCUIElement *textField = [[app.otherElements containingType:XCUIElementTypeButton identifier:@"Button"] childrenMatchingType:XCUIElementTypeTextField].element;
    [textField tap];
    [textField tap];
    [textField typeText:@"flasdfasdf \r"];
    [textField typeText:@"asldf sa"];
    [[app.otherElements containingType:XCUIElementTypeButton identifier:@"Button"].element tap];
    
    
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

@end
