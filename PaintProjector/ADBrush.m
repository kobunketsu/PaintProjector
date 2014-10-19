//
//  Brush.m
//  PaintProjector
//
//  Created by 文杰 胡 on 12-10-28.
//  Copyright (c) 2012年 Hu Wenjie. All rights reserved.
//

#import "ADBrush.h"
#import "ADPaintView.h"
#import "REGLWrapper.h"
#import "ADHeap.h"

#define kPatternWidth 44
#define kPatternHeight 44
#define curveTesselateScale 0.25
#define curveFixJitterIter 20

@interface ADBrush()
#pragma mark- Core
@property (assign, nonatomic) CGFloat lastSegmentTailLength;//上一次片段未绘制的长度
@property (assign, nonatomic) CGFloat curSegmentLength;//当前片段的长度
@property (assign, nonatomic) CGFloat curSegmentSpeed;//当前片段对应速度(Length作为ControlPoint)
@property (retain, nonatomic) ADHeap *segmentLengths;//用来光滑笔刷大小变化

@property (assign, nonatomic) CGPoint lastStrokedPoint;//上一次绘制的点
@property (assign, nonatomic) size_t strokedSpriteCount;//当前一次绘制的数量

@property (assign, nonatomic) CGFloat curStrokedFade;//当前绘制结束放缩
@property (assign, nonatomic) CGFloat lastStrokedFade;//上一次绘制结束放缩
@end

@implementation ADBrush
+(void)setBrushStateTemplate:(ADBrushState*)brushState{
    //override by subclass
}
+(ADBrushState*)brushStateTemplate{
    return nil;
}
// first define the pattern width and height
- (id)copyWithZone:(NSZone *)zone{
    ADBrush *brush = [[[self class] alloc]init];
    brush.delegate = self.delegate;
    brush.name = self.name;
    brush.paintView = self.paintView;
    brush.brushState = [self.brushState copy];
    brush.lastSegmentEndPoint = self.lastSegmentEndPoint;
    brush.curSegmentEndPoint = self.curSegmentEndPoint;
    brush.curStrokedLength = self.curStrokedLength;
    brush.vertexBuffer = self.vertexBuffer;
    brush.shader = self.shader;
    brush.material = self.material;
    brush.patternTextureSize = self.patternTextureSize;
//brush destroy会连带一起destroy
    brush.shapeTexture = self.shapeTexture;
    brush.maskTexture = self.maskTexture;
    brush.patternTexture = self.patternTexture;
    brush.smudgeTexture = self.smudgeTexture;
    brush.smudgeBackTexture = self.smudgeBackTexture;
//brush destroy会连带一起destroy
    brush.radiusSliderMaxValue = self.radiusSliderMaxValue;
    brush.radiusSliderMinValue = self.radiusSliderMinValue;
    brush.canvasSize = self.canvasSize;
    return brush;
}

//绘制笔刷
- (id)initWithPaintView:(ADPaintView*)paintView delegate:(id)delegate{
    self = [super init];
    if (self !=nil) {
        _paintView = paintView;
        self.delegate = delegate;
      
        //Param
        _brushState = [[ADBrushState alloc]init];
        [self resetDefaultBrushState];
        
        _lastSegmentEndPoint = _lastStrokedPoint = CGPointZero;
        _lastSegmentTailLength = 0;
        
        _segmentLengths = [[ADHeap alloc]initWithCapacity:curveFixJitterIter];
        
        //UI
        [self setColor: [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0]];
        [self setRadiusSliderValue];
    }

    return self;
}
- (void)initGL{
    //Shader
//    _shaderPreDefines = @"";
//    if(![self loadShader]){
//        DebugLogError(@"Brush init loadShader failed");
//    }

    _shader = (ADShaderBrush*)[[REGLWrapper current] createShader:@"ADShaderBrush"];
    _material = [[REMaterial alloc]initWithShader:_shader];
    
    [self setCanvasSize:self.paintView.bounds.size];
    
    [self resetDefaultTextures];
    
}
- (void)tearDownGL{
    DebugLogFuncStart(@"tearDownGL");
    [EAGLContext setCurrentContext:[REGLWrapper current].context];
    
    //shared gl resource take careful!!!
    [self.maskTexture destroy];
    self.maskTexture = nil;
    [self.shapeTexture destroy];
    self.shapeTexture = nil;
    [self.patternTexture destroy];
    self.patternTexture = nil;

    [self deleteSmudgeFramebuffers];
    
    [self.material destroy];
    self.material = nil;
    
//    [[REGLWrapper current] deleteProgram:_programBrush];
}
- (NSString*)name{
    return @"nil";
}

- (BOOL)isEditable{
    return true;
}

- (void)setCanvasSize:(CGSize)canvasSize{
    _canvasSize = canvasSize;
    
    //reset shader uniform
    _projectionMat[0] = 2.0 / _canvasSize.width;
    _projectionMat[1] = 0.0;
    _projectionMat[2] = 0.0;
    _projectionMat[3] = -1.0;
    
    _projectionMat[4] = 0.0;
    _projectionMat[5] = 2.0 / _canvasSize.height;
    _projectionMat[6] = 0.0;
    _projectionMat[7] = -1.0;
    
    _projectionMat[8] = 0.0;
    _projectionMat[9] = 0.0;
    _projectionMat[10] = -1.0;
    _projectionMat[11] = 0.0;
    
    _projectionMat[12] = 0.0;
    _projectionMat[13] = 0.0;
    _projectionMat[14] = 0.0;
    _projectionMat[15] = 1.0;
    
    
    [[REGLWrapper current] useProgram:self.material.shader.program uniformBlock:^{
        GLKMatrix4 projMat = GLKMatrix4MakeWithArray(_projectionMat);
        [self.material setMatrix:projMat forPropertyName:@"Projection"];
    }];
}

