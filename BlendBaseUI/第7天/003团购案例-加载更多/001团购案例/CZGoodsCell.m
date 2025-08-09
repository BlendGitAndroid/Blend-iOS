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

// 在这里的时候，需要CZGoodsCell绑定到类CZGoodCell的类上
/*         
在iOS应用中，XIB文件的存储和加载机制如下：

### 1. **编译时转换**
XIB文件在项目编译阶段会被Xcode的`ibtool`工具转换为二进制格式的**NIB文件**（文件扩展名仍为.xib，但内容已编译为二进制）。这个过程会优化文件结构，提高运行时加载效率并减小文件体积。

### 2. **应用Bundle存储**
编译后的NIB文件会被打包到应用的**主Bundle**（`mainBundle`）中，具体位置为应用安装目录下的`Resources`文件夹或直接位于Bundle根目录。应用安装到设备后，Bundle整体存储在沙盒路径：
`/var/mobile/Containers/Bundle/Application/<应用UUID>/<应用名称>.app/`

### 3. **运行时访问机制**
代码中`[[NSBundle mainBundle] loadNibNamed:...]`的工作原理：
- `mainBundle`会定位到应用安装目录下的Bundle文件
- 通过文件名（无需扩展名）查找已编译的NIB文件
- 加载文件并实例化其中定义的界面元素（如`CZGoodsCell`）

### 4. **关键特性**
- **跨环境一致性**：无论是模拟器还是真机，Bundle结构保持一致，因此同一套代码可在不同环境运行
- **只读性**：Bundle中的资源为只读状态，应用无法修改自身Bundle内容
- **签名验证**：iOS系统会验证Bundle的签名，确保资源未被篡改

这种机制既保证了资源的安全管理，也实现了高效的界面元素加载。       
*/
+ (instancetype)goodsCellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"goods_cell";
    CZGoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CZGoodsCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

// 封装设置数据的方法
- (void)setGoods:(CZGoods *)goods
{
    _goods = goods;
    // 把模型的数据设置给子控件
    self.imgViewIcon.image = [UIImage imageNamed:goods.icon];
    self.lblTitle.text = goods.title;
    self.lblPrice.text = [NSString stringWithFormat:@"￥ %@", goods.price];
    self.lblBuyCount.text = [NSString stringWithFormat:@"%@ 人已购买", goods.buyCount];
}

// 当视图从xib文件加载完成并被实例化的时候调用
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
