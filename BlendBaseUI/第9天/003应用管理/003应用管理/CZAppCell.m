//
//  CZAppCell.m
//  003应用管理
//
//  Created by apple on 15/3/6.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZAppCell.h"
#import "CZApp.h"
@interface CZAppCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imgViewIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblIntro;
@property (weak, nonatomic) IBOutlet UIButton *btnDownload;
- (IBAction)btnDownloadClick;

@end


@implementation CZAppCell

- (void)setApp:(CZApp *)app
{
    _app = app;
    
    // 把app模型中的数据设置给单元格的子控件
    self.imgViewIcon.image = [UIImage imageNamed:app.icon];
    
    self.lblName.text = app.name;
    self.lblIntro.text = [NSString stringWithFormat:@"大小: %@ | 下载量: %@", app.size, app.download];
    
    // 更新下载按钮的状态
    if (app.isDownloaded) {
        self.btnDownload.enabled = NO;
    } else {
        self.btnDownload.enabled = YES;
    }
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// 下载按钮的点击事件
- (IBAction)btnDownloadClick {
    // 1. 禁用按钮
    self.btnDownload.enabled = NO;
    // 设置模型(标记一下已经被点击过了)
    self.app.isDownloaded = YES;
    
    // 2. 弹出消息提示label
    if ([self.delegate respondsToSelector:@selector(appCellDidClickDownloadButton:)]) {
        [self.delegate appCellDidClickDownloadButton:self];
    }
    
    
}
@end