- (void)setPaintView:(ADPaintView *)paintView{
    _paintView = paintView;
}

- (void)setBlendModeWithBrushState:(ADBrushState*)brushState{
    if (brushState.isOpacityLocked) {
        [[REGLWrapper current] blendFunc:BlendFuncAlphaBlendLocked];
    }
    else{
        [[REGLWrapper current] blendFunc:BlendFuncAlphaBlend];
    }

}

- (CGFloat)radius {
    return _brushState.radius;
}

- (void)setRadius:(CGFloat)newValue {
    _brushState.radius = newValue;
}

- (void)setRadiusSliderValue{
    _radiusSliderMinValue = 1.0;
    _radiusSliderMaxValue = 100;
}

- (void)startDraw:(CGPoint)startLocation{
//    DebugLog(@"startDraw");
    [self.segmentLengths clear];
    self.curStrokedLength = 0;
    self.lastSegmentTailLength = 0;
    self.lastStrokedPoint = self.lastSegmentEndPoint = self.curSegmentEndPoint = startLocation;
    self.curSegmentLength = 0;
    self.lastStrokedFade = self.curStrokedFade = 1.0;
    
    CFAbsoluteTime absTime = CFAbsoluteTimeGetCurrent();
    //    DebugLog(@"Seed %.3f", absTime);
    self.brushState.seed  = (int)(absTime*5);//0.2s min time interval between paint commands
    //    DebugLog(@"startDraw _brushState.seed %d", self.brush.brushState.seed);
}

- (void)endDraw{

}

-(BOOL)compareBrushState:(ADBrushState*)bs1 withBrushState:(ADBrushState*)bs2{
    if (bs1 == NULL || bs2 == NULL) {
        return false;
    }
    if (bs1.classId != bs2.classId) {
        return false;
    }
    if (bs1.seed != bs2.seed) {
        return false;
    }
    if (bs1.isShapeTexture != bs2.isShapeTexture) {
        return false;
    }
    if (bs1.isPatternTexture != bs2.isPatternTexture) {
        return false;
    }
    if (bs1.isAirbrush != bs2.isAirbrush) {
        return false;
    }
    if (bs1.isVelocitySensor != bs2.isVelocitySensor) {
        return false;
    }
    if (bs1.isRadiusMagnifySensor != bs2.isRadiusMagnifySensor) {
        return false;
    }
    if (bs1.radius != bs2.radius) {
        return false;
    }
    if (bs1.radiusJitter != bs2.radiusJitter) {
        return false;
    }
    if (bs1.radiusFade != bs2.radiusFade) {
        return false;
    }
    if (bs1.hardness != bs2.hardness) {
        return false;
    }
    if (bs1.roundness != bs2.roundness) {
        return false;
    }
    if (bs1.angle != bs2.angle) {
        return false;
    }
    if (bs1.angleJitter != bs2.angleJitter) {
        return false;
    }
    if (bs1.angleFade != bs2.angleFade) {
        return false;
    }
    if (bs1.opacity != bs2.opacity) {
        return false;
    }
    if (bs1.flow != bs2.flow) {
        return false;
    }
    if (bs1.flowJitter != bs2.flowJitter) {
        return false;
    }
    if (bs1.flowFade != bs2.flowFade) {
        return false;
    }
    if (bs1.spacing != bs2.spacing) {
        return false;
    }
    if (bs1.scattering != bs2.scattering) {
        return false;
    }
    if (bs1.wet != bs2.wet) {
        return false;
    }
    if (!CGColorEqualToColor(bs1.color.CGColor, bs2.color.CGColor)) {
        return false;
    }
    return true;
}

//- (void)prepareNewWithBrushState:(BrushState*)brushState lastBrushState:(BrushState*)lastBrushState{
//    glBindProgramPipelineEXT(_ppo);
//    [[REGLWrapper current] useProgram:0 uniformBlock:nil];
//    
//    UIColor* color = brushState.color;
//    [color getRed:&_red green:&_green blue:&_blue alpha:&_alpha];
//    
//    if (self.brushState.wet > 0){
//        //if use gl_LastFragData, please use glBlendFuncSeparate(GL_ONE, GL_ZERO, GL_ONE, GL_ONE_MINUS_SRC_ALPHA)
//        [[REGLWrapper current] blendFunc:BlendFuncOpaque];
//    }
//    else{
//        //draw to brushbuffer
//        [[REGLWrapper current] blendFunc:BlendFuncOpaqueAlphaBlend];
//    }
//    
//    glProgramUniformMatrix4fvEXT(_vertexProgram, _projectionUniform, 1, GL_FALSE, _projectionMat);
//    glProgramUniform4fEXT(_vertexProgram, _paramsUniform, 0, brushState.hardness, brushState.roundness, brushState.wet);
//    glProgramUniform4fEXT(_fragmentProgram, _params2Uniform, (float)brushState.isShapeTexture, (float)brushState.isDissolve, brushState.wet, 0);
//    
//    //srcAlpha + (1 - srcAlpha) * dstAlpha --> no overrideAlpha
//    //not bind to texture0. texture0 is used for drawQuad
//    if (self.brushState.isShapeTexture) {
//        //设置发生了改变
//        if (lastBrushState == NULL || self.brushState.classId != lastBrushState.classId || !lastBrushState.isShapeTexture) {
//            [[REGLWrapper current] activeTexSlot:GL_TEXTURE1 bindTexture:_shapeTexture];
//            glProgramUniform1iEXT(_fragmentProgram, _maskTextureUniform, 1);
//        }
//    }
//    else{
//        //设置发生了改变
//        if (lastBrushState == NULL || self.brushState.classId != lastBrushState.classId || lastBrushState.isShapeTexture) {
//            [[REGLWrapper current] activeTexSlot:GL_TEXTURE1 bindTexture:_maskTexture];
//            glProgramUniform1iEXT(_fragmentProgram, _maskTextureUniform, 1);
//        }
//    }
//    
//    
//    if (self.brushState.isDissolve) {
//        //设置发生了改变
//        if (lastBrushState == NULL || self.brushState.classId != lastBrushState.classId || !lastBrushState.isDissolve) {
//            [[REGLWrapper current] activeTexSlot:GL_TEXTURE2 bindTexture:_noiseTexture];
//            glProgramUniform1iEXT(_fragmentProgram, _noiseTextureUniform, 2);
//        }
//    }
//    
//    if (self.brushState.wet > 0){
//        //设置发生了改变
//        if (lastBrushState == NULL || self.brushState.classId != lastBrushState.classId || lastBrushState.wet < 0.001) {
//            [[REGLWrapper current] activeTexSlot:GL_TEXTURE0 bindTexture:_smudgeTexture];
//            glProgramUniform1iEXT(_fragmentProgram, _smudgeTextureUniform, 0);
//        }
//    }
//}

