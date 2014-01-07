//
//  Brush.m
//  iReporter
//
//  Created by 文杰 胡 on 12-10-28.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "Brush.h"
#import "PaintingView.h"
#import "GLWrapper.h"

@class BrushState;
@implementation BrushState

- (id)copyWithZone:(NSZone *)zone{
    BrushState *state = [[BrushState alloc] init];
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
    state.isDissolve = self.isDissolve;
    state.isAirbrush = self.isAirbrush;
    state.isShapeTexture = self.isShapeTexture;
    state.isVelocitySensor = self.isVelocitySensor;
    state.isRadiusMagnifySensor = self.isRadiusMagnifySensor;
    state.wet = self.wet;
    
    return state;
}


@end

@class Brush;
@implementation Brush
// first define the pattern width and height
const float kPatternWidth = 44;
const float kPatternHeight = 44;

//绘制笔刷

- (id)initWithPaintView:(PaintingView*)paintView GLWrapper:(GLWrapper*)glWrapper texMgr:(TextureManager*)texMgr canvasSize:(CGSize)canvasSize{
    self = [super init];
    if (self !=nil) {
        _paintView = paintView;
        _texMgr = texMgr;
        _glWrapper = glWrapper;
        _context = paintView.context;
        
        //Shader
        _shaderPreDefines = @"";
        if(![self loadShader]){
            DebugLog(@"Brush init loadShader failed");
            return NULL;
        }
        
        [self setCanvasSize:canvasSize];
        
        //Param
        _brushState = [[BrushState alloc]init];
        [self resetDefaultBrushState];
        
        _lastDrawPoint = _lastDrawSubPoint = CGPointZero;
        
        //UI
        [self setColor: [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]];
        [self setRadiusSliderValue];
    }

    return self;
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
    
    [self.glWrapper useProgram:_programBrush uniformBlock:^{
        glUniformMatrix4fv( _projectionUniform, 1, GL_FALSE, _projectionMat);
    }];
}

- (void)setPaintView:(PaintingView *)paintView{
    _paintView = paintView;
}

- (void)setBlendMode{
    [self.glWrapper blendFunc:BlendFuncAlphaBlend];
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
    self.lastDrawFade = self.curDrawFade = 1.0;
    
    CFAbsoluteTime absTime = CFAbsoluteTimeGetCurrent();
    //    DebugLog(@"Seed %.3f", absTime);
    self.brushState.seed  = (int)(absTime*5);//0.2s min time interval between paint commands
    //    DebugLog(@"startDraw _brushState.seed %d", self.brush.brushState.seed);
}



