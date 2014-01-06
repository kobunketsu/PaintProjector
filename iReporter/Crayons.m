//
//  Crayons.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-10-19.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "Crayons.h"

@implementation Crayons
//- (id)initWithPaintView:(PaintingView *)paintView{
//    self = [super initWithPaintView:paintView];
//    if (self !=nil) {
//        [self resetDefaultBrushState];
//    }
//    
//    return self;
//}

- (BOOL)isEditable{
    return true;
}

- (void)setRadiusSliderValue{
    self.radiusSliderMinValue = 8;
    self.radiusSliderMaxValue = 16;
}

- (void)resetDefaultBrushState{
    self.brushState.radius = 8;
    self.brushState.radiusFade = 0;
    self.brushState.radiusJitter = 0.2;
    self.brushState.opacity = 0.8;
    self.brushState.flow = 0.35;
    self.brushState.flowFade = 0;
    self.brushState.flowJitter = 0;
    self.brushState.angle = 0;
    self.brushState.angleFade = 0;
    self.brushState.angleJitter = 0;
    self.brushState.roundness = 1.0;
    self.brushState.hardness = 1.0;
    self.brushState.spacing = 0.1;
    self.brushState.scattering = 0.5;
    self.brushState.isDissolve = true;
    self.brushState.isAirbrush = false;
    self.brushState.isVelocitySensor = false;
    self.brushState.isRadiusMagnifySensor = false;    
    self.brushState.wet = 0;

    [self setBrushCommonTextures];
    [self setBrushShapeTexture:nil];
}

@end