- (void)prepareWithBrushState:(ADBrushState*)brushState lastBrushState:(ADBrushState*)lastBrushState{
    //TODO:优化命令，减少redunt命令
    [[REGLWrapper current] useProgram:self.material.shader.program uniformBlock:^{
        //    glUniformMatrix4fv( _projectionUniform, 1, GL_FALSE, _projectionMat); use default
        
        //第一次设置 ，或者切换brush种类，或者brush属性发生变化，都设置uniforms
        if (lastBrushState == NULL ||
            brushState.classId != lastBrushState.classId ||
            brushState.isOpacityLocked != lastBrushState.isOpacityLocked ||
            brushState.hardness != lastBrushState.hardness ||
            brushState.roundness != lastBrushState.roundness ||
            brushState.wet != lastBrushState.wet) {
//            DebugLogWarn(@"prepareWithBrushState brushState.wet %.1f", brushState.wet);
            float opacityLock = ((ADPaintLayer*)(self.paintView.paintData.layers[self.paintView.paintData.curLayerIndex])).opacityLock ? 1.0 : 0.0;
            [self.material setVector:GLKVector4Make(opacityLock, brushState.hardness, brushState.roundness, brushState.wet) forPropertyName:@"Params"];
        }
        
        if (lastBrushState == NULL ||
            brushState.classId != lastBrushState.classId ||
            brushState.isShapeTexture != lastBrushState.isShapeTexture ||
            brushState.isPatternTexture != lastBrushState.isPatternTexture ||
            brushState.wet != lastBrushState.wet) {
            [self.material setVector:GLKVector4Make((float)brushState.isShapeTexture, (float)brushState.isPatternTexture, brushState.wet, self.patternTextureSize) forPropertyName:@"ParamsExtend"];
        }
        
        //srcAlpha + (1 - srcAlpha) * dstAlpha --> no overrideAlpha
        //not bind to texture0. texture0 is used for drawQuad
        if (brushState.isShapeTexture) {
            
            //设置发生了改变
            if (lastBrushState == NULL || brushState.classId != lastBrushState.classId || !lastBrushState.isShapeTexture) {
                [self.material setTexture:_shapeTexture atIndex:1 forPropertyName:@"maskTexture"];
                [[REGLWrapper current] setImageInterpolation:Interpolation_Nearest];
            }
        }
        else{
            
            //设置发生了改变
            if (lastBrushState == NULL || brushState.classId != lastBrushState.classId || lastBrushState.isShapeTexture) {
                [self.material setTexture:_maskTexture atIndex:1 forPropertyName:@"maskTexture"];
                [[REGLWrapper current] setImageInterpolation:Interpolation_Nearest];
            }
        }
        
        
        if (brushState.isPatternTexture) {
            
            //设置发生了改变
            if (lastBrushState == NULL || brushState.classId != lastBrushState.classId || !lastBrushState.isPatternTexture) {
                [self.material setTexture:_patternTexture atIndex:2 forPropertyName:@"patternTexture"];
                [[REGLWrapper current] setImageInterpolation:Interpolation_Nearest];
                [[REGLWrapper current] setImageWrapMode:WrapMode_Repeat];
                
            }
        }
        
        if (brushState.wet > 0){
            
            //设置发生了改变
            if (lastBrushState == NULL || brushState.classId != lastBrushState.classId || lastBrushState.wet < 0.001) {
                [self.material setTexture:_smudgeTexture atIndex:0 forPropertyName:@"smudgeTexture"];
                [[REGLWrapper current] setImageInterpolation:Interpolation_Nearest];
                
            }
        }
    }];
    
    UIColor* color = brushState.color;
    [color getRed:&_red green:&_green blue:&_blue alpha:&_alpha];
    
    if (brushState.wet > 0){
        //if use gl_LastFragData, please use glBlendFuncSeparate(GL_ONE, GL_ZERO, GL_ONE, GL_ONE_MINUS_SRC_ALPHA)
        [[REGLWrapper current] blendFunc:BlendFuncOpaque];
    }
    else{
        //draw to brushbuffer
        [[REGLWrapper current] blendFunc:BlendFuncOpaqueAlphaBlend];
    }
    
    [[REGLWrapper current] bindVertexArrayOES: self.paintView.VAOBrush];
    [[REGLWrapper current] bindBuffer:self.paintView.VBOBrush];
//    DebugLogWarn(@"prepareWithBrushState glMapBufferOES");
    self.vertexBuffer = (BrushVertex *)glMapBufferOES(GL_ARRAY_BUFFER, GL_WRITE_ONLY_OES);
}

