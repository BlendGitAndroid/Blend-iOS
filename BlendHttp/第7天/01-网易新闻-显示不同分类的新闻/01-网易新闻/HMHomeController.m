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

//记录当前label的索引
@property (nonatomic, assign) int currentIndex;
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
    
    //设置第一个label，显示大字体
    HMChannelLabel *lbl = self.scrollView.subviews[0];
    lbl.scale = 1;
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
    
    HMChannel *channel = self.channels[indexPath.item];
    cell.urlString = channel.urlString;
    
    return cell;
}


//collectionView的代理方法
//collectionView正在滚动的方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //当前label
    HMChannelLabel *currentLabel = self.scrollView.subviews[self.currentIndex];
//    int index = scrollView.contentOffset.x / scrollView.bounds.size.width;

    //下一个label
    HMChannelLabel *nextLabel = nil;
    //遍历当前可见cell的索引
    for (NSIndexPath *indexPath in self.collectionView.indexPathsForVisibleItems) {
        //如果不是当前的cell，就是下一个cell
        if (indexPath.item != self.currentIndex) {
            nextLabel = self.scrollView.subviews[indexPath.item];
            break;
        }
    }
    
    if (nextLabel == nil) {
        return;
    }
    
    
    //获取滚动的比例
    CGFloat nextScale = ABS(scrollView.contentOffset.x / scrollView.bounds.size.width - self.currentIndex);
    CGFloat currentScale = 1-nextScale;
    
    currentLabel.scale = currentScale;
    nextLabel.scale = nextScale;
    
}
//滚动结束之后，计算currentIndex
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.currentIndex = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    //居中显示当前显示的标签
      HMChannelLabel *label = self.scrollView.subviews[self.currentIndex];
      CGFloat offset = label.center.x - self.scrollView.bounds.size.width * 0.5;
      CGFloat maxOffset = self.scrollView.contentSize.width - label.bounds.size.width - self.scrollView.bounds.size.width;
     
      if (offset < 0) {
            offset = 0;
          } else if (offset > maxOffset) {
                offset = maxOffset + label.bounds.size.width;
              }
     
      [self.scrollView setContentOffset:CGPointMake(offset, 0) animated:YES];
}

@end
