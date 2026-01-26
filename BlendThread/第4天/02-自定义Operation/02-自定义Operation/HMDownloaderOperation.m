//
//  HMDownloaderOperation.m
//  02-自定义Operation
//
//  Created by Apple on 15/10/17.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "HMDownloaderOperation.h"

@implementation HMDownloaderOperation
+ (instancetype)downloaderOperationWithURLString:(NSString *)urlString
                                   finishedBlock:
                                       (void (^)(UIImage *))finishedBlock {
    HMDownloaderOperation *op = [[HMDownloaderOperation alloc] init];
    op.urlString = urlString;
    op.finishedBlock = finishedBlock;
    return op;
}

// - 这是重写 NSOperation 基类的 main 方法
// - 当操作被添加到队列并开始执行时，系统会调用此方法
// - 此方法在 子线程 中执行，而非主线程
- (void)main {
    // - 在 main 方法中创建自动释放池是 iOS 开发的最佳实践
    // - 原因：
    // - 子线程默认没有自动释放池
    // - 防止内存泄漏，特别是在处理网络请求等可能产生大量临时对象的操作时
    // - 确保方法执行完毕后，池中对象能被及时释放
    @autoreleasepool {
        // 断言
        NSAssert(self.finishedBlock != nil, @"finishedBlock 不能为nil");

        // 模拟网络延时
        [NSThread sleepForTimeInterval:2.0];

        // 判断是否被取消  取消正在执行的操作
        // 在耗时操作之后取消
        if (self.isCancelled) {
            return;
        }

        NSLog(@"下载图片 %@ %@", self.urlString, [NSThread currentThread]);

        // UIImage

        // 假设图片下载完成
        // 回到主线程更新UI
        //        if (self.finishedBlock) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
          // 虽然要求的是UIImage，但是为了演示，这里传递的是NSString
          //
          self.finishedBlock(self.urlString);
        }];
        //        }
    }
}
@end