-(void) setBrushShapeTexture:(NSString*)textureName{
    if (!textureName) {
        self.brushState.isShapeTexture = false;
        return;
    }
    _shapeTexture = [RETexture textureFromImageName:textureName reload:false];
    self.brushState.isShapeTexture = (_shapeTexture != nil);
}

-(void) setBrushCommonTextures
{
    _maskTexture = [RETexture textureFromImageName:@"brushSoftFallOff.png" reload:false];
    
}

- (void)setPatternTextureWithImage:(NSString*)patterName{
    if (!patterName) {
        self.brushState.isPatternTexture = false;
        return;
    }
    _patternTexture = [RETexture textureFromImageName:patterName reload:false];
    self.brushState.isPatternTexture = (_patternTexture != nil);
    self.patternTextureSize = _patternTexture.width;
}

-(void)dealloc{
}

- (UIColor *)color {
    return _brushState.color;
}

- (void)setColor:(UIColor *)newValue {
    _brushState.color = [newValue copy];
    
    if (self.delegate) {
        [self.delegate willBrushColorChanged:self];
    }

}

//计算一次点到点绘制需要的数量
- (size_t)numOfSegmentPointFromStart:(CGPoint)start toEnd:(CGPoint)end brushState:(ADBrushState*)brushState isTapDraw:(BOOL)isTapDraw{
//    DebugLogFuncUpdate(@"numOfSegmentPointFromStart from %@ to %@ isTapDraw %i", NSStringFromCGPoint(start), NSStringFromCGPoint(end), isTapDraw);
    
    size_t numOfSegmentPoint;
    if (isTapDraw) {
        return 1;
    }
    
// Convert locations from Points to Pixels
//	CGFloat scale = self.contentScaleFactor;
//	start.x *= scale;
//	start.y *= scale;
//	end.x *= scale;
//	end.y *= scale;
    
	//当前描画点
    self.curSegmentEndPoint = CGPointMake((start.x + end.x)*0.5, (start.y + end.y)*0.5);
//    DebugLog(@"renderSegment lastSegmentEndPoint x:%.0f y:%.0f | start x:%.0f y:%.0f | curSegmentEndPoint x:%.0f y:%.0f | end x:%.0f y:%.0f", self.lastSegmentEndPoint.x, self.lastSegmentEndPoint.y, start.x, start.y, self.curSegmentEndPoint.x, self.curSegmentEndPoint.y, end.x, end.y);

    //绘制间隔
    CGFloat spacing = brushState.radius * 2 * brushState.spacing;
    //    DebugLog(@"radius %.2f spacing %.2f spaceThresold %.2f", brushState.radius, brushState.spacing, spaceThresold);
    
	//绘图距离
    //根据spaceing来确定需要多少step来计算曲线长度
    CGFloat lengthForStep = [ADMathHelper lengthFromPoint:self.lastSegmentEndPoint toPoint:start];
    lengthForStep += [ADMathHelper lengthFromPoint:start toPoint:self.curSegmentEndPoint];
    NSUInteger numOfStep = (NSUInteger)ceilf(lengthForStep / spacing * curveTesselateScale);

    self.curSegmentLength = [ADMathHelper beizerLengthSteps:numOfStep start:self.lastSegmentEndPoint control:start end:self.curSegmentEndPoint];
    [self.segmentLengths push:[NSNumber numberWithFloat:self.curSegmentLength]];
    
    //调整
    CGFloat adjustSegmentLength = self.curSegmentLength + self.lastSegmentTailLength;
    numOfSegmentPoint = (size_t)floorf(adjustSegmentLength / spacing);
    
    CGFloat adjustSpacing;
    //如果超过了点数限制，重新分配临时的adjustedSpace
    if(numOfSegmentPoint > self.paintView.vertexBrushMaxCount){
        adjustSpacing = adjustSegmentLength / self.paintView.vertexBrushMaxCount;
    }
    else{
        adjustSpacing = spacing;
    }
    //当前需要描绘的点数
    numOfSegmentPoint = (size_t)floor(adjustSegmentLength / adjustSpacing);
    
    //当前描绘后留下的尾巴长度
    self.lastSegmentTailLength = fmodf(adjustSegmentLength, adjustSpacing);
//    DebugLogWarn(@"segmentLength %.1f adjustSegmentLength %.1f adjustSpacing %.1f segmentTailLenth %.1f ", self.curSegmentLength, adjustSegmentLength, adjustSpacing, self.lastSegmentTailLength);
    
    //绘制数量
    if(self.brushState.isAirbrush){
        numOfSegmentPoint = MAX(1, numOfSegmentPoint);
    }

    [self mapSegmentLengthToSegmentSpeed];
    
//    DebugLog(@"numOfSegmentPointFromStart %lu", numOfSegmentPoint);
    return numOfSegmentPoint;
}

- (void)mapSegmentLengthToSegmentSpeed{

    CGFloat averageLength = 0;
    for (int i = 0; i < self.segmentLengths.contents.count; ++i) {
        averageLength += ((NSNumber *)self.segmentLengths.contents[i]).floatValue;
    }
    averageLength /= (CGFloat)self.segmentLengths.contents.count;
    
    self.curSegmentSpeed = averageLength;
}
/*
adjustSegmentLength = segmentLength + lastSegmentTailLenth;
numOfSegmentPoint = floor(adjustSegmentLength / space);
 
//如果超过了点数限制，重新分配临时的adjustedSpace
 if(numOfSegmentPoint > numOfSegmentPointMax){
    adjustSpace = adjustSegmentLength / numOfSegmentPointMax;
 }
 else{
    adjustSpace = space;
 }
 //当前理论上需要描绘的点数
 numOfSegmentPoint = floor(adjustSegmentLength / adjustSpace)
 
 //当前描绘后留下的尾巴长度
 lastSegmentTailLenth = adjustSegmentLength % adjustSpace;
 
//确定原始segment的t()的初始值
segmentPoint = (adjustSpace - lastSegmentTailLenth);
 for(int i = 0; i < numOfSegmentPoint; ++i){
    //确定t的值
    t = segmentPoint / segmentLength;
 
    position = beizeCurve(t, ...);
 
    segmentPoint += adjustSpace;
 }
 */

