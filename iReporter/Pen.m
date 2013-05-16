//
//  Pen.m
//  iReporter
//
//  Created by 文杰 胡 on 12-11-13.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "Pen.h"
#define LINE_WIDTH_MAX 10
#define LINE_VELOCITY_MAX 50

#define _DEBUG_ 0
@implementation Pen

- (id)initWithContext:(EAGLContext*)context Canvas:(UIView *)canvas{
    self = [super initWithContext:context Canvas:canvas];
    if (self !=nil) {
        [self setBrushTextureWithImage:@"airBrushRadius16.png"];
        _iconImage = [UIImage imageNamed:@"pen.png"];
        _type = BrushType_Pen;
        _typeName = @"pen";  
        
        _lastDrawRadius = -1;
    }
    
    return self;
}

- (void) renderLineFromPoint:(CGPoint)start toPoint:(CGPoint)end
{
    NSUInteger count;
    
	// Convert locations from Points to Pixels
	CGFloat scale = 1.0;    
    //	CGFloat scale = self.contentScaleFactor;
	start.x *= scale;
	start.y *= scale;
	end.x *= scale;
	end.y *= scale;
	
	//当前描画点
    _curDrawPoint = CGPointMake((start.x + end.x)*0.5, (start.y + end.y)*0.5);            
	//绘图频率
    
	// Add points to the buffer so there are drawing points every X pixels
    float dist = GLKVector2Distance(GLKVector2Make(_lastDrawPoint.x,_lastDrawPoint.y), GLKVector2Make(_curDrawPoint.x,_curDrawPoint.y));
    
    //零距离不描画
    if (dist < 0.001) {
        return;
    }
    
	count = MAX(ceilf(dist*kBrushCurveIntervalScale / kBrushPixelStep), 1);

//    _endRadius = _brushState.radius;
//    if (dist!=0) {
        _endRadius = _brushState.radius * (atan(-dist/15+0.5) + M_PI/2) / 2;
//    }
    
    [self drawBezierOrigin:_lastDrawPoint Control:start Destination:_curDrawPoint Count:count];
    
    _lastDrawPoint = _curDrawPoint;     

}
- (void)prepare{
    [super prepare];
    glUniform1f(_pointSizeUniform, 1.0);    
}
-(void)drawBezierOrigin:(CGPoint) origin Control:(CGPoint) control Destination:(CGPoint) destination Count:(int) count
{
    //初始化，不填入数据    
    [self createVertexBufferObject];
    //顶点数据
    if(_vertexBuffer==NULL){
        _vertexBuffer = malloc(_vertexMax * sizeof(BrushVertex));
    }
    if(count >= _vertexMax) {
        while (count >= _vertexMax) {
            _vertexMax *= 2;
        }
        _vertexBuffer = realloc(_vertexBuffer, _vertexMax * sizeof(BrushVertex));
        [self destroyVertexBufferObject];
        [self createVertexBufferObject];
    }
    
    
    float x, y;
    float t = 0.0;
    for(int i = 0; i < count; i++)
    {
        x = pow(1 - t, 2) * origin.x + 2.0 * (1 - t) * t * control.x + t * t * destination.x;
        y = pow(1 - t, 2) * origin.y + 2.0 * (1 - t) * t * control.y + t * t * destination.y;
        
        _vertexBuffer[i].Position[0] = x;
        _vertexBuffer[i].Position[1] = y;
        _vertexBuffer[i].Position[3] = 0; 
        
        
        // Set the brush color using premultiplied alpha values
        //rgb上不做premultiplied，在最后的合成做
//        _vertexBuffer[i].Color[0] = 1;
//        _vertexBuffer[i].Color[1] = 1;
//        _vertexBuffer[i].Color[2] = 1;    
//        _vertexBuffer[i].Color[3] = 1; 
        
        t += 1.0 / (count);
        
        //根据手势速度确定半径缩放值
        if (_startRadius<0) {
            _startRadius = _endRadius;
        }            
        float curRadius = _startRadius + (_endRadius - _startRadius) * ((GLfloat)i / (GLfloat)count);  
        
        //限制radius变化速率
        if (curRadius - _startRadius > 0.5) {
            curRadius = _startRadius + 0.5;
        }
        else if (_startRadius - curRadius > 0.5) {
            curRadius = _startRadius - 0.5;
        }
        //限制radius最小半径
        curRadius = MAX(curRadius, kBrushPixelStep);
        
//        NSLog(@"size:%.1f", curRadius);
        _vertexBuffer[i].Position[2] = curRadius * 2.0;           
        
        _startRadius = curRadius;        
    }
    
    glBindVertexArrayOES(_vertexArray);
    glBindBuffer(GL_ARRAY_BUFFER, _drawingVBO);
    glBufferSubData(GL_ARRAY_BUFFER, 0, sizeof(BrushVertex) * count, _vertexBuffer);
    
    glDrawArrays(GL_POINTS, 0, count);    

}

