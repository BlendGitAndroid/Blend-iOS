/*
 * 名称
 * 生日
 * 账号
 
 
 */
#import <Foundation/Foundation.h>
#import "Account.h"

@interface User : NSObject

/**
 *  用户昵称
 */
@property(nonatomic,retain)NSString *nickName;

/**
 *  出生日期.
 */
@property(nonatomic,assign)CZDate birthday;


/**
 *  用户的账户信息
 */
@property(nonatomic,retain)Account *account;



@end