-(BOOL)compareBrushState:(BrushState*)bs1 withBrushState:(BrushState*)bs2{
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
    if (bs1.isDissolve != bs2.isDissolve) {
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

- (void)prepareNewWithBrushState:(BrushState*)brushState lastBrushState:(BrushState*)lastBrushState{
    glBindProgramPipelineEXT(_ppo);
    [self.glWrapper useProgram:0 uniformBlock:nil];
    
    UIColor* color = brushState.color;
    [color getRed:&_red green:&_green blue:&_blue alpha:&_alpha];
    
    if (self.brushState.wet > 0){
        //if use gl_LastFragData, please use glBlendFuncSeparate(GL_ONE, GL_ZERO, GL_ONE, GL_ONE_MINUS_SRC_ALPHA)
        [self.glWrapper blendFunc:BlendFuncOpaque];
    }
    else{
        //draw to brushbuffer
        [self.glWrapper blendFunc:BlendFuncOpaqueAlphaBlend];
    }
    
    glProgramUniformMatrix4fvEXT(_vertexProgram, _projectionUniform, 1, GL_FALSE, _projectionMat);
    glProgramUniform4fEXT(_vertexProgram, _paramsUniform, 0, brushState.hardness, brushState.roundness, brushState.wet);
    glProgramUniform4fEXT(_fragmentProgram, _params2Uniform, (float)brushState.isShapeTexture, (float)brushState.isDissolve, brushState.wet, 0);
    
    //srcAlpha + (1 - srcAlpha) * dstAlpha --> no overrideAlpha
    //not bind to texture0. texture0 is used for drawQuad
    if (self.brushState.isShapeTexture) {
        //设置发生了改变
        if (lastBrushState == NULL || self.brushState.classId != lastBrushState.classId || !lastBrushState.isShapeTexture) {
            [self.glWrapper activeTexSlot:GL_TEXTURE1 bindTexture:_shapeTexture];
            glProgramUniform1iEXT(_fragmentProgram, _maskTextureUniform, 1);
        }
    }
    else{
        //设置发生了改变
        if (lastBrushState == NULL || self.brushState.classId != lastBrushState.classId || lastBrushState.isShapeTexture) {
            [self.glWrapper activeTexSlot:GL_TEXTURE1 bindTexture:_maskTexture];
            glProgramUniform1iEXT(_fragmentProgram, _maskTextureUniform, 1);
        }
    }
    
    
    if (self.brushState.isDissolve) {
        //设置发生了改变
        if (lastBrushState == NULL || self.brushState.classId != lastBrushState.classId || !lastBrushState.isDissolve) {
            [self.glWrapper activeTexSlot:GL_TEXTURE2 bindTexture:_noiseTexture];
            glProgramUniform1iEXT(_fragmentProgram, _noiseTextureUniform, 2);
        }
    }
    
    if (self.brushState.wet > 0){
        //设置发生了改变
        if (lastBrushState == NULL || self.brushState.classId != lastBrushState.classId || lastBrushState.wet < 0.001) {
            [self.glWrapper activeTexSlot:GL_TEXTURE0 bindTexture:_smudgeTexture];
            glProgramUniform1iEXT(_fragmentProgram, _smudgeTextureUniform, 0);
        }
    }
}

- (void)prepareWithBrushState:(BrushState*)brushState lastBrushState:(BrushState*)lastBrushState{
    //TODO:优化命令，减少redunt命令
    [self.glWrapper useProgram:_programBrush uniformBlock:^{

    }];

//    glUniformMatrix4fv( _projectionUniform, 1, GL_FALSE, _projectionMat); use default

    //第一次设置 ，或者切换brush种类，或者brush属性发生变化，都设置uniforms
    if (lastBrushState == NULL ||
        brushState.classId != lastBrushState.classId ||
        brushState.hardness != lastBrushState.hardness ||
        brushState.roundness != lastBrushState.roundness ||
        brushState.wet != lastBrushState.wet) {
        glUniform4f(_paramsUniform, 0, brushState.hardness, brushState.roundness, brushState.wet);
    }

    if (lastBrushState == NULL ||
        brushState.classId != lastBrushState.classId ||
        brushState.isShapeTexture != lastBrushState.isShapeTexture ||
        brushState.isDissolve != lastBrushState.isDissolve ||
        brushState.wet != lastBrushState.wet) {
        glUniform4f(_params2Uniform, (float)brushState.isShapeTexture, (float)brushState.isDissolve, brushState.wet, 0);
    }

    
    UIColor* color = brushState.color;
    [color getRed:&_red green:&_green blue:&_blue alpha:&_alpha];

    if (brushState.wet > 0){
        //if use gl_LastFragData, please use glBlendFuncSeparate(GL_ONE, GL_ZERO, GL_ONE, GL_ONE_MINUS_SRC_ALPHA)
        [self.glWrapper blendFunc:BlendFuncOpaque];
    }
    else{
        //draw to brushbuffer
        [self.glWrapper blendFunc:BlendFuncOpaqueAlphaBlend];
    }

    
    //srcAlpha + (1 - srcAlpha) * dstAlpha --> no overrideAlpha
   //not bind to texture0. texture0 is used for drawQuad
    if (brushState.isShapeTexture) {

        //设置发生了改变
        if (lastBrushState == NULL || brushState.classId != lastBrushState.classId || !lastBrushState.isShapeTexture) {
            glUniform1i(_maskTextureUniform, 1);
            
            [self.glWrapper activeTexSlot:GL_TEXTURE1 bindTexture:_shapeTexture];
            
        }
    }
    else{

        //设置发生了改变
        if (lastBrushState == NULL || brushState.classId != lastBrushState.classId || lastBrushState.isShapeTexture) {
            glUniform1i(_maskTextureUniform, 1);

            [self.glWrapper activeTexSlot:GL_TEXTURE1 bindTexture:_maskTexture];
        }
    }
    
    
    if (brushState.isDissolve) {

        //设置发生了改变
        if (lastBrushState == NULL || brushState.classId != lastBrushState.classId || !lastBrushState.isDissolve) {
            glUniform1i(_noiseTextureUniform, 2);
            
            [self.glWrapper activeTexSlot:GL_TEXTURE2 bindTexture:_noiseTexture];
            
        }
    }
    
    if (brushState.wet > 0){

        //设置发生了改变
        if (lastBrushState == NULL || brushState.classId != lastBrushState.classId || lastBrushState.wet < 0.001) {
            glUniform1i(_smudgeTextureUniform, 0);
            
            [self.glWrapper activeTexSlot:GL_TEXTURE0 bindTexture:_smudgeTexture];
            
        }
    }
    
    [self.glWrapper bindVertexArrayOES: self.paintView.VAOBrush];
    [self.glWrapper bindBuffer:self.paintView.VBOBrush];
    self.vertexBuffer = (BrushVertex *)glMapBufferOES(GL_ARRAY_BUFFER, GL_WRITE_ONLY_OES);
}

-(void) setBrushShapeTexture:(NSString*)textureName{
    if (textureName == NULL) {
        self.brushState.isShapeTexture = false;
        return;
    }
    
    _shapeTexture = [self.texMgr loadTextureInfoFromImageName:textureName reload:false].name;
    if (_shapeTexture == 0) {
        self.brushState.isShapeTexture = false;
        DebugLog(@"setBrushShapeTexture loadTextureInfo failed");
    }
    else{
        self.brushState.isShapeTexture = true;
    }
}

-(void) setBrushCommonTextures
{
    _maskTexture = [self.texMgr loadTextureInfoFromImageName:@"brushSoftFallOff.png" reload:false].name;
    
    _noiseTexture = [self.texMgr loadTextureInfoFromImageName:@"noise.png" reload:false].name;
}
- (void)setPatternTextureWithImage: (NSString*)patterName{
    
}

-(void)dealloc{
    DebugLog(@"%@ dealloc", [self class]);
    EAGLContext* context = [EAGLContext currentContext];
    [EAGLContext setCurrentContext:self.context];
    
    [self.texMgr deleteTexture:_maskTexture];
    [self.texMgr deleteTexture:_shapeTexture];
    [self deleteSmudgeFramebuffers];
    
    RELEASE_PROGRAM(_programBrush);

    
    self.context = nil;
    [EAGLContext setCurrentContext:context];
}

- (UIColor *)color {
    return _brushState.color;
}

- (void)setColor:(UIColor *)newValue {
    _brushState.color = [newValue copy];
    [self.delegate willBrushColorChanged:_brushState.color];
}

//计算一次点到点绘制需要的数量
- (size_t) calculateDrawCountFromPoint:(CGPoint)start toPoint:(CGPoint)end brushState:(BrushState*)brushState isTapDraw:(BOOL)isTapDraw{
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
//    DebugLog(@"radius %.2f spacing %.2f spaceThresold %.2f", brushState.radius, brushState.spacing, spaceThresold);
    
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
                return 0;
            }
            else{
                count = (int)ceilf(self.curDrawAccumDeltaLength / spaceThresold);
            }
        }
    }
