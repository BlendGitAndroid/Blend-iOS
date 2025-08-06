//
//  CZWeiboCell.m
//  004微博案例
//
//  Created by apple on 15/3/2.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZWeiboCell.h"
#import "CZWeibo.h"
#import "CZWeiboFrame.h"



@interface CZWeiboCell ()
@property (nonatomic, weak) UIImageView *imgViewIcon;
@property (nonatomic, weak) UILabel *lblNickName;
@property (nonatomic, weak) UIImageView *imgViewVip;
@property (nonatomic, weak) UILabel *lblText;
@property (nonatomic, weak) UIImageView *imgViewPicture;


@end


@implementation CZWeiboCell


#pragma mark - 重写单元格的initWithStyle:方法

+ (instancetype)weiboCellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"weibo_cell";
    CZWeiboCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[CZWeiboCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

// 重写了initWithStyle方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 创建5个子控件
        
        // 1. 头像
        UIImageView *imgViewIcon = [[UIImageView alloc] init];
        [self.contentView addSubview:imgViewIcon];
        self.imgViewIcon = imgViewIcon;
        
        // 2. 昵称
        UILabel *lblNickName = [[UILabel alloc] init];
        // 设置Label的文字大小
        lblNickName.font = nameFont;
        
        [self.contentView addSubview:lblNickName];
        self.lblNickName = lblNickName;
        
        // 3. 会员
        UIImageView *imgViewVip = [[UIImageView alloc] init];
        imgViewVip.image = [UIImage imageNamed:@"vip"];
        [self.contentView addSubview:imgViewVip];
        self.imgViewVip = imgViewVip;
        
        // 4. 正文
        UILabel *lblText = [[UILabel alloc] init];
        lblText.font = textFont;
        // 设置正文的Label可以自动换行
        lblText.numberOfLines = 0;
        [self.contentView addSubview:lblText];
        self.lblText = lblText;
        
        // 5. 配图
        UIImageView *imgViewPicture = [[UIImageView alloc] init];
        [self.contentView addSubview:imgViewPicture];
        self.imgViewPicture = imgViewPicture;
    }
    return self;
}


#pragma mark - 重写weibo属性的set方法
- (void)setWeiboFrame:(CZWeiboFrame *)weiboFrame
{
    _weiboFrame = weiboFrame;
    
    // 1. 设置当前单元格中的子控件的数据
    [self settingData];
    
    // 2. 设置当前单元格中的子控件的frame
    [self settingFrame];
}


// 设置数据的方法
- (void)settingData
{
    CZWeibo *model = self.weiboFrame.weibo;
    // 1. 头像
    self.imgViewIcon.image = [UIImage imageNamed:model.icon];
    
    // 2. 昵称
    self.lblNickName.text = model.name;
    
    // 3. 会员
    if (model.isVip) {
        // 设置显示会员图标
        self.imgViewVip.hidden = NO;
        // 设置昵称的颜色是红色
        self.lblNickName.textColor = [UIColor redColor];
    } else {
        // 设置隐藏会员图标
        self.imgViewVip.hidden = YES;
        // 设置昵称的颜色是黑色
        self.lblNickName.textColor = [UIColor blackColor];
    }
    
    // 4. 正文
    self.lblText.text = model.text;
 
    
    // 5. 配图
    if (model.picture) {
        // 有配图
        // 如果model.picture的值是nil, 那么下面这句话执行会报异常
        self.imgViewPicture.image = [UIImage imageNamed:model.picture];
        // 显示图片框
        self.imgViewPicture.hidden = NO;
    } else {
        // 如果没有配图, 隐藏图片框
        self.imgViewPicture.hidden = YES;
    }

}

// 设置frame的方法
- (void)settingFrame
{
    // 1. 头像
    
    self.imgViewIcon.frame = self.weiboFrame.iconFrame;
    
    // 2. 昵称
    self.lblNickName.frame = self.weiboFrame.nameFrame;
    
    // 3. 会员
    self.imgViewVip.frame = self.weiboFrame.vipFrame;
    
    // 4. 正文
    
    self.lblText.frame = self.weiboFrame.textFrame;
    
    // 5. 配图
    self.imgViewPicture.frame = self.weiboFrame.picFrame;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
