//
//  ViewController.m
//  03-二维码
//
//  Created by dream on 15/12/17.
//  Copyright © 2015年 dream. All rights reserved.
//

/**
 二维码实现思路
 1. 输入设备(用来获取外界信息)  摄像头, 麦克风, 键盘
 2. 输出设备 (将收集到的信息, 做解析, 来获取收到的内容)
 3. 会话session (用来连接输入和输出设备)
 4. 特殊的layer (展示输入设备所采集的信息)

 AVFoundation 的统一架构，不只是二维码，录音、录像、拍照、人脸识别都用这套模式
 */

#import "ViewController.h"
#import "HMPreView.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController () <AVCaptureMetadataOutputObjectsDelegate>
// 1. 输入设备(用来获取外界信息)  摄像头, 麦克风, 键盘
@property(nonatomic, strong) AVCaptureDeviceInput *input;

// 2. 输出设备 (将收集到的信息, 做解析, 来获取收到的内容)
@property(nonatomic, strong) AVCaptureMetadataOutput *output;

// 3. 会话session (用来连接输入和输出设备)
@property(nonatomic, strong) AVCaptureSession *session;

// 4. 特殊的layer (展示输入设备所采集的信息)
//@property (nonatomic, strong) AVCaptureVideoPreviewLayer *previewLayer;
@property(nonatomic, strong) HMPreView *preview;

@property(weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark 点击屏幕开始扫描
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 1.输入设备(用来获取外界信息)  摄像头, 麦克风, 键盘
    AVCaptureDevice *device =
        [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    self.input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];

    // 2.输出设备 (将收集到的信息, 做解析, 来获取收到的内容)
    self.output = [AVCaptureMetadataOutput new];

    // 3.会话session (用来连接输入和输出设备)
    self.session = [AVCaptureSession new];

    // 会话扫描展示的大小
    [self.session setSessionPreset:AVCaptureSessionPresetHigh];

    // 会话跟输入和输出设备关联
    // canAddInput : 判断是否能够添加输入设备
    if ([self.session canAddInput:self.input]) {
        [self.session addInput:self.input];
    }
    if ([self.session canAddOutput:self.output]) {
        [self.session addOutput:self.output];
    }

    // 下面两句代码应该写在此处
    // 制定输出设备的代理, 用来接受返回的数据
    [self.output setMetadataObjectsDelegate:self
                                      queue:dispatch_get_main_queue()];

    // 设置元数据类型 二维码QRCode
    [self.output setMetadataObjectTypes:@[ AVMetadataObjectTypeQRCode ]];

    // 4.特殊的layer (展示输入设备所采集的信息)
    // self.previewLayer = [[AVCaptureVideoPreviewLayer alloc]
    // initWithSession:self.session];
    //  大小layer的大小
    // self.previewLayer.frame = self.view.bounds;
    //[self.view.layer addSublayer:self.previewLayer];
    self.preview = [[HMPreView alloc] initWithFrame:self.view.bounds];
    self.preview.session = self.session;
    [self.view addSubview:self.preview];

    // 5. 启动会话
    [self.session startRunning];
}

/**
 captureOutput : 输出设备
 metadataObjects : 元数据对象的数组
 connection : 连接
 */
- (void)captureOutput:(AVCaptureOutput *)captureOutput
    didOutputMetadataObjects:(NSArray *)metadataObjects
              fromConnection:(AVCaptureConnection *)connection {
    // 1. 停止会话
    [self.session stopRunning];

    // 2. 删除layer
    //[self.previewLayer removeFromSuperlayer];
    [self.preview removeFromSuperview];

    // 3. 遍历数据获取内容
    for (AVMetadataMachineReadableCodeObject *obj in metadataObjects) {
        // NSLog(@"obj: %@",obj.stringValue);
        self.label.text = obj.stringValue;
    }
}

@end
