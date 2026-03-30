//
//  ViewController.m
//  04-视频播放
//
//  Created by dream on 15/12/25.
//  Copyright © 2015年 dream. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>

@interface ViewController ()

@property (nonatomic, strong) MPMoviePlayerController *mpC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //检测视频播放完毕 --> 可以连续播放视频
    
    //注册通知监测视频播放完毕

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayerPlaybackDidFinishNotification:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
}

#pragma mark 通知绑定的方法
- (void)moviePlayerPlaybackDidFinishNotification:(NSNotification *)notification
{
    /**
     MPMovieFinishReasonPlaybackEnded,  播放结束
     MPMovieFinishReasonPlaybackError,  播放错误
     MPMovieFinishReasonUserExited      退出播放
     */
    
    //1. 获取通知结束的状态
    NSInteger movieFinishKey = [notification.userInfo[MPMoviePlayerPlaybackDidFinishReasonUserInfoKey] integerValue];
    
    //2. 根据状态不同来自行填写逻辑代码
    switch (movieFinishKey) {
        case MPMovieFinishReasonPlaybackEnded:
            NSLog(@"播放结束");
            
            // 进行视频切换 需要两步
            
            //1. 要想换视频, 就需要更换地址
            self.mpC.contentURL = [[NSBundle mainBundle] URLForResource:@"Alizee_La_Isla_Bonita.mp4" withExtension:nil];
            
            // 
            [self.mpC play];
            
            break;
            
        case MPMovieFinishReasonPlaybackError:
            NSLog(@"播放错误");
            break;
            
        case MPMovieFinishReasonUserExited:
            NSLog(@"退出播放");
            
            // 如果是不带view的播放器, 那么播放完毕(退出/错误/结束)都应该退出
            [self.mpC.view removeFromSuperview];
            break;
            
        default:
            break;
    }
    
}

- (void)dealloc
{
    //移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (IBAction)moviePlayerController
{
    // 不带View的播放器的控制器 --> 需要强引用, 设置frame, 添加到view上, 开始播放
    //1. 获取URL地址
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Cupid_高清.mp4" withExtension:nil];
    
    //2. 创建不带View的播放器
    self.mpC = [[MPMoviePlayerController alloc] initWithContentURL:url];
    
    //3. 设置view.frame
    self.mpC.view.frame = CGRectMake(0, 0, 300, 400);
    
    //4. 添加到view上
    [self.view addSubview:self.mpC.view];
    
    //5. 准备播放 --> 规范写法, 要写上. 调用play方法时, 会自动调用此方法
    [self.mpC prepareToPlay];
    
    //6. 开始播放
    [self.mpC play];
    
    //7. 控制模式
    self.mpC.controlStyle = MPMovieControlStyleFullscreen;
    
    /**
     MPMovieControlStyleNone,       // No controls
     MPMovieControlStyleEmbedded,   // 嵌入式的控制 -- 默认
     MPMovieControlStyleFullscreen, // 全屏时的控制样式
     */

}

- (IBAction)moviePlayerViewController:(id)sender {
    // 带View的播放器的控制器
    
    //1. 获取URL地址
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Cupid_高清.mp4" withExtension:nil];
    
    //2. 创建带View的播放器
    MPMoviePlayerViewController *mpVC = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
    
    //3. 模态视图弹出 --> 模态视图的切换应该在View完全展示之后进行
    [self presentViewController:mpVC animated:YES completion:nil];
}


@end