- (void)fillDataFromPoint:(CGPoint)start toPoint:(CGPoint)end segmentOffset:(int)segmentOffset brushState:(ADBrushState*)brushState isTapDraw:(BOOL)isTapDraw isImmediate:(BOOL)isImmediate
{
    DebugLogFuncUpdate(@"fillDataFromPoint startPoint %@ endPoint %@", NSStringFromCGPoint(start), NSStringFromCGPoint(end));
    size_t numOfSegmentPoint = [self numOfSegmentPointFromStart:start toEnd:end brushState:brushState isTapDraw:isTapDraw];
//    DebugLogWarn(@"numOfSegmentPoint %zu", numOfSegmentPoint);
    //绘图Fade
    if (self.brushState.isVelocitySensor) {
        if (self.brushState.isRadiusMagnifySensor) {
            CGFloat strokeFadeScale = 4.0;
            CGFloat curStrokedFade = MAX(self.curSegmentSpeed / strokeFadeScale, 1.0);
            if (curStrokedFade < self.lastStrokedFade) {
                self.curStrokedFade = MAX(curStrokedFade, self.lastStrokedFade - 1.0 / self.brushState.radius);
            }
            else if(curStrokedFade > self.lastStrokedFade) {
                self.curStrokedFade = MIN(curStrokedFade, self.lastStrokedFade + 1.0 / self.brushState.radius);
            }
        }
        else{
            //max: atan(-paintDistance/30.0+0.5) = 2 - M_PI/2 = 0.43 (25 degree)--> -paintDistance/30.0 ~ 0
            //min: atan(-paintDistance/30.0+0.5) = - M_PI/2 = -1.57 (-90 degree)--> paintDistance ~ 60(2.07 * 30)
            self.curStrokedFade = (atan(-self.curSegmentSpeed/15 + 0.5) + M_PI/2) / 2;
//            self.curStrokedFade = (atan(-self.curStrokedLength/120 + 2) + M_PI/2) / 2;
            DebugLog(@"curStrokedFade %.1f", self.curSegmentSpeed);
        }
    }
    
    [self fillSegmentBezierOrigin:self.lastSegmentEndPoint Control:start Destination:self.curSegmentEndPoint Count:numOfSegmentPoint segmentOffset:segmentOffset brushState:brushState isImmediate:isImmediate];
    
    //更新smudgeTexture
    if (self.brushState.wet > 0) {
        //save temp texture for next draw smudge texture 拷贝吸取位置的贴图
        //time consume.if move too fast, count is high, thread will invoke a lot of update brush smudge texture. next drawElement should not be drawn until this operation is finished
        [self.delegate willUpdateSmudgeTextureWithBrushState:brushState location:self.lastSegmentEndPoint];
    }
    
    self.lastSegmentEndPoint = self.curSegmentEndPoint;
    self.lastStrokedFade = self.curStrokedFade;
}


