//
//  Bucket.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-10-20.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADBucket.h"
@class ADPaintView;
@implementation ADBucket
//- (id)initWithPaintView:(PaintingView *)paintView{
//    self = [super initWithPaintView:paintView];
//    if (self !=nil) {
//        //铅笔专有属性
//
//        
//        [self resetDefaultBrushState];
//    }
//    
//    return self;
//}

- (NSString*)name{
    return @"ADBucket";
}

- (BOOL)isEditable{
    return false;
}

- (void)setRadiusSliderValue{
    self.radiusSliderMinValue = 0;
    self.radiusSliderMaxValue = 0;
}

- (void)resetDefaultBrushState{
    self.brushState.radius = 0;
    self.brushState.radiusFade = 0;
    self.brushState.radiusJitter = 0;
    self.brushState.opacity = 1.0;
    self.brushState.flow = 1.0;
    self.brushState.flowFade = 0;
    self.brushState.flowJitter = 0;
    self.brushState.angle = 0;
    self.brushState.angleFade = 0;
    self.brushState.angleJitter = 0;
    self.brushState.roundness = 1.0;
    self.brushState.hardness = 1.0;
    self.brushState.spacing = 0.25;
    self.brushState.scattering = 0;
    self.brushState.isPatternTexture = false;
    self.brushState.isAirbrush = false;
    self.brushState.isVelocitySensor = false;
    self.brushState.isRadiusMagnifySensor = false;    
    self.brushState.wet = 0;
}

- (size_t) calculateDrawCountFromPoint:(CGPoint)start toPoint:(CGPoint)end brushState:(ADBrushState*)brushState isTapDraw:(BOOL)isTapDraw{
    return 0;
}

-(void)prepareWithBrushState:(ADBrushState *)brushState lastBrushState:(ADBrushState *)lastBrushState{
    [super prepareWithBrushState:brushState lastBrushState:lastBrushState];
    
    const CGFloat* colors = CGColorGetComponents(brushState.color.CGColor);
    glClearColor(colors[0], colors[1], colors[2], colors[3]);
    glClear(GL_COLOR_BUFFER_BIT);
    glClearColor(0, 0, 0, 0);
    
}

- (void) fillDataFromPoint:(CGPoint)start toPoint:(CGPoint)end segmentOffset:(int)segmentOffset brushState:(ADBrushState*)brushState isTapDraw:(BOOL)isTapDraw isImmediate:(BOOL)isImmediate
{
    //do nothing. done in prepareWithBrushState
}

-(void)fillLineBezierOrigin:(CGPoint) origin Control:(CGPoint) control Destination:(CGPoint) destination Count:(size_t) count segmentOffset:(int)segmentOffset brushState:(ADBrushState*)brushState isImmediate:(BOOL)isImmediate
{
    //do nothing. done in prepareWithBrushState
}

- (BOOL)free{
    return true;
}
@end