//    DebugLog(@"calculateDrawCountFromPointToPoint count %lu", count);
    return count;
}

- (void) fillDataFromPoint:(CGPoint)start toPoint:(CGPoint)end segmentOffset:(int)segmentOffset brushState:(BrushState*)brushState isTapDraw:(BOOL)isTapDraw isImmediate:(BOOL)isImmediate
{
//    DebugLog(@"fillDataFromPoint startPoint %@ endPoint %@", NSStringFromCGPoint(start), NSStringFromCGPoint(end));
    CGPoint lastDrawPoint = self.lastDrawSubPoint;
    size_t countSegment = [self calculateDrawCountFromPoint:start toPoint:end brushState:brushState isTapDraw:isTapDraw];

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


-(void)fillLineBezierOrigin:(CGPoint) origin Control:(CGPoint) control Destination:(CGPoint) destination Count:(size_t) count segmentOffset:(int)segmentOffset brushState:(BrushState*)brushState isImmediate:(BOOL)isImmediate
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
        x = pow(1 - t, 2) * origin.x + 2.0 * (1 - t) * t * control.x + t * t * destination.x;
        y = pow(1 - t, 2) * origin.y + 2.0 * (1 - t) * t * control.y + t * t * destination.y;

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
        
//        [self.delegate willUpdateLayerContentCGRectWithPoint:self.lastDrawSubPoint radius:radius];
    }
    
    self.allDrawSpriteCount += count;
}