-(void)fillSegmentBezierOrigin:(CGPoint) origin Control:(CGPoint) control Destination:(CGPoint) destination Count:(size_t) count segmentOffset:(int)segmentOffset brushState:(ADBrushState*)brushState isImmediate:(BOOL)isImmediate
{
    
    //计算vertex data
    float x, y;
    float t = 0.0;
//    DebugLog(@"fillSegment fromDrawPoint %@ toDrawPoint %@ currentCount %lu lastAllDrawSpriteCount %lu", NSStringFromCGPoint(origin), NSStringFromCGPoint(destination), count, self.strokedSpriteCount);

    //非匀速绘制
    for(int i = 0; i < count; i++,t += 1.0 / (count))
    {
        //计算绘制的位置
        x = [ADMathHelper beizerValueT:t start:origin.x control:control.x end:destination.x];
        y = [ADMathHelper beizerValueT:t start:origin.y control:control.y end:destination.y];
        
        //计算绘制的距离
        self.curStrokedLength += [ADMathHelper lengthFromPoint:CGPointMake(x, y) toPoint:self.lastStrokedPoint];
//        DebugLogWarn(@"curStrokedLength %.1f", self.curStrokedLength);
        
        //散布Scattering
        float randX = (float)(random() % 50) / 50.0f;
        float randY = (float)(random() % 50) / 50.0f;
        
        x += (randX * 2 - 1) * brushState.radius * brushState.scattering * 0.5;
        y += (randY * 2 - 1) * brushState.radius * brushState.scattering * 0.5;
        
        //半径
        float radius;
        float radiusFade;

        //速度敏感
        if (self.brushState.isVelocitySensor){
            //lerp(self.lastDrawFade, self.curDrawFade, i / count)
            float lerp = (float) i / (float)count;
            radiusFade = self.curStrokedFade * lerp + (1.0 - lerp) * self.lastStrokedFade;
        }
        else{
            if (self.brushState.radiusFade > 0) {
                radiusFade = MAX(self.brushState.radiusFade - self.curStrokedLength, 0) / self.brushState.radiusFade;
            }
            else {
                radiusFade = 1.0;
            }
        }
//        DebugLog(@"fade %.1f", radiusFade);
        radius = brushState.radius * (1 - randX * brushState.radiusJitter) * radiusFade;
        
        
        //流量
        float flowFade;
        if (self.brushState.flowFade != 0) {
            flowFade = MAX(self.brushState.flowFade - self.curStrokedLength, 0) / self.brushState.flowFade;
        }
        else{
            flowFade = 1.0;
        }
        float flow = brushState.flow * (1 - randX * brushState.flowJitter) * flowFade;
        
        //角度
        float angleFade;
        if (self.brushState.angleFade != 0) {
            angleFade = MAX(self.brushState.angleFade - self.curStrokedLength, 0) / self.brushState.angleFade;
        }
        else{
            angleFade = 1.0;
        }
        float angle = brushState.angle * (1 - randX * brushState.angleJitter) * angleFade;
        
        int index = self.strokedSpriteCount + i;
        
        //TODO:是否需要在点模式下开启捕捉像素点功能
        
        //检查越界导致的crash
        if (index >= self.paintView.curVertexBrushCount) {
            [RemoteLog log:[NSString stringWithFormat:@"self.vertexBuffer alloc count %zu index %d", self.paintView.curVertexBrushCount, index]];
            //FIXME: 暂时跳过
            continue;
        }

        self.vertexBuffer[index].Position[0] = x;
        self.vertexBuffer[index].Position[1] = y;
        self.vertexBuffer[index].Position[2] = radius * 2;
        self.vertexBuffer[index].Position[3] = DEGREES_TO_RADIANS(angle);   //angle
        
        // Set the brush color using premultiplied alpha values
        //rgb上不做premultiplied，在最后的合成做
        self.vertexBuffer[index].Color[0] = _red;
        self.vertexBuffer[index].Color[1] = _green;
        self.vertexBuffer[index].Color[2] = _blue;
        self.vertexBuffer[index].Color[3] = _alpha * flow;
        

        
//        DebugLog(@"fill vertex index:%d x:%.1f y:%.1f", index, self.vertexBuffer[index].Position[0], self.vertexBuffer[index].Position[1]);
        
        //lastDrawPoint使用完毕，更新lastDrawPoint,
        //更新执行的速度可能快于上一次取贴图，导致取到的数值是错误的
        self.lastStrokedPoint = CGPointMake(x, y);
    }
    
    //allDrawSpriteCount累加count
    self.strokedSpriteCount += count;
}


//Consider using multiple buffer objects to avoid stalling the rendering pipeline during data store updates. If any rendering in the pipeline makes reference to data in the buffer object being updated by glBufferSubData, especially from the specific region being updated, that rendering must drain from the pipeline before the data store can be updated.
-(void)renderImmediate:(BOOL)isImmediate{
//    DebugLog(@"renderImmediate");
    
    //绘制内容前Unmap显卡
//    DebugLogWarn(@"renderImmediate glUnmapBufferOES");
    glUnmapBufferOES(GL_ARRAY_BUFFER);
    
    //GPU还未完成绘制时，下一个CPU使用 glBufferSubData可能导致stalling
    if (self.strokedSpriteCount > 0) {
        size_t count = self.strokedSpriteCount;
        DebugLogGL(@"glDrawArrays allDrawSpriteCount %lu", count);
        glDrawArrays(GL_POINTS, 0, count);
//        DebugLogGL(@"-----------------------------------Draw-----------------------------------");

        self.strokedSpriteCount = 0;
        
        [self.paintView swapVBO];
    }
    else{
        //引起Inefficient State Update
    }
//    glFlush(); 引起Logical Buffer Store问题
}


//- (BOOL)loadShaderNew
//{
//    const GLchar *source;
//    NSString *vertShaderPathname, *fragShaderPathname;
//    NSString *fileStr;
//    
//    //vertex shader
//    vertShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shaders/ShaderBrush" ofType:@"vsh"];
//    fileStr = [NSString stringWithContentsOfFile:vertShaderPathname encoding:NSUTF8StringEncoding error:nil];
//    source = (GLchar *)[fileStr UTF8String];
//    _vertexProgram = glCreateShaderProgramvEXT(GL_VERTEX_SHADER, 1, &source);
//    
//    glBindAttribLocation(_vertexProgram, GLKVertexAttribPosition, "Position");
//    glBindAttribLocation(_vertexProgram, GLKVertexAttribColor, "SourceColor");
//    _projectionUniform = glGetUniformLocation(_vertexProgram, "Projection");
//    _paramsUniform = glGetUniformLocation(_vertexProgram, "Params");
//    
//    //fragment shader
//    fragShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shaders/ShaderBrush" ofType:@"fsh"];
//    fileStr = [NSString stringWithContentsOfFile:fragShaderPathname encoding:NSUTF8StringEncoding error:nil];
//    source = (GLchar *)[fileStr UTF8String];
//    _fragmentProgram =  glCreateShaderProgramvEXT(GL_FRAGMENT_SHADER, 1, &source);
//    
//    _maskTextureUniform = glGetUniformLocation(_fragmentProgram, "maskTexture");
//    _noiseTextureUniform = glGetUniformLocation(_fragmentProgram, "noiseTexture");
//    _smudgeTextureUniform = glGetUniformLocation(_fragmentProgram, "smudgeTexture");
//    _params2Uniform = glGetUniformLocation(_fragmentProgram, "ParamsExtend");
//    
//    
//    // Construct a program pipeline object and configure it to use the shaders
//    glGenProgramPipelinesEXT(1, &_ppo);
//    glBindProgramPipelineEXT(_ppo);
//    glUseProgramStagesEXT(_ppo, GL_VERTEX_SHADER_BIT_EXT, _vertexProgram);
//    glUseProgramStagesEXT(_ppo, GL_FRAGMENT_SHADER_BIT_EXT, _fragmentProgram);
//    
//    return YES;
//}


