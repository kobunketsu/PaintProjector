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


#define kPatternWidth 44
#define kPatternHeight 44

@class ADBrushState;
@implementation ADBrushState

- (id)copyWithZone:(NSZone *)zone{
    ADBrushState *state = [[ADBrushState alloc] init];
    state.classId = self.classId;
    state.radius = self.radius;
    state.radiusJitter = self.radiusJitter;
    state.radiusFade = self.radiusFade;
    state.hardness = self.hardness;
    state.roundness = self.roundness;
    state.angle = self.angle;
    state.angleJitter = self.angleJitter;
    state.angleFade = self.angleFade;
    state.color = self.color;
    state.opacity = self.opacity;
    state.flow = self.flow;
    state.flowJitter = self.flowJitter;
    state.flowFade = self.flowFade;
    state.seed = self.seed;
    state.spacing = self.spacing;
    state.scattering = self.scattering;
    state.isPatternTexture = self.isPatternTexture;
    state.isAirbrush = self.isAirbrush;
    state.isShapeTexture = self.isShapeTexture;
    state.isVelocitySensor = self.isVelocitySensor;
    state.isRadiusMagnifySensor = self.isRadiusMagnifySensor;
    state.wet = self.wet;
    
    return state;
}

@end

@interface ADBrush()
#pragma mark- Core
@property (assign, nonatomic) float curDrawLength;//当前绘制的总长度
@property (assign, nonatomic) float curDrawFade;//当前绘制结束防缩
@property (assign, nonatomic) float lastDrawFade;//上一次绘制结束防缩
@property (assign, nonatomic) size_t allDrawSpriteCount;//当前一次绘制的数量
@property (assign, nonatomic) CGPoint lastDrawSubPoint;

//test beizer fade
@property (assign, nonatomic) float lastlastDrawFade;//再上一次绘制结束防缩
@property (assign, nonatomic) float lastDrawSubFade;
@end

@implementation ADBrush
// first define the pattern width and height
- (id)copyWithZone:(NSZone *)zone{
    ADBrush *brush = [[[self class] alloc]init];
    brush.delegate = self.delegate;
    brush.name = self.name;
    brush.paintView = self.paintView;
    brush.brushState = [self.brushState copy];
    brush.lastDrawPoint = self.lastDrawPoint;
    brush.curDrawPoint = self.curDrawPoint;
    brush.curDrawAccumDeltaLength = self.curDrawAccumDeltaLength;
    brush.vertexBuffer = self.vertexBuffer;
    brush.shader = self.shader;
    brush.material = self.material;
    brush.patternTextureSize = self.patternTextureSize;
    brush.shapeTexture = self.shapeTexture;
    brush.maskTexture = self.maskTexture;
    brush.patternTexture = self.patternTexture;
    brush.smudgeTexture = self.smudgeTexture;
    brush.smudgeBackTexture = self.smudgeBackTexture;
    brush.radiusSliderMaxValue = self.radiusSliderMaxValue;
    brush.radiusSliderMinValue = self.radiusSliderMinValue;
    brush.canvasSize = self.canvasSize;
    return brush;
}

