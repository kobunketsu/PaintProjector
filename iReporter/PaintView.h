//
//  PaintView.h
//  draw2D
//
//  Created by 文杰 胡 on 12-10-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Brush.h"
#import "EyeDropper.h"
#import "ImageStack.h"
#import "LayerDelegate.h"

#import "Ultility.h"
@class PaintScreen;

@protocol PaintViewDelegate
- (void) redoDisabled;
- (void) paintColorChanged:(UIColor*) resultColor;
@end

@interface PaintView : UIView 
{
    void * cacheBitmap;
    CGContextRef cacheContext;//存贮当前层描画前的内容    
    CGLayerRef cacheLayer;        

    CALayer* _brushLayer;
    void * brushBitmap;
    CGContextRef brushContext;        
    Brush *_brush;
    EyeDropper *_eyeDropper;

    ImageStack *_undoStack;
    ImageStack *_redoStack;
    CGImageRef _tempImage;
//    CGLayerRef _tempLayer;
    int _debugTouchBeganCount;
    int _debugTouchEndCount;    
    BOOL _touchEnded;//为了让undoHeap的最后一个image保证是最后描画的内容

    LayerDelegate *_layerDelegate;//作为处理层的代理
    CALayer *_curOperateLayer;
    BOOL _needReset;
}
@property(atomic, assign) BOOL isPanGestureRecognized;//触发手势后避免在走touch begin和touch end
@property(atomic, assign) BOOL isUndoDrawing;
@property(atomic, assign) BOOL isRedoDrawing;
@property(atomic, retain) UITouch *curTouch;//用于手势判断undo
@property(atomic, assign) CGPoint touchPoint;//用于处理长按识别的位置
@property(atomic, retain) EyeDropper *eyeDropper;
//@property(atomic, retain) Brush *brush;
@property(nonatomic, assign) id delegate;
@property(nonatomic, retain) UIImage* curTestImage;
@property(nonatomic, assign) CGImageRef layerImage;
@property(nonatomic, retain) GLKTextureInfo* paintTextureInfo;//opengl描画层
//- (void)drawToCacheFromLastPoint:(CGPoint)lastPoint NewPoint:(CGPoint)newPoint;
- (void)startDraw;
- (void)endDraw;
- (void)undoDraw;
- (void)endUndoDraw;
- (void)redoDraw;
- (void)setBrush:(Brush *)brush;
- (void)setCurLayerImage:(UIImage*) image;
- (void)CGImageWriteToFile:(CGImageRef)image :(NSString *)path;
- (void)testSave;
- (void)reset;

@end
