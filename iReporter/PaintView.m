//
//  PaintView.m
//  draw2D
//
//  Created by 文杰 胡 on 12-10-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PaintView.h"

@implementation PaintView
//@synthesize brush = _brush;
@synthesize eyeDropper = _eyeDropper;
@synthesize touchPoint;
@synthesize isUndoDrawing;
@synthesize isRedoDrawing;
@synthesize isPanGestureRecognized;
@synthesize delegate;
@synthesize layerImage;
@synthesize paintTextureInfo;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    if (_needReset) {
        CGContextClearRect(brushContext, self.bounds);
        CGContextClearRect(cacheContext, self.bounds);
        _tempImage = CGBitmapContextCreateImage(cacheContext);
        CGContextDrawImage(ctx, self.bounds, _tempImage);
        CGImageRelease(_tempImage);
        _needReset = false;
        return;
    }
    
    CGContextSaveGState(ctx);
    
    if (self.isUndoDrawing) {//用上次描画touch down按下时保存下来的image覆盖context
        CGImageRef undoImage = [_undoStack lastUndoImage];
        CGContextDrawImage(ctx, self.bounds, undoImage);
        self.isUndoDrawing = false;         
    }
    else if (self.isRedoDrawing) {
        CGImageRef redoImage = [_redoStack pop];
        if (redoImage!=nil) {
            [_undoStack push:redoImage];
            CGContextDrawImage(cacheContext, self.bounds, redoImage);//保证下次touchBegan tempImage取道最新的cacheContext        
            CGContextDrawImage(ctx, self.bounds, redoImage);
            
        }   
        self.isRedoDrawing = false;
        
        //禁止redo功能
        if ([_redoStack size]==0) {
//            [delegate redoShouldDisabled];
        }
        
    }
    else {//把缓存画面清空，把按下前的画面描画上，再把刷新的笔刷画面描画上，然后把缓存画面画到屏幕上
BNRTimeBlock (^{//测试运行速度                
        CGContextSetInterpolationQuality(cacheContext, kCGInterpolationNone);
        CGContextSetInterpolationQuality(ctx, kCGInterpolationNone);        

        CGContextClearRect(cacheContext, self.bounds);//0.08

        CGContextSetAlpha(cacheContext, 1);            

        CGContextDrawImage(cacheContext, self.bounds, _tempImage);//0.01

//        CGImageRelease(_tempImage);

        CGContextSetAlpha(cacheContext, _brush.brushState.opacity);        

        //处理，确保layer的边缘没有描画上像素，防止clamp采样时取到边缘色。        
//        CGRect rect = CGRectMake(self.bounds.origin.x+1, self.bounds.origin.y+1, self.bounds.size.width-2, self.bounds.size.height-2);        

        CGImageRef brushImage = CGBitmapContextCreateImage(brushContext);
        CGContextDrawImage(cacheContext, self.bounds, brushImage);//0.02
    
        CGContextSetAlpha(cacheContext, 1);

        layerImage = CGBitmapContextCreateImage(cacheContext);//0.0003

//        layer.contents = (__bridge id)layerImage;
        CGContextDrawImage(ctx, self.bounds, layerImage);//0.01
});    

        if (_touchEnded) {
            [_undoStack push:CGBitmapContextCreateImage(cacheContext)];
            _touchEnded = false;
        }

    }
    
    //capture current ctx image
