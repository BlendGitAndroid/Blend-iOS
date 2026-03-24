//
//  HMImageLoopController.m
//  01-网易新闻
//
//  Created by Apple on 15/10/28.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import "HMImageLoopController.h"
#import "HMHeadline.h"
#import "HMHeadlineCell.h"
@interface HMImageLoopController ()
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowlayout;
@property (nonatomic, strong) NSArray *headlines;

//当前图片的索引
@property (nonatomic, assign) NSInteger currentIndex;
@end

@implementation HMImageLoopController
//使用collectionView注意
//1 必须设置flowLayout
//2 必须注册cell（从sb中加载cell，注册自定义cell，注册xib）

- (void)setHeadlines:(NSArray *)headlines {
    _headlines = headlines;
    //重新加载colletionView
    [self.collectionView reloadData];
    
    //始终显示第二个cell
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:1 inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:0 animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    //发送异步请求，获取headline数据
    [HMHeadline headlinesWithSuccess:^(NSArray *array) {
        self.headlines = array;
    } error:^{
        NSLog(@"出错了");
    }];
    
    //设置flowlayout
    [self setCollectionViewStyle];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    //等待collectionView的大小重新计算之后，再设置cell的大小
self.flowlayout.itemSize = self.collectionView.frame.size;
}


//设置colletionview的样式
- (void)setCollectionViewStyle {
    self.flowlayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.flowlayout.minimumInteritemSpacing = 0;
    self.flowlayout.minimumLineSpacing = 0;
    
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.bounces = NO;
}

//数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.headlines.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HMHeadlineCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"headline" forIndexPath:indexPath];
   
    //在滚动过程中下一张图片的索引
    //当滚动的过程中item的值可能是 0 或者 2
    NSInteger index = (self.currentIndex + indexPath.item - 1 + self.headlines.count) % self.headlines.count;
    cell.tag = index ;
    cell.headline = self.headlines[index] ;
    
    NSLog(@"indexPath = %zd",indexPath.item);
    NSLog(@"index = %zd",index);

    
    return cell;
}

//collectionView的代理方法
//滚动停止之后，把cell换成第二个cell
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //计算下一张图片的索引 (+1  -1)
    //返回的值始终是 （0  2） - 1
    int offset = scrollView.contentOffset.x / scrollView.bounds.size.width - 1;
    self.currentIndex = (self.currentIndex + offset + self.headlines.count ) % self.headlines.count;
    
    
    
    
    //始终显示第二个cell
    //主队列的执行特点：先等待主线程上的代码都执行完毕，再执行队列中的任务
    dispatch_async(dispatch_get_main_queue(), ^{
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:1 inSection:0];
        [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:0 animated:NO];
    });
    
    
}

@end