//Consider using multiple buffer objects to avoid stalling the rendering pipeline during data store updates. If any rendering in the pipeline makes reference to data in the buffer object being updated by glBufferSubData, especially from the specific region being updated, that rendering must drain from the pipeline before the data store can be updated.
-(void)renderImmediate:(BOOL)isImmediate{
//    DebugLog(@"renderImmediate");
    
    //绘制内容前Unmap显卡
    glUnmapBufferOES(GL_ARRAY_BUFFER);
    
    //GPU还未完成绘制时，下一个CPU使用 glBufferSubData可能导致stalling
    if (self.allDrawSpriteCount > 0) {
        DebugLog(@"glDrawArrays allDrawSpriteCount %lu", self.allDrawSpriteCount);
        glDrawArrays(GL_POINTS, 0, self.allDrawSpriteCount);
        DebugLog(@"-----------------------------------Pass End-----------------------------------");
        
        [self.paintView swapVBO];
        
        self.allDrawSpriteCount = 0;
    }
    else{
        //引起Inefficient State Update
    }
//    glFlush(); 引起Logical Buffer Store问题
}


- (BOOL)loadShaderNew
{
    const GLchar *source;
    NSString *vertShaderPathname, *fragShaderPathname;
    NSString *fileStr;
    
    //vertex shader
    vertShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shaders/ShaderBrush" ofType:@"vsh"];
    fileStr = [NSString stringWithContentsOfFile:vertShaderPathname encoding:NSUTF8StringEncoding error:nil];
    source = (GLchar *)[fileStr UTF8String];
    _vertexProgram = glCreateShaderProgramvEXT(GL_VERTEX_SHADER, 1, &source);
    
    glBindAttribLocation(_vertexProgram, GLKVertexAttribPosition, "Position");
    glBindAttribLocation(_vertexProgram, GLKVertexAttribColor, "SourceColor");
    _projectionUniform = glGetUniformLocation(_vertexProgram, "Projection");
    _paramsUniform = glGetUniformLocation(_vertexProgram, "Params");
    
    //fragment shader
    fragShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shaders/ShaderBrush" ofType:@"fsh"];
    fileStr = [NSString stringWithContentsOfFile:fragShaderPathname encoding:NSUTF8StringEncoding error:nil];
    source = (GLchar *)[fileStr UTF8String];
    _fragmentProgram =  glCreateShaderProgramvEXT(GL_FRAGMENT_SHADER, 1, &source);
    
    _maskTextureUniform = glGetUniformLocation(_fragmentProgram, "maskTexture");
    _noiseTextureUniform = glGetUniformLocation(_fragmentProgram, "noiseTexture");
    _smudgeTextureUniform = glGetUniformLocation(_fragmentProgram, "smudgeTexture");
    _params2Uniform = glGetUniformLocation(_fragmentProgram, "ParamsExtend");
    
    
    // Construct a program pipeline object and configure it to use the shaders
    glGenProgramPipelinesEXT(1, &_ppo);
    glBindProgramPipelineEXT(_ppo);
    glUseProgramStagesEXT(_ppo, GL_VERTEX_SHADER_BIT_EXT, _vertexProgram);
    glUseProgramStagesEXT(_ppo, GL_FRAGMENT_SHADER_BIT_EXT, _fragmentProgram);
    
    return YES;
}

