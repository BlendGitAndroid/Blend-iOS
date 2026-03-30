//
//  ViewController.m
//  08-视频压缩
//
//  Created by dream on 15/12/25.
//  Copyright © 2015年 dream. All rights reserved.
//

#import "ViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //1. 判断是否可用
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]) {
        return;
    }
    
    //2. 创建图像选择器
    UIImagePickerController *picker = [UIImagePickerController new];
    
    //3. 设置类型
    picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    //4. 设置媒体类型
    picker.mediaTypes = @[(NSString *)kUTTypeMovie];
    
    //5. 设置代理
    picker.delegate = self;
    
    //6. 模态弹出
    [self presentViewController:picker animated:YES completion:nil];
}


#pragma mark 选中视频的时候, 进行压缩处理
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    //1. 获取媒体类型
    NSString *mediaTyep = info[UIImagePickerControllerMediaType];
    
    //2. 获取视频的地址
    id url = info[UIImagePickerControllerMediaURL];
    
    //3. 开始导出--> 压缩
    [self exportWithURL:url];
}

- (void)exportWithURL:(NSURL *)url
{
    //1. 获取资源
    AVAsset *asset = [AVAsset assetWithURL:url];
    
    //2. 根据资源, 创建资源导出会话对象
    //presetName : 压缩的大小
    AVAssetExportSession *session = [[AVAssetExportSession alloc] initWithAsset:asset presetName:AVAssetExportPresetHighestQuality];
   
    //3. 设置导出路径
    session.outputURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:@"12345.mov"]];
    
    //4. 设置导出类型
    session.outputFileType = AVFileTypeQuickTimeMovie;
    
    //5. 开始导出
    [session exportAsynchronouslyWithCompletionHandler:^{
        NSLog(@"当你看到这句话的时候, 恭喜你已经导出成功");
    }];
}

@end