//    layerImage = CGBitmapContextCreateImage(cacheContext);    
//    CGColorSpaceRef colorspace = CGBitmapContextGetColorSpace(cacheContext);
//    CGBitmapInfo bi = CGBitmapContextGetBitmapInfo(cacheContext);
//    CGImageAlphaInfo ai = CGBitmapContextGetAlphaInfo(cacheContext);
    //    if(_brush.isDrawing){
    //        [_brush draw];        
    //    }
    if(_eyeDropper.isDrawing){
        [_eyeDropper draw];        
    }
   
    CGContextRestoreGState(ctx);    
              
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (void)setUp
{
    CGSize size = self.bounds.size;
	int bitmapByteCount;
	int	bitmapBytesPerRow;
    
	// Declare the number of bytes per row. Each pixel in the bitmap in this
	// example is represented by 4 bytes; 8 bits each of red, green, blue, and
	// alpha.
	bitmapBytesPerRow = (size.width * 4);
	bitmapByteCount = (bitmapBytesPerRow * size.height);
    
	// Allocate memory for image data. This is the destination in memory
	// where any drawing to the bitmap context will be rendered.
	cacheBitmap = malloc( bitmapByteCount );
	if (cacheBitmap == NULL){
		return;
	}
    
	brushBitmap = malloc( bitmapByteCount );
	if (brushBitmap == NULL){
		return;
	}    
    //使用kCGImageAlphaPremultipliedFirst来透出低层的GLKView
	cacheContext = CGBitmapContextCreate (cacheBitmap, size.width, size.height, 8, bitmapBytesPerRow, CGColorSpaceCreateDeviceRGB(), kCGImageAlphaPremultipliedFirst);
    CGContextSetFillColorWithColor(cacheContext, [[UIColor whiteColor] CGColor]);
    CGContextFillRect(cacheContext, self.bounds);
    
	brushContext = CGBitmapContextCreate (brushBitmap, size.width, size.height, 8, bitmapBytesPerRow, CGColorSpaceCreateDeviceRGB(), kCGImageAlphaPremultipliedFirst);
    CGContextSetFillColorWithColor(brushContext, [[UIColor whiteColor] CGColor]);
    CGContextFillRect(brushContext, self.bounds);
    
    [self setNeedsDisplay];
}

- (void)refreshCurLayer{
    [_curOperateLayer renderInContext:cacheContext];//will call drawLayerInContext    
    _tempImage = CGBitmapContextCreateImage(cacheContext);
    if (brushContext!=NULL) {
        CGContextClearRect(brushContext, self.bounds);    
    }
//    [_curOperateLayer setNeedsDisplay];        
}
- (void)setCurLayerImage:(UIImage*) image{
    _curOperateLayer.contents = (__bridge id)image.CGImage;        
    [self refreshCurLayer];
}

- (void)setCurLayer:(CALayer*)layer{
    _curOperateLayer = layer;
    [self refreshCurLayer];    
}


- (void)awakeFromNib
{
    [self setUp];
    _touchEnded = false;

    //测试图层 在图层
    _layerDelegate = [[LayerDelegate alloc] initWithView: self];
    CALayer *rootLayer = [self layer];
    rootLayer.name = @"rootLayer";
//    rootLayer.contents = (__bridge id)[UIImage imageNamed:@"3DImage03.jpg"].CGImage;
    
//    _brushLayer = [_layerDelegate addLayerWithName:@"brushLayer" Contents:nil InRect:self.bounds];

//    CATransform3D mat = CATransform3DIdentity;
//    mat.m34 = -1.0 / 100;
//    mat = CATransform3DRotate(mat, M_PI_4, 1, 0, 0);
//    layer.transform = mat;
    
//    CALayer* layer1 = [_layerDelegate addLayerWithName:@"subLayer1_3D" Contents:(__bridge id)[UIImage imageNamed:@"3DImage02.jpg"].CGImage InRect:CGRectMake(1, 1, 300, 400)];
    
    [self setCurLayer:rootLayer]; 
   
    //Undo Redo
    isRedoDrawing = false;
    isUndoDrawing = false;
    isPanGestureRecognized = false;
    _undoStack = [[ImageStack alloc]initWithCapacity:UndoMaxCount];//是否要检测初始化失败
    _redoStack = [[ImageStack alloc]initWithCapacity:UndoMaxCount];//是否要检测初始化失败    
    _tempImage = CGBitmapContextCreateImage(cacheContext);
    [_undoStack push:CGBitmapContextCreateImage(cacheContext)];         
    
    NSDictionary * options = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithBool:YES],
                              GLKTextureLoaderOriginBottomLeft, 
                              nil];    
    NSError * error;
    self.paintTextureInfo = [GLKTextureLoader textureWithCGImage:_tempImage options:options error:&error];   
}

