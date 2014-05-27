//
//  ChineseBrush.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-10-6.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ChineseBrush.h"

@implementation ChineseBrush
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

- (NSString*)name{
    return @"ChineseBrush";
}

- (BOOL)isEditable{
    return true;
}

- (void)setRadiusSliderValue{
    self.radiusSliderMinValue = 32;
    self.radiusSliderMaxValue = 64;
}

- (void)resetDefaultBrushState{
    self.brushState.opacity = 1;
    self.brushState.flow = 0.1;
    self.brushState.flowJitter = 1.0;
    self.brushState.flowFade = 0.0;
    self.brushState.radius = 32;
    self.brushState.radiusJitter = 0.5;
    self.brushState.radiusFade = 0.0;
    self.brushState.hardness = 0.2;
    self.brushState.roundness = 1.0;
    self.brushState.angle = 180;
    self.brushState.angleJitter = 1.0;
    self.brushState.angleFade = 0.0;
    self.brushState.spacing = 0.05;
    self.brushState.scattering = 2;
    self.brushState.isAirbrush = true;
    self.brushState.isDissolve = false;
    self.brushState.isVelocitySensor = false;
    self.brushState.isRadiusMagnifySensor = false;    
    self.brushState.wet = 0;
    
}

- (void)resetDefaultTextures{
    [super resetDefaultTextures];
    [self setBrushShapeTexture:@"chineseBrush.png"];
}

- (BOOL)free{
    return false;
}
@end