//quarzcore的方法
/*
- (void) draw :(CGPoint)lastPoint NewPoint:(CGPoint)newPoint{

    //计算新的drawPoints
    _curDrawPoint = CGPointMake((lastPoint.x + newPoint.x)*0.5, (lastPoint.y + newPoint.y)*0.5);
//    NSLog(@"--lastDrawPoint X:%.0f Y:%.0f --curDrawPoint X:%.0f Y:%.0f  --lastPoint X:%.0f Y:%.0f  --newPoint X:%.0f Y:%.0f", _lastDrawPoint.x, _lastDrawPoint.y, _curDrawPoint.x, _curDrawPoint.y,lastPoint.x, lastPoint.y, newPoint.x, newPoint.y);

    CGPoint drawVec = CGPointMake(newPoint.x - lastPoint.x, newPoint.y - lastPoint.y);
    float dist = sqrtf(drawVec.x * drawVec.x + drawVec.y * drawVec.y);
    //圆滑distance
    dist = (_lastDist + dist)*0.5;

    CGPoint endVec = CGPointMake(_curDrawPoint.x - lastPoint.x, _curDrawPoint.y - lastPoint.y);
    float endDist = sqrtf(endVec.x * endVec.x + endVec.y * endVec.y);
    CGPoint startVec = CGPointMake(lastPoint.x - _lastDrawPoint.x, lastPoint.y - _lastDrawPoint.y);
    float startDist = sqrtf(startVec.x * startVec.x + startVec.y * startVec.y);

    //计算up向量
    CGPoint startUp;     
    if (startDist == 0 && endDist!=0) {//根据endVec确定startUp
        startUp = CGPointMake(endVec.y / endDist, -endVec.x / endDist);
    }
    else if(startDist == 0 && endDist==0){
        startUp = CGPointMake(0, -1);
    }
    else{
        startUp = CGPointMake(startVec.y / startDist, -startVec.x / startDist);
    }
    
    CGPoint endUp;        
    if (endDist == 0 && startDist!=0) {//根据startVec确定startUp
        endUp = CGPointMake(startVec.y / startDist, -startVec.x / startDist);
    }
    else if(startDist == 0 && endDist==0){
        endUp = CGPointMake(0, -1);
    }    
    else {
        endUp = CGPointMake(endVec.y / endDist, -endVec.x / endDist);
    }      
    
    CGPoint midUp = CGPointMake((startUp.x + endUp.x)*0.5, (startUp.y + endUp.y)*0.5);//smooth lerp 
    
    //根据手势速度确定半径缩放值
    if (dist!=0) {
        _endRadius = self.radius * (atan(-dist/15+1) + M_PI/2) / 2;    
        if (_startRadius<0) {
            _startRadius = _endRadius;
        }
    }


    float midRadius = (_startRadius + _endRadius)*0.5;
    
    CGPoint startOffset0 = CGPointMake(startUp.x * _startRadius, startUp.y * _startRadius);
    CGPoint startOffset1 = CGPointMake(-startUp.x * _startRadius , -startUp.y * _startRadius);    
    CGPoint midOffset0 = CGPointMake(midUp.x * midRadius, midUp.y * midRadius);
    CGPoint midOffset1 = CGPointMake(-midUp.x * midRadius, -midUp.y * midRadius);    
    CGPoint endOffset0 = CGPointMake(endUp.x * _endRadius, endUp.y * _endRadius);
    CGPoint endOffset1 = CGPointMake(-endUp.x * _endRadius, -endUp.y * _endRadius);

    CGContextBeginPath(_context);    
    CGMutablePathRef path = CGPathCreateMutable();    
    CGPathMoveToPoint(path, nil, _lastDrawPoint.x + startOffset0.x, _lastDrawPoint.y + startOffset0.y);
    
    if (startDist != 0) {
        CGPathAddQuadCurveToPoint(path, nil, lastPoint.x + midOffset0.x, lastPoint.y + midOffset0.y, _curDrawPoint.x + endOffset0.x, _curDrawPoint.y + endOffset0.y);
    }
    else {//第一笔是直线
        CGPathAddLineToPoint(path, nil, _curDrawPoint.x + endOffset0.x, _curDrawPoint.y + endOffset0.y);
    }

    //计算开头半角旋转角度
    float startAngle = 0;
//    startAngle = atan2f(lastPoint.y - _lastDrawPoint.y, lastPoint.x - _lastDrawPoint.x);    
    if (lastPoint.x != _lastDrawPoint.x) {
        startAngle = atan2f(lastPoint.y - _lastDrawPoint.y, lastPoint.x - _lastDrawPoint.x);    
    }
    else {//lastPoint.x == _lastDrawPoint.x
        if (lastPoint.y > _lastDrawPoint.y) {
            startAngle = M_PI / 2.0;
        }
        else if (lastPoint.y < _lastDrawPoint.y){
            startAngle = - M_PI / 2.0;
        }
        else if (lastPoint.y == _lastDrawPoint.y){
            startAngle = 0;
        }
    }
    
    //计算结束半角旋转角度
    float endAngle = 0;
    if (_curDrawPoint.x != lastPoint.x) {
        
        endAngle = atan2f(_curDrawPoint.y - lastPoint.y, _curDrawPoint.x - lastPoint.x);    
    }
    else {//_curDrawPoint.x == lastPoint.x
        if (_curDrawPoint.y > lastPoint.y) {
            endAngle = M_PI / 2.0;
        }
        else if (_curDrawPoint.y < lastPoint.y){
            endAngle = - M_PI / 2.0;
        }
    }    
    
    CGPathAddArc(path, nil, _curDrawPoint.x, _curDrawPoint.y, _endRadius, -M_PI_2 + endAngle, M_PI_2 + endAngle, false);

    if (startDist != 0) {//第一笔是直线    
        CGPathAddQuadCurveToPoint(path, nil, lastPoint.x + midOffset1.x, lastPoint.y + midOffset1.y, _lastDrawPoint.x + startOffset1.x, _lastDrawPoint.y + startOffset1.y);
    }
    else {
        CGPathAddLineToPoint(path, nil, _lastDrawPoint.x + startOffset1.x, _lastDrawPoint.y + startOffset1.y);
    }

    if (startDist!=0) {    
        CGPathAddArc(path, nil, _lastDrawPoint.x, _lastDrawPoint.y, _startRadius, M_PI_2 + startAngle, M_PI*1.5 + startAngle, false);
    }
    else {
        CGPathAddArc(path, nil, _lastDrawPoint.x, _lastDrawPoint.y, _startRadius, M_PI_2 + endAngle, M_PI*1.5 + endAngle, false);
    }
    
    CGContextAddPath(_context, path);
    CGContextClosePath(_context);    


    CGContextSetInterpolationQuality(_context, kCGInterpolationNone);
#if _DEBUG_
    CGContextSetStrokeColorWithColor(_context, self.color.CGColor);        
    CGContextStrokePath(_context);
#else
    CGContextSetFillColorWithColor(_context, self.color.CGColor);    
    CGContextFillPath(_context);    
#endif
    CFRelease(path);
    _startRadius = _endRadius;
    _lastDrawPoint = _curDrawPoint;
    _lastDist = dist;
  
}

- (void)setRadius:(CGFloat)newValue {
    _startRadius = _endRadius = _radius = newValue;
}
- (void)startDraw{
//    _startRadius = _endRadius = self.radius;
    _startRadius = -1;
    _curDrawPoint = _lastDrawPoint = self.position;   
}
 */
@end
