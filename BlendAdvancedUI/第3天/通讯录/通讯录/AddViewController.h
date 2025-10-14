//
//  AddViewController.h
//  通讯录
//
//  Created by Romeo on 15/12/2.
//  Copyright © 2015年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"
@class AddViewController;

@protocol AddViewControllerDelegate <NSObject>

@optional
- (void)addViewController:(AddViewController*)addViewController withContact:(Contact*)contact;

@end

@interface AddViewController : UIViewController

@property (nonatomic, weak) id<AddViewControllerDelegate> delegate;

@end
