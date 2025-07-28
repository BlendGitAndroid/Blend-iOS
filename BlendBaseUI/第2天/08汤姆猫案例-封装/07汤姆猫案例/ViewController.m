//
//  ViewController.m
//  07汤姆猫案例
//
//  Created by apple on 15/2/6.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgViewCat;

- (IBAction)drink;


- (IBAction)fart;

- (IBAction)knockout;

- (IBAction)eat:(UIButton *)sender;

- (IBAction)pie;

- (IBAction)scratch;

- (IBAction)cymbal;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// 喝牛奶的动画
- (IBAction)drink {
    
    
    [self startAnimating:81 picName:@"drink"];
}

// 放P
- (IBAction)fart {
   
    [self startAnimating:28 picName:@"fart"];
}


- (IBAction)cymbal {
    [self startAnimating:13 picName:@"cymbal"];
}

- (IBAction)scratch {
    [self startAnimating:56 picName:@"scratch"];
}

- (IBAction)pie {
    [self startAnimating:24 picName:@"pie"];
}


- (IBAction)eat:(UIButton *)sender {
    
    [self startAnimating:40 picName:@"eat"];
}

// 敲头
- (IBAction)knockout {
    [self startAnimating:81 picName:@"knockout"];
}




// 执行动画的方法
- (void)startAnimating:(int)count picName:(NSString *)picName
{
    // 如果当前图片框正在执行动画, 那么直接return, 什么都不做（没有开启一个新动画）
    // 一个UI View是可以判断是否正在执行动画，因为动画是运行时UI View上的
    if (self.imgViewCat.isAnimating) {
        return;
    }
    
    // 1. 把图片加载到数组中
    // 0.动态加载图片到一个NSArray中
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (int i = 0; i < count; i++) {
        // 拼接图片名称，%02d就是保留两位数，并且不足补0
        NSString *imgName = [NSString stringWithFormat:@"%@_%02d.jpg", picName, i];
        
        // 根据图片名称加载图片
        // 通过imageNamed: 这种方式加载图片, 加载好的图片会一直保存写在内存中, 不会释放.这样下次如果再使用同样的图片的时候就不需要再重新加载了, 因为内存里面已经有了。缺点就是: 如果加载了大量的图片, 那么这些图片会一直保留在内存中，导致应用程序占用内存过大（这就叫缓存）
        
        // 使用这种方式加载图片, 加载起来的图片即便没有强类型指针引用也不会销毁（会被缓存）
        // 所以[UIImage imageNamed]方式加载的图片，一旦加载起来，就会存在一个ViewController中
        //UIImage *imgCat = [UIImage imageNamed:imgName];
        
        
        
        
        
        // 使用下面这种方式加载的图片, 只要没有强类型指针引用就会被销毁了
        // 解决： 换一种加载图片的方式, 不要使用缓存
        // 获取图片的完成的路径
        // 如果pathForResource中带有后缀类型，那ofType就可以位nil了
        NSString *path = [[NSBundle mainBundle] pathForResource:imgName ofType:nil];
        
        // 这里的参数不能再传递图片名称了, 这里需要传递一个图片的完整路径
        UIImage *imgCat = [UIImage imageWithContentsOfFile:path];
        
        // 把图片加载到数组中
        [arrayM addObject:imgCat];
    }
    
    // 2. 设置UIImageView的animationImages属性为对应的图片集合
    // 每一个UI View对象都有一个animationImage对象，是一个NSArray集合
    self.imgViewCat.animationImages = arrayM;
    
    // 3. 动画持续时间
    // 为每一个View的动画设置时间
    self.imgViewCat.animationDuration = self.imgViewCat.animationImages.count * 0.1;
    
    
    // 4. 重复次数
    self.imgViewCat.animationRepeatCount = 1;
    
    // 5. 启动动画
    // 为UIView设置开始动画
    [self.imgViewCat startAnimating];
    
    
    // 清空图片集合
    // 这样些写的问题是, 当动画启动以后, 动画还没开始执行, 就已经让图片集合清空了, 也就是说self.imgViewCat.animationImages 里面已经没有图片了, 所以动画就不执行了。
    //self.imgViewCat.animationImages = nil;
    
    
    
    // self.imgViewCat.animationImages = nil; 需要延迟一段时间执行, 当动画执行完毕以后再清空这些图片
    //[self.imgViewCat setAnimationImages:nil];
    
    
    // 设置图片框在调用setAnimationImages:nil方法的时候延迟执行
    [self.imgViewCat performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:self.imgViewCat.animationImages.count * 0.1];
    
    
    // 还可以用这个动画的延迟方法
//    [UIView animateWithDuration:self.imgViewCat.animationDuration animations:^{
//            
//        } completion:^(BOOL finished) {
//            if (finished) {
//                self.imgViewCat.animationImages = nil;
//            }
//        }];
}




@end




















