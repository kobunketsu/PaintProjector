//
//  ShowPaintViewController.h
//  iReporter
//
//  Created by 文杰 胡 on 12-11-24.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

//名称:
//描述:
//功能:

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import "AVFoundation/AVFoundation.h"
#import "ShowPaint.h"
@interface ShowPaintViewController : UIViewController
    <AVCaptureVideoDataOutputSampleBufferDelegate>
{
    BOOL    _useFaceDetection;
    CALayer* leftEyeLayer;
    CALayer* rightEyeLayer;
    CALayer* mouthLayer; 
}
@property (nonatomic) BOOL isUsingFrontFacingCamera;
@property (nonatomic) BOOL isCameraScreenHidden;
@property (nonatomic, strong) AVCaptureVideoDataOutput *videoDataOutput;
@property (nonatomic) dispatch_queue_t videoDataOutputQueue;
@property (nonatomic, weak) IBOutlet ShowPaint *previewView;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *previewLayer;
@property (nonatomic, strong) UIImage *borderImage;
@property (nonatomic, strong) UIImage *eyeImage;
@property (nonatomic, strong) CIDetector *faceDetector;

- (void)setupAVCapture;
- (void)teardownAVCapture;
- (void)drawFaces:(NSArray *)features 
      forVideoBox:(CGRect)videoBox 
      orientation:(UIDeviceOrientation)orientation;

@end