//绘制笔刷
- (id)initWithPaintView:(ADPaintView*)paintView{
    self = [super init];
    if (self !=nil) {
        _paintView = paintView;
        self.delegate = paintView;
      
        //Param
        _brushState = [[ADBrushState alloc]init];
        [self resetDefaultBrushState];
        
        _lastDrawPoint = _lastDrawSubPoint = CGPointZero;
        
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
    
    [self.maskTexture destroy];
    self.maskTexture = nil;
    [self.shapeTexture destroy];
    self.shapeTexture = nil;
    [self.patternTexture destroy];
    self.patternTexture = nil;

    [self deleteSmudgeFramebuffers];
    
    [[REGLWrapper current]deleteShader:@"ADShaderBrush"];
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

- (void)setBlendMode{
    [[REGLWrapper current] blendFunc:BlendFuncAlphaBlend];
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
    self.lastDrawSubPoint = _curDrawPoint = _lastDrawPoint = startLocation;
    self.curDrawLength = 0;
    self.lastDrawSubFade = self.lastlastDrawFade = self.lastDrawFade = self.curDrawFade = 1.0;
    
    CFAbsoluteTime absTime = CFAbsoluteTimeGetCurrent();
    //    DebugLog(@"Seed %.3f", absTime);
    self.brushState.seed  = (int)(absTime*5);//0.2s min time interval between paint commands
    //    DebugLog(@"startDraw _brushState.seed %d", self.brush.brushState.seed);
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
            brushState.hardness != lastBrushState.hardness ||
            brushState.roundness != lastBrushState.roundness ||
            brushState.wet != lastBrushState.wet) {
            [self.material setVector:GLKVector4Make(0, brushState.hardness, brushState.roundness, brushState.wet) forPropertyName:@"Params"];
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
    if (textureName == NULL) {
        self.brushState.isShapeTexture = false;
        return;
    }
    _shapeTexture = [RETexture textureFromImageName:textureName reload:false];
    if (!_shapeTexture) {
        self.brushState.isShapeTexture = false;
        DebugLog(@"setBrushShapeTexture loadTextureInfo failed");
    }
    else{
#if DEBUG
        NSString *Label = [NSString stringWithFormat:@"%@", textureName];
        glLabelObjectEXT(GL_TEXTURE, _shapeTexture.texID, 0, [Label UTF8String]);
#endif
        self.brushState.isShapeTexture = true;
    }
}

-(void) setBrushCommonTextures
{
    _maskTexture = [RETexture textureFromImageName:@"brushSoftFallOff.png" reload:false];
    
}

- (void)setPatternTextureWithImage: (NSString*)patterName{
    _patternTexture = [RETexture textureFromImageName:patterName reload:false];
    self.patternTextureSize = _patternTexture.width;
}

-(void)dealloc{
}

- (UIColor *)color {
    return _brushState.color;
}

- (void)setColor:(UIColor *)newValue {
    _brushState.color = [newValue copy];
    [self.delegate willBrushColorChanged:_brushState.color];
}

//计算一次点到点绘制需要的数量
- (size_t) calculateDrawCountFromPoint:(CGPoint)start toPoint:(CGPoint)end brushState:(ADBrushState*)brushState isTapDraw:(BOOL)isTapDraw{
    DebugLogFuncUpdate(@"calculateDrawCountFromPointToPoint from %@ to %@ isTapDraw %i", NSStringFromCGPoint(start), NSStringFromCGPoint(end), isTapDraw);
	// Convert locations from Points to Pixels
	CGFloat scale = 1.0;
    //	CGFloat scale = self.contentScaleFactor;
	start.x *= scale;
	start.y *= scale;
	end.x *= scale;
	end.y *= scale;
    
	//当前描画点
    _curDrawPoint = CGPointMake((start.x + end.x)*0.5, (start.y + end.y)*0.5);
//    DebugLog(@"renderLine _lastDrawPoint x:%.0f y:%.0f | start x:%.0f y:%.0f | _curDrawPoint x:%.0f y:%.0f | end x:%.0f y:%.0f", _lastDrawPoint.x, _lastDrawPoint.y, start.x, start.y, _curDrawPoint.x, _curDrawPoint.y, end.x, end.y);
    
	//绘图距离
    float drawDeltaLength = GLKVector2Length(GLKVector2Subtract(GLKVector2Make(_curDrawPoint.x, _curDrawPoint.y), GLKVector2Make(_lastDrawPoint.x, _lastDrawPoint.y)));
    self.curDrawAccumDeltaLength += drawDeltaLength;
//    DebugLog(@"curDrawDeltaLength %.1f", self.curDrawDeltaLength);
    
    //绘制间隔
    float spaceThresold = brushState.radius * 2 * brushState.spacing;
    DebugLog(@"radius %.2f spacing %.2f spaceThresold %.2f", brushState.radius, brushState.spacing, spaceThresold);
    
    //绘制数量
    size_t count = 0;
    if(self.brushState.isAirbrush){
        count = MAX(1, (int)ceilf(drawDeltaLength / spaceThresold));
    }
    else{
        if (isTapDraw) {

            count = 1;
        }
        else{
            //累积距离小于间隔空间时，不描画
            if(self.curDrawAccumDeltaLength < spaceThresold){
                DebugLog(@"curDrawAccumDeltaLength < spaceThresold count 0");
                return 0;
            }
            else{
                count = (int)ceilf(self.curDrawAccumDeltaLength / spaceThresold);
            }
        }
    }
    DebugLog(@"calculateDrawCountFromPointToPoint count %lu", count);
    return count;
}

- (void) fillDataFromPoint:(CGPoint)start toPoint:(CGPoint)end segmentOffset:(int)segmentOffset brushState:(ADBrushState*)brushState isTapDraw:(BOOL)isTapDraw isImmediate:(BOOL)isImmediate
{
//    DebugLog(@"fillDataFromPoint startPoint %@ endPoint %@", NSStringFromCGPoint(start), NSStringFromCGPoint(end));
    CGPoint lastDrawPoint = self.lastDrawSubPoint;
    size_t countSegment = [self calculateDrawCountFromPoint:start toPoint:end brushState:brushState isTapDraw:isTapDraw];
    
//    self.lastlastDrawFade = self.lastDrawSubFade;

    //绘图Fade
    if (self.brushState.isVelocitySensor) {
        if (self.brushState.isRadiusMagnifySensor) {
            float curDrawFade = MAX(self.curDrawAccumDeltaLength / 10.0, 1.0);
            if (curDrawFade < self.lastDrawFade) {
                self.curDrawFade = MAX(curDrawFade, self.lastDrawFade - 1.0 / self.brushState.radius);
            }
            else if(curDrawFade > self.lastDrawFade) {
                self.curDrawFade = MIN(curDrawFade, self.lastDrawFade + 1.0 / self.brushState.radius);
            }
        }
        else{
            //max: atan(-paintDistance/30.0+0.5) = 2 - M_PI/2 = 0.43 (25 degree)--> -paintDistance/30.0 ~ 0
            //min: atan(-paintDistance/30.0+0.5) = - M_PI/2 = -1.57 (-90 degree)--> paintDistance ~ 60(2.07 * 30)
            self.curDrawFade = (atan(-self.curDrawAccumDeltaLength/30.0 + 0.5) + M_PI/2) / 2;
        }
    }
    
    [self fillLineBezierOrigin:_lastDrawPoint Control:start Destination:_curDrawPoint Count:countSegment segmentOffset:segmentOffset brushState:brushState isImmediate:isImmediate];
    
    //更新smudgeTexture
    if (self.brushState.wet > 0) {
        //save temp texture for next draw smudge texture 拷贝吸取位置的贴图
        //time consume.if move too fast, count is high, thread will invoke a lot of update brush smudge texture. next drawElement should not be drawn until this operation is finished
        [self.delegate willUpdateSmudgeTextureWithBrushState:brushState location:lastDrawPoint];
    }
    
    _lastDrawPoint = _curDrawPoint;
    self.lastDrawFade = self.curDrawFade;

    //重置累积距离
    if (countSegment > 0) {
        self.curDrawAccumDeltaLength = 0;
    }
}


-(void)fillLineBezierOrigin:(CGPoint) origin Control:(CGPoint) control Destination:(CGPoint) destination Count:(size_t) count segmentOffset:(int)segmentOffset brushState:(ADBrushState*)brushState isImmediate:(BOOL)isImmediate
{
    //限制单次填充线段的最大数量
    float spaceThresold;
    if (count > self.paintView.vertexBrushMaxCount) {
        float ratio = count / self.paintView.vertexBrushMaxCount;
        spaceThresold = brushState.radius * 2 * brushState.spacing * ratio;
        
        count = self.paintView.vertexBrushMaxCount;
        DebugLog(@"fillLine count override vertexBrushMaxCount. count limited to %d", (NSInteger)count);
    }
    else{
        spaceThresold = brushState.radius * 2 * brushState.spacing;
    }
    
    //计算vertex data
    float x, y;
    float t = 0.0;
//    DebugLog(@"fillLine fromDrawPoint %@ toDrawPoint %@ currentCount %lu lastAllDrawSpriteCount %lu", NSStringFromCGPoint(origin), NSStringFromCGPoint(destination), count, self.allDrawSpriteCount);

    for(int i = 0; i < count; i++)
    {
        //计算绘制的位置
        x = [ADMathHelper BeizerValueT:t start:origin.x control:control.x end:destination.x];
        y = [ADMathHelper BeizerValueT:t start:origin.y control:control.y end:destination.y];

        //计算绘制的距离
        float distVecX = x-self.lastDrawSubPoint.x;
        float distVecY = y-self.lastDrawSubPoint.y;
        float distance = sqrtf(distVecX * distVecX + distVecY * distVecY);
        self.curDrawLength += distance;
        
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
            radiusFade = self.curDrawFade * lerp + (1.0 - lerp) * self.lastDrawFade;
//            radiusFade = [ADMathHelper BeizerValueT:lerp start:self.lastlastDrawFade control:self.lastDrawFade end:self.curDrawFade];
//            DebugLogWarn(@"t %.1f start %f control %f end %f result %f", lerp, self.lastlastDrawFade, self.lastDrawFade, self.curDrawFade, radiusFade);
        }
        else{
            if (self.brushState.radiusFade > 0) {
                radiusFade = MAX(self.brushState.radiusFade - self.curDrawLength, 0) / self.brushState.radiusFade;
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
            flowFade = MAX(self.brushState.flowFade - self.curDrawLength, 0) / self.brushState.flowFade;
        }
        else{
            flowFade = 1.0;
        }
        float flow = brushState.flow * (1 - randX * brushState.flowJitter) * flowFade;
        
        //角度
        float angleFade;
        if (self.brushState.angleFade != 0) {
            angleFade = MAX(self.brushState.angleFade - self.curDrawLength, 0) / self.brushState.angleFade;
        }
        else{
            angleFade = 1.0;
        }
        float angle = brushState.angle * (1 - randX * brushState.angleJitter) * angleFade;
        
        int index = self.allDrawSpriteCount + i;
        
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
        
        t += 1.0 / (count);
        
//        DebugLog(@"fill vertex index:%d x:%.1f y:%.1f", index, self.vertexBuffer[index].Position[0], self.vertexBuffer[index].Position[1]);
        
        //lastDrawPoint使用完毕，更新lastDrawPoint,
        //更新执行的速度可能快于上一次取贴图，导致取到的数值是错误的
        self.lastDrawSubPoint = CGPointMake(x, y);
//        self.lastDrawSubFade = radiusFade;
//        [self.delegate willUpdateLayerContentCGRectWithPoint:self.lastDrawSubPoint radius:radius];
    }
    
    //allDrawSpriteCount累加count
    self.allDrawSpriteCount += count;
}


//Consider using multiple buffer objects to avoid stalling the rendering pipeline during data store updates. If any rendering in the pipeline makes reference to data in the buffer object being updated by glBufferSubData, especially from the specific region being updated, that rendering must drain from the pipeline before the data store can be updated.
-(void)renderImmediate:(BOOL)isImmediate{
//    DebugLog(@"renderImmediate");
    
    //绘制内容前Unmap显卡
//    DebugLogWarn(@"renderImmediate glUnmapBufferOES");
    glUnmapBufferOES(GL_ARRAY_BUFFER);
    
    //GPU还未完成绘制时，下一个CPU使用 glBufferSubData可能导致stalling
    if (self.allDrawSpriteCount > 0) {
        size_t count = self.allDrawSpriteCount;
        DebugLog(@"glDrawArrays allDrawSpriteCount %lu", count);
        glDrawArrays(GL_POINTS, 0, count);
        DebugLog(@"-----------------------------------Pass End-----------------------------------");

        self.allDrawSpriteCount = 0;
        
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
