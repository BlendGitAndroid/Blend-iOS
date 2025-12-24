// ViewController.m
#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong) NSMutableArray *photoList;
@property(nonatomic, strong) dispatch_queue_t barrierQueue; // 明确命名
@end

@implementation ViewController

- (NSMutableArray *)photoList {
    if (_photoList == nil) {
        _photoList = [NSMutableArray array];
    }
    return _photoList;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // 1. 创建并发队列（只创建一次）
    _barrierQueue =
        dispatch_queue_create("hm.barrier", DISPATCH_QUEUE_CONCURRENT);

    // 2. 启动所有下载
    for (int i = 1; i <= 10; i++) {
        [self downloadImage:i];
    }
}

- (void)downloadImage:(int)index {
    dispatch_async(self.barrierQueue, ^{
      // 1. 模拟下载（并发执行）
      // 模拟耗时操作
      [NSThread sleepForTimeInterval:10];
      NSString *fileName =
          [NSString stringWithFormat:@"%02d.jpg", index % 10 + 1];
      NSString *path = [[NSBundle mainBundle] pathForResource:fileName
                                                       ofType:nil];
      UIImage *img = [UIImage imageWithContentsOfFile:path];

      NSLog(@"📥 图片下载完成 %@ - 线程：%@", fileName,
            [NSThread currentThread]);

      // 2. 使用 barrier 安全添加（独占执行）
      dispatch_barrier_async(self.barrierQueue, ^{
        [self.photoList addObject:img];
        NSLog(@"✅ 保存图片 %@ - 数组数量：%zd", fileName,
              self.photoList.count);
      });
    });
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 使用 sync 安全读取（会等待所有 barrier 任务完成）
    __block NSInteger count = 0;
    dispatch_sync(self.barrierQueue, ^{
      count = self.photoList.count;
    });

    NSLog(@"👆 触摸事件 - 当前图片数量：%zd", count);
}

@end
