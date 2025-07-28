//
//  CZGoodsCell.m
//  001团购案例
//
//  Created by apple on 15/3/2.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZGoodsCell.h"
#import "CZGoods.h"

@interface CZGoodsCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imgViewIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblPrice;
@property (weak, nonatomic) IBOutlet UILabel *lblBuyCount;

@end


@implementation CZGoodsCell

+ (instancetype)goodsCellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"goods_cell";
    CZGoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CZGoodsCell" owner:nil options:nil] firstObject];
    }
    return cell;
}


- (void)setGoods:(CZGoods *)goods
{
    _goods = goods;
    // 把模型的数据设置给子控件
    self.imgViewIcon.image = [UIImage imageNamed:goods.icon];
    self.lblTitle.text = goods.title;
    self.lblPrice.text = [NSString stringWithFormat:@"￥ %@", goods.price];
    self.lblBuyCount.text = [NSString stringWithFormat:@"%@ 人已购买", goods.buyCount];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
