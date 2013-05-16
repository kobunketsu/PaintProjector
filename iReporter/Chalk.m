//
//  Chalk.m
//  iReporter
//
//  Created by 文杰 胡 on 13-1-12.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "Chalk.h"

@implementation Chalk
- (id)initWithContext:(EAGLContext*)context Canvas:(UIView *)canvas{
    self = [super initWithContext:context Canvas:canvas];
    if (self !=nil) {
        [self setBrushTextureWithImage:@"chalkStroke.png"];
        _iconImage = [UIImage imageNamed:@"chalk.png"];
        _type = BrushType_Chalk;
        _typeName = @"chalk";
    }
    
    return self;
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
        //重新分配vertexBuffer的数据空间，用于绑定到vertexBufferObject
        _vertexBuffer = realloc(_vertexBuffer, _vertexMax * sizeof(BrushVertex));
        [self destroyVertexBufferObject];
        [self createVertexBufferObject];
    }    
    
    
    //计算vertex data
    float x, y;
    float t = 0.0;
    for(int i = 0; i < count; i++)
    {
        x = pow(1 - t, 2) * origin.x + 2.0 * (1 - t) * t * control.x + t * t * destination.x;
        y = pow(1 - t, 2) * origin.y + 2.0 * (1 - t) * t * control.y + t * t * destination.y;
        _vertexBuffer[i].Position[0] = x;
        _vertexBuffer[i].Position[1] = y;
        _vertexBuffer[i].Position[2] = 1;   
        double rand = ((double)arc4random() / ARC4RANDOM_MAX);
        _vertexBuffer[i].Position[3] = M_PI*2 * rand - M_PI;
        
        
        //顶点色
        // Set the brush color using premultiplied alpha values
        //rgb上不做premultiplied，在最后的合成做
//        _vertexBuffer[i].Color[0] = 1;
//        _vertexBuffer[i].Color[1] = 1;
//        _vertexBuffer[i].Color[2] = 1;    
//        _vertexBuffer[i].Color[3] = 1;            
        
        t += 1.0 / (count);
        //        NSLog(@"draw point:%.1f %.1f %.1f", _vertexBuffer[i].Position[0], _vertexBuffer[i].Position[1], _vertexBuffer[i].Position[2]);        
    }
    
    glBindVertexArrayOES(_vertexArray);
    glBindBuffer(GL_ARRAY_BUFFER, _drawingVBO);
    glBufferSubData(GL_ARRAY_BUFFER, 0, sizeof(BrushVertex) * count, _vertexBuffer);
    
    glDrawArrays(GL_POINTS, 0, count);
}
@end