//- (BOOL)loadShader
//{
//    __block GLuint vertShader, fragShader;
//    __block NSString *vertShaderPathname, *fragShaderPathname;
//    __block NSString *programBrushLabel = [NSString stringWithFormat:@"programBrush%@", self.class];
//    
//    // Create shader program.
//    if(_programBrush == 0){
//        GLuint program = glCreateProgram();
//        _programBrush = program;
//#if DEBUG
//        glLabelObjectEXT(GL_PROGRAM_OBJECT_EXT, program, 0, [programBrushLabel UTF8String]);
//#endif
//        
//        //preprocess define
//        //    if (self.brushState.isShapeTexture) {
//        //        self.shaderPreDefines = [self.shaderPreDefines stringByAppendingString:@"|Pattern"];
//        //    }
//        //    if (self.brushState.isDissolve) {
//        //        self.shaderPreDefines = [self.shaderPreDefines stringByAppendingString:@"|Dissolve"];
//        //    }
//        //    if (self.brushState.wet > 0) {
//        //        self.shaderPreDefines = [self.shaderPreDefines stringByAppendingString:@"|Smudge"];
//        //    }
//        
//        // Create and compile vertex shader.
//        vertShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shaders/ShaderBrush" ofType:@"vsh"];
//        if (![[REGLWrapper current] compileShader:&vertShader type:GL_VERTEX_SHADER file:vertShaderPathname preDefines:self.shaderPreDefines]) {
//            DebugLog(@"Failed to compile vertex shader");
//            return NO;
//        }
//        
//        // Create and compile fragment shader.
//        fragShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shaders/ShaderBrush" ofType:@"fsh"];
//        if (![[REGLWrapper current] compileShader:&fragShader type:GL_FRAGMENT_SHADER file:fragShaderPathname preDefines:self.shaderPreDefines]) {
//            DebugLog(@"Failed to compile fragment shader");
//            return NO;
//        }
//        
//        // Attach vertex shader to program.
//        glAttachShader(program, vertShader);
//        
//        // Attach fragment shader to program.
//        glAttachShader(program, fragShader);
//        
//        // Bind attribute locations.
//        // This needs to be done prior to linking.
//        glBindAttribLocation(program, GLKVertexAttribPosition, "Position");
//        glBindAttribLocation(program, GLKVertexAttribColor, "SourceColor");
//        
//        // Link program.
//        if (![[REGLWrapper current] linkProgram:program]) {
//            DebugLog(@"Failed to link program: %d", program);
//            
//            if (vertShader) {
//                glDeleteShader(vertShader);
//                vertShader = 0;
//            }
//            if (fragShader) {
//                glDeleteShader(fragShader);
//                fragShader = 0;
//            }
//            if (program) {
//                glDeleteProgram(program);
//                program = 0;
//            }
//            
//            return NO;
//        }
//        
//        // Get uniform locations.
//        _smudgeTextureUniform = glGetUniformLocation(program, "smudgeTexture");
//        _maskTextureUniform = glGetUniformLocation(program, "maskTexture");
//        _patternTextureUniform = glGetUniformLocation(program, "patternTexture");
//        _paramsUniform = glGetUniformLocation(program, "Params");
//        _params2Uniform = glGetUniformLocation(program, "ParamsExtend");
//        _projectionUniform = glGetUniformLocation(program, "Projection");
//        
//        // Release vertex and fragment shaders.
//        if (vertShader) {
//            glDetachShader(program, vertShader);
//            glDeleteShader(vertShader);
//        }
//        if (fragShader) {
//            glDetachShader(program, fragShader);
//            glDeleteShader(fragShader);
//        }
//        
//    }
//    
//    if (_programBrush == 0) {
//        return NO;
//    }
//    else{
//        return YES;
//    }
//}


- (void)resetDefaultBrushState{
    self.brushState.opacity = 1;
    self.brushState.flow = 0.25;
    self.brushState.flowJitter = 0.0;
    self.brushState.flowFade = 0.0;
    self.brushState.radius = 10;
    self.brushState.radiusJitter = 0.0;
    self.brushState.radiusFade = 0.0;
    self.brushState.hardness = 1;
    self.brushState.roundness = 1.0;
    self.brushState.angle = 0;
    self.brushState.angleJitter = 0.0;
    self.brushState.angleFade = 0.0;
    self.brushState.spacing = 0.2;
    self.brushState.scattering = 0.0;
    self.brushState.isAirbrush = true;
    self.brushState.isPatternTexture = false;
    self.brushState.isShapeTexture = false;
    self.brushState.isVelocitySensor = false;
    self.brushState.isRadiusMagnifySensor = false;
    self.brushState.wet = 0;
}

- (void)resetDefaultTextures{
    [self setBrushCommonTextures];
    [self setBrushShapeTexture:nil];
}

#pragma mark- Smudge
- (void)deleteSmudgeFramebuffers{
//    [[REGLWrapper current] deleteFramebufferOES:_smudgeFramebuffer];
//    [[REGLWrapper current] deleteFramebufferOES:_smudgeBackFramebuffer];
    [self.smudgeTexture destroy];
    self.smudgeTexture = nil;
    [self.smudgeBackTexture destroy];
    self.smudgeBackTexture = nil;
}

