//
//  Figure.m
//  iReporter
//
//  Created by 文杰 胡 on 13-1-25.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "Finger.h"

@implementation Finger
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

- (BOOL)isEditable{
    return true;
}

- (void)setRadiusSliderValue{
    self.radiusSliderMinValue = 5;
    self.radiusSliderMaxValue = 40;
}

- (void)resetDefaultBrushState{
    self.brushState.radius = 30;
    self.brushState.radiusFade = 0;
    self.brushState.radiusJitter = 0;
    self.brushState.opacity = 1.0;
    self.brushState.flow = 0.5;
    self.brushState.flowFade = 0;
    self.brushState.flowJitter = 0;
    self.brushState.angle = 0;
    self.brushState.angleFade = 0;
    self.brushState.angleJitter = 0;
    self.brushState.roundness = 1.0;
    self.brushState.hardness = 0;
    self.brushState.spacing = 0.1;
    //    self.brushState.spacing = 1.0 / self.brushState.radius;
    self.brushState.scattering = 0;
    self.brushState.isDissolve = false;
    self.brushState.isAirbrush = false;
    self.brushState.isVelocitySensor = false;
    self.brushState.isRadiusMagnifySensor = false;
    self.brushState.wet = 1.0;
    
    [self setBrushCommonTextures];
    [self setBrushShapeTexture:nil];
}

@end
