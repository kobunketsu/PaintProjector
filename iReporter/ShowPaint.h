//
//  ShowPaint.h
//  iReporter
//
//  Created by 文杰 胡 on 12-11-18.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

//名称:
//描述:
//功能:

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import <CoreMotion/CoreMotion.h>
#import "GPUImage.h"
//#import "PaintView.h"
#import "LayerDelegate.h"
@interface ShowPaint : UIView
{
    UIImage *filteredImage; 
    CALayer *_srcLayer3D;
    
    CMMotionManager *_motionManager;
    CMAttitude* _attitude;
    float _lastPitch;
    
    LayerDelegate *_layerDelegate;//作为处理层的代理    
}
@property (nonatomic, assign) CGImageRef sourceImage;
@property (nonatomic, assign) float lastPitch;
@property (nonatomic, assign) GLKVector3 deviceToEye;
@property (nonatomic, retain) CALayer* layer3D;
- (void)filterImage;
- (void)create3DImage;
- (CGPoint)projectPointOnRealPlane:(CGPoint)pointInFakeView;
- (CGPoint)projectPointOnFakePlane:(CGPoint)pointInRealView;
//- (void)setSourcePaintView:(PaintView*)paintView;
@end