- (BOOL)loadShader
{
    GLuint vertShader, fragShader;
    NSString *vertShaderPathname, *fragShaderPathname;
    
    // Create shader program.
    if(_programBrush == 0){
        _programBrush = glCreateProgram();
    }
    
    //preprocess define
//    if (self.brushState.isShapeTexture) {
//        self.shaderPreDefines = [self.shaderPreDefines stringByAppendingString:@"|Pattern"];
//    }
//    if (self.brushState.isDissolve) {
//        self.shaderPreDefines = [self.shaderPreDefines stringByAppendingString:@"|Dissolve"];
//    }
//    if (self.brushState.wet > 0) {
//        self.shaderPreDefines = [self.shaderPreDefines stringByAppendingString:@"|Smudge"];
//    }
    
    // Create and compile vertex shader.
    vertShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shaders/ShaderBrush" ofType:@"vsh"];
    if (![[ShaderManager sharedInstance] compileShader:&vertShader type:GL_VERTEX_SHADER file:vertShaderPathname preDefines:self.shaderPreDefines]) {
        DebugLog(@"Failed to compile vertex shader");
        return NO;
    } 
    
    // Create and compile fragment shader.
    fragShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shaders/ShaderBrush" ofType:@"fsh"];
    if (![[ShaderManager sharedInstance] compileShader:&fragShader type:GL_FRAGMENT_SHADER file:fragShaderPathname preDefines:self.shaderPreDefines]) {
        DebugLog(@"Failed to compile fragment shader");
        return NO;
    }  

    // Attach vertex shader to program.
    glAttachShader(_programBrush, vertShader);
    
    // Attach fragment shader to program.
    glAttachShader(_programBrush, fragShader);    
    
    // Bind attribute locations.
    // This needs to be done prior to linking.
    glBindAttribLocation(_programBrush, GLKVertexAttribPosition, "Position");
    glBindAttribLocation(_programBrush, GLKVertexAttribColor, "SourceColor");    

    // Link program.
    if (![[ShaderManager sharedInstance] linkProgram:_programBrush]) {
        DebugLog(@"Failed to link program: %d", _programBrush);
        
        if (vertShader) {
            glDeleteShader(vertShader);
            vertShader = 0;
        }
        if (fragShader) {
            glDeleteShader(fragShader);
            fragShader = 0;
        }
        if (_programBrush) {
            glDeleteProgram(_programBrush);
            _programBrush = 0;
        }
        
        return NO;
    }  
    
    // Get uniform locations.
    _smudgeTextureUniform = glGetUniformLocation(_programBrush, "smudgeTexture");
    _maskTextureUniform = glGetUniformLocation(_programBrush, "maskTexture");
    _noiseTextureUniform = glGetUniformLocation(_programBrush, "noiseTexture");
    _paramsUniform = glGetUniformLocation(_programBrush, "Params");
    _params2Uniform = glGetUniformLocation(_programBrush, "ParamsExtend");
    _projectionUniform = glGetUniformLocation(_programBrush, "Projection");
    
    // Release vertex and fragment shaders.
    if (vertShader) {
        glDetachShader(_programBrush, vertShader);
        glDeleteShader(vertShader);
    }
    if (fragShader) {
        glDetachShader(_programBrush, fragShader);
        glDeleteShader(fragShader);
    }
    
#if DEBUG
    NSString *programBrushLabel = [NSString stringWithFormat:@"programBrush%@", self.class];

    glLabelObjectEXT(GL_PROGRAM_OBJECT_EXT, _programBrush, 0, [programBrushLabel UTF8String]);
#endif
    return YES;
}


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
    self.brushState.isDissolve = false;
    self.brushState.isShapeTexture = false;
    self.brushState.isVelocitySensor = false;
    self.brushState.isRadiusMagnifySensor = false;
    self.brushState.wet = 0;
    
    [self setBrushCommonTextures];
    


}

