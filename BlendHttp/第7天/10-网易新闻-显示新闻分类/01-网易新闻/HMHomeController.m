//
//  HMHomeController.m
//  01-网易新闻
//
//  Created by Apple on 15/10/28.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import "HMHomeController.h"
#import "HMChannel.h"
#import "HMChannelLabel.h"
#import "HMHomeCell.h"
@interface HMHomeController () <UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) NSArray *channels;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@end

@implementation HMHomeController
//懒加载
- (NSArray *)channels {
    if (_channels == nil) {
        _channels = [HMChannel channels];
    }
    return _channels;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal ;
    self.flowLayout.minimumInteritemSpacing = 0;
    self.flowLayout.minimumLineSpacing = 0;
    
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    
    
    //加载新闻分类
    [self loadChannels];
}
//在导航控制器中如果出现了scrollView，会自动加上64的偏移
- (void)loadChannels {
    //不让控制器自动生成64的偏移
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    CGFloat marginX = 5;
    CGFloat x = marginX;
    CGFloat h = self.scrollView.bounds.size.height;
    
    
    for (HMChannel *channel in self.channels) {
        HMChannelLabel *lbl = [HMChannelLabel channelLabelWithTName:channel.tname];
        [self.scrollView addSubview:lbl];
        
        lbl.frame = CGRectMake(x, 0, lbl.bounds.size.width, h);
        x += lbl.bounds.size.width + marginX;
    }
    
    //设置滚动范围
    self.scrollView.contentSize = CGSizeMake(x, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;
}


//当计算好collectionView的大小。再设置cell的大小
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.flowLayout.itemSize = self.collectionView.bounds.size;
}

//数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.channels.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HMHomeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"news" forIndexPath:indexPath];
    
    
    return cell;
}


@end