- (BOOL)createSmudgeFramebuffers{

    //使用双贴图方式在多次拷贝贴图时减少阻塞
    self.smudgeTexture = [RERenderTexture textureWithName:@"smudgeTex" size:self.brushState.radius * 2 mipmap:Interpolation_Nearest wrapMode:WrapMode_Clamp];
    self.smudgeBackTexture = [RERenderTexture textureWithName:@"smudgeBackTex" size:self.brushState.radius * 2 mipmap:Interpolation_Nearest wrapMode:WrapMode_Clamp];
    
//    //创建frame buffer
//    glGenFramebuffersOES(1, &_smudgeFramebuffer);
//    glBindFramebufferOES(GL_FRAMEBUFFER_OES, _smudgeFramebuffer);
//#if DEBUG
//    glLabelObjectEXT(GL_FRAMEBUFFER_OES, _smudgeFramebuffer, 0, [@"smudgeFramebuffer" UTF8String]);
//#endif
//    //链接renderBuffer对象
//    GLuint smudgeTexture;
//    glGenTextures(1, &smudgeTexture);
//    [[REGLWrapper current] bindTexture: smudgeTexture];
//#if DEBUG
//    glLabelObjectEXT(GL_TEXTURE, smudgeTexture, 0, [@"smudgeTexture" UTF8String]);
//#endif
//    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
//    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
//    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
//    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
//    //none power of 2 size texture not support mipmap
//    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA,  self.brushState.radius * 2, self.brushState.radius * 2, 0, GL_RGBA, GL_UNSIGNED_BYTE, 0);
////    self.lastSmudgeTextureSize = self.brushState.radius * 2;
//    glFramebufferTexture2DOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_TEXTURE_2D, smudgeTexture, 0);
//    
//    const GLenum discards[] = {GL_COLOR_ATTACHMENT0};
//    glDiscardFramebufferEXT(GL_FRAMEBUFFER, 1, discards);
//    glClear(GL_COLOR_BUFFER_BIT);
//    
//    [[REGLWrapper current] bindTexture:0];
//    
//	if(glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES) != GL_FRAMEBUFFER_COMPLETE_OES)
//	{
//		DebugLog(@"failed to make complete framebuffer object %x", glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES));
//		return NO;
//	}
    
    
    //创建doubleframe buffer
//    glGenFramebuffersOES(1, &_smudgeBackFramebuffer);
//    glBindFramebufferOES(GL_FRAMEBUFFER_OES, _smudgeBackFramebuffer);
//#if DEBUG
//    glLabelObjectEXT(GL_FRAMEBUFFER_OES, _smudgeBackFramebuffer, 0, [@"smudgeBackFramebuffer" UTF8String]);
//#endif
//    //链接renderBuffer对象
//    glGenTextures(1, &_smudgeBackTexture);
//    [[REGLWrapper current] bindTexture: _smudgeBackTexture];
//#if DEBUG
//    glLabelObjectEXT(GL_TEXTURE, _smudgeBackTexture, 0, [@"smudgeBackTexture" UTF8String]);
//#endif
//    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
//    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
//    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
//    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
//    //none power of 2 size texture not support mipmap
//    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA,  self.brushState.radius * 2, self.brushState.radius * 2, 0, GL_RGBA, GL_UNSIGNED_BYTE, 0);
//    glFramebufferTexture2DOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_TEXTURE_2D, _smudgeTexture, 0);
//    
//    glDiscardFramebufferEXT(GL_FRAMEBUFFER, 1, discards);
//    glClear(GL_COLOR_BUFFER_BIT);
//    
//    [[REGLWrapper current] bindTexture:0];
//    
//	if(glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES) != GL_FRAMEBUFFER_COMPLETE_OES)
//	{
//		DebugLog(@"failed to make complete framebuffer object %x", glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES));
//		return NO;
//	}
    
    //打开贴图绘制通道
//    glActiveTexture(GL_TEXTURE3);
    
	return YES;
}

- (void)swapSmudgeFramebuffers{
    //Double Buffering 交换VBO
//    SwapGL(_smudgeFramebuffer, _smudgeBackFramebuffer)
//    SwapGL(_smudgeTexture, _smudgeBackTexture)
    RERenderTexture *tempTex = self.smudgeTexture;
    self.smudgeTexture = self.smudgeBackTexture;
    self.smudgeBackTexture = tempTex;
}


//- (void)copySmudgeSrcTexture:(CGPoint)location{
//
//    //临时的补丁做法
//    location.x = location.x * UndoImageSize / self.canvas.bounds.size.width;
//    location.y = location.y * UndoImageSize / self.canvas.bounds.size.height;
//    
//    float copyRadius = roundf(self.brushState.radius);
//    
//    //save temp texture for next draw smudge texture
//    if (_smudgeTexture == 0) {
//        glGenTextures(1, &_smudgeTexture);
//    }
//    [[REGLWrapper current] bindTexture: _smudgeTexture];
//    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
//    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
//    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
//    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
//    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, copyRadius*2, copyRadius*2, 0, GL_RGBA, GL_UNSIGNED_BYTE, 0);
//    
//    //need half pixel offset adjust
//    int locationX = roundf(location.x - copyRadius);
//    int locationY = roundf(location.y - copyRadius);
//    
//    //need half pixel offset adjust
//    glCopyTexSubImage2D(GL_TEXTURE_2D, 0, 0, 0, locationX, locationY, copyRadius*2, copyRadius*2);
//    [[REGLWrapper current] bindTexture: 0];
//    
//    //    DebugLog(@"start x:%.1f y:%.1f", startLocation.x, startLocation.y);
//    //    DebugLog(@"finger radius:%.1f", _brushState.radius);
//    
//}

#pragma mark- IAP
-(BOOL)available{
    if (self.free) {
        return YES;
    }
    else if([[NSUserDefaults standardUserDefaults] boolForKey:@"ExpandedBrushPackageAvailable"]){
        return YES;
    }
    else{
        return NO;
    }
}

@end