- (void)setBrush:(Brush *)brush{
    _brush = brush;
//    [_brush setContext:brushContext];
}
- (void)undoDraw{
    if ([_undoStack size] <=1) {//初始化中保留一个初始image
        return;
    }
    //把undoStack的顶层的内容推到redoStack中    
    CGImageRef undoImage = [_undoStack pop];
    if (undoImage == nil) {
        return;
    }

    [_redoStack push:undoImage];    

    _tempImage = [_undoStack lastUndoImage];   

    //清除笔刷内容
    CGContextClearRect(brushContext, self.bounds);
    self.isUndoDrawing = true;
    self.isRedoDrawing = false;    
//    _brush.isDrawing = false;    
    [self setNeedsDisplay];
}
- (void)endUndoDraw{
}
- (void)redoDraw{
    if ([_redoStack size] == 0) {
        return;
    }    
    self.isRedoDrawing = true;
    self.isUndoDrawing = false;    
//    _brush.isDrawing = false;    
    [self setNeedsDisplay];
}
- (void)startDraw{
    if (brushContext!=NULL) {
        CGContextClearRect(brushContext, self.bounds);    
    }

    //重置undo redo状态
    self.isUndoDrawing = false;
    self.isRedoDrawing = false;
    [_redoStack clear];
//    [delegate redoShouldDisabled];
    //启动绘画，如果有长按，会在长按识别发生时关闭
//    _brush.isDrawing = true;    
    [_brush prepareWithBrushState:_brush.brushState];
    [_curOperateLayer setNeedsDisplay];
}
- (void)endDraw{
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *curTouch = [touches anyObject];
    _eyeDropper.position = _brush.position = _brush.lastDrawPoint = touchPoint = [curTouch locationInView:self];
    
    if (cacheContext!=NULL) {
        _tempImage = CGBitmapContextCreateImage(cacheContext);
    }

    [self startDraw];
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if (isUndoDrawing || isRedoDrawing) {
        return;
    }
    
    UITouch *curTouch = [touches anyObject];
    
    if (_eyeDropper.isDrawing) {
        [self updateEyeDropper:curTouch];
    }
    else {
//        _brush.isDrawing = true;        
        [self drawToCache:curTouch];
    }
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *curTouch = [touches anyObject];
    CGPoint newPoint = [curTouch locationInView:self];
    CGPoint lastPoint = [curTouch previousLocationInView:self];
    
    //单点绘画的延迟响应 只有在为移动的情况下
//    if(_brush.isDrawing && CGPointEqualToPoint(newPoint, lastPoint))
        [self drawToCache:curTouch];
    
    _touchEnded = true;
//    _brush.isDrawing = false;
    _eyeDropper.isDrawing = false;
    
    //get paintTexture
    NSDictionary * options = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithBool:YES],
                              GLKTextureLoaderOriginBottomLeft, 
                              nil];    
    NSError * error;     
    self.paintTextureInfo = [GLKTextureLoader textureWithCGImage:self.layerImage options:options error:&error];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{

}
- (void)updateEyeDropper:(UITouch*)touch{
    CGPoint newPoint = [touch locationInView:self];
    _eyeDropper.position = newPoint;    
    [delegate willChangePaintColorUI:[_eyeDropper colorOfPoint:newPoint]];
    [self setNeedsDisplay];    
}

- (void) drawToCache:(UITouch*)touch{
//    CGPoint lastPoint;CGPoint newPoint;
    
    _brush.position = [touch locationInView:self];
//    lastPoint = [touch previousLocationInView:self];
//    newPoint = [touch locationInView:self];        
//BNRTimeBlock (^{//测试运行速度                    
//    [_brush draw:lastPoint NewPoint:newPoint];//0.001
//});        
    [_curOperateLayer setNeedsDisplay];
}


- (void) drawRect:(CGRect)rect {
}
#pragma mark - utility
-(void)testSave{
    NSString *path = [@"/Users/kobunketsu0928/Desktop/public.png" stringByExpandingTildeInPath];
    [[Ultility sharedInstance] CGImageWriteToFile:layerImage :path];
}

-(void)reset{
    self.paintTextureInfo = nil;
    _needReset = true;

}
@end
