//
//  Eraser.m
//  PaintProjector
//
//  Created by 文杰 胡 on 12-11-13.
//  Copyright (c) 2012年 Hu Wenjie. All rights reserved.
//

#import "ADEraser.h"
#import "REGLWrapper.h"
static ADBrushState *brushStateEraser = nil;
@implementation ADEraser
//- (id)initWithPaintView:(PaintingView *)paintView{
//    self = [super initWithPaintView:paintView];
//    if (self !=nil) {
//
//        
//        [self resetDefaultBrushState];
//    }
//    
//    return self;
//}
+(void)setBrushStateTemplate:(ADBrushState*)brushState{
    brushStateEraser = brushState;
}
+(ADBrushState*)brushStateTemplate{
    return brushStateEraser;
}
- (NSString*)name{
    return @"ADEraser";
}

- (BOOL)isEditable{
    return true;
}

- (void)setBlendModeWithBrushState:(ADBrushState*)brushState{
    [[REGLWrapper current] blendFunc:BlendFuncErase];
}

- (void)prepareWithBrushState:(ADBrushState*)brushState lastBrushState:(ADBrushState *)lastBrushState{
    [super prepareWithBrushState:brushState lastBrushState:lastBrushState];
    
//    glUniform4f(_colorUniform, 1.0, 1.0, 1.0, 1.0);
}

- (void)setRadiusSliderValue{
    self.radiusSliderMinValue = 1;
    self.radiusSliderMaxValue = 20;
}

- (void)resetDefaultBrushState{
    self.brushState.opacity = 1;
    self.brushState.flow = 1.0;
    self.brushState.flowJitter = 0.0;
    self.brushState.flowFade = 0.0;
    self.brushState.radius = 20;
    self.brushState.radiusJitter = 0.0;
    self.brushState.radiusFade = 0.0;
    self.brushState.hardness = 0.5;
    self.brushState.roundness = 1.0;
    self.brushState.angle = 0;
    self.brushState.angleJitter = 0.0;
    self.brushState.angleFade = 0.0;
    self.brushState.spacing = 0.05;
    self.brushState.scattering = 0.0;
    self.brushState.isAirbrush = false;
    self.brushState.isPatternTexture = false;
    self.brushState.isVelocitySensor = false;
    self.brushState.isRadiusMagnifySensor = false;    
    self.brushState.wet = 0;
}

- (BOOL)free{
    return true;
}
@end
