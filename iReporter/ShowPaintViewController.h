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
@property (strong, nonatomic) AVCaptureVideoDataOutput *videoDataOutput;
@property (nonatomic) dispatch_queue_t videoDataOutputQueue;
@property (weak, nonatomic) IBOutlet ShowPaint *previewView;
@property (strong, nonatomic) AVCaptureVideoPreviewLayer *previewLayer;
@property (strong, nonatomic) UIImage *borderImage;
@property (strong, nonatomic) UIImage *eyeImage;
@property (strong, nonatomic) CIDetector *faceDetector;

- (void)setupAVCapture;
- (void)teardownAVCapture;
- (void)drawFaces:(NSArray *)features 
      forVideoBox:(CGRect)videoBox 
      orientation:(UIDeviceOrientation)orientation;

@end