#pragma mark- Smudge
- (void)deleteSmudgeFramebuffers{
    RELEASE_FRAMEBUFFER(_smudgeFramebuffer)
    RELEASE_FRAMEBUFFER(_smudgeBackFramebuffer)
    RELEASE_TEXTURE(_smudgeTexture)
    RELEASE_TEXTURE(_smudgeBackTexture)
}

- (BOOL)createSmudgeFramebuffers{
    //使用双贴图方式在多次拷贝贴图时减少阻塞
    //创建frame buffer
    glGenFramebuffersOES(1, &_smudgeFramebuffer);
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, _smudgeFramebuffer);
#if DEBUG
    glLabelObjectEXT(GL_FRAMEBUFFER_OES, _smudgeFramebuffer, 0, [@"smudgeFramebuffer" UTF8String]);
#endif
    //链接renderBuffer对象
    glGenTextures(1, &_smudgeTexture);
    [self.glWrapper bindTexture: _smudgeTexture];
#if DEBUG
    glLabelObjectEXT(GL_TEXTURE, _smudgeTexture, 0, [@"smudgeTexture" UTF8String]);
#endif
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    //none power of 2 size texture not support mipmap
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA,  self.brushState.radius * 2, self.brushState.radius * 2, 0, GL_RGBA, GL_UNSIGNED_BYTE, 0);
    self.lastSmudgeTextureSize = self.brushState.radius * 2;
    glFramebufferTexture2DOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_TEXTURE_2D, _smudgeTexture, 0);
    
    const GLenum discards[] = {GL_COLOR_ATTACHMENT0};
    glDiscardFramebufferEXT(GL_FRAMEBUFFER, 1, discards);
    glClear(GL_COLOR_BUFFER_BIT);
    
    [self.glWrapper bindTexture:0];
    
	if(glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES) != GL_FRAMEBUFFER_COMPLETE_OES)
	{
		DebugLog(@"failed to make complete framebuffer object %x", glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES));
		return NO;
	}
    
    
    //创建doubleframe buffer
    glGenFramebuffersOES(1, &_smudgeBackFramebuffer);
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, _smudgeBackFramebuffer);
#if DEBUG
    glLabelObjectEXT(GL_FRAMEBUFFER_OES, _smudgeBackFramebuffer, 0, [@"smudgeBackFramebuffer" UTF8String]);
#endif
    //链接renderBuffer对象
    glGenTextures(1, &_smudgeBackTexture);
    [self.glWrapper bindTexture: _smudgeBackTexture];
#if DEBUG
    glLabelObjectEXT(GL_TEXTURE, _smudgeBackTexture, 0, [@"smudgeBackTexture" UTF8String]);
#endif
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    //none power of 2 size texture not support mipmap
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA,  self.brushState.radius * 2, self.brushState.radius * 2, 0, GL_RGBA, GL_UNSIGNED_BYTE, 0);
    glFramebufferTexture2DOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_TEXTURE_2D, _smudgeTexture, 0);
    
    glDiscardFramebufferEXT(GL_FRAMEBUFFER, 1, discards);
    glClear(GL_COLOR_BUFFER_BIT);
    
    [self.glWrapper bindTexture:0];
    
	if(glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES) != GL_FRAMEBUFFER_COMPLETE_OES)
	{
		DebugLog(@"failed to make complete framebuffer object %x", glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES));
		return NO;
	}
    
    //打开贴图绘制通道
//    glActiveTexture(GL_TEXTURE3);
    
	return YES;
}

- (void)swapSmudgeFramebuffers{
    //Double Buffering 交换VBO
    SwapGL(_smudgeFramebuffer, _smudgeBackFramebuffer)
    SwapGL(_smudgeTexture, _smudgeBackTexture)
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
//    [self.glWrapper bindTexture: _smudgeTexture];
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
//    [self.glWrapper bindTexture: 0];
//    
//    //    DebugLog(@"start x:%.1f y:%.1f", startLocation.x, startLocation.y);
//    //    DebugLog(@"finger radius:%.1f", _brushState.radius);
//    
//}

@end
