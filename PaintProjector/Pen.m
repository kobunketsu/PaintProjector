//
//  Pen.m
//  PaintProjector
//
//  Created by 文杰 胡 on 12-11-13.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "Pen.h"
#define LINE_WIDTH_MAX 10
#define LINE_VELOCITY_MAX 50

#define _DEBUG_ 0
@implementation Pen

//- (id)initWithPaintView:(PaintingView *)paintView{
//    self = [super initWithPaintView:paintView];
//    if (self !=nil) {
//        
//
//        
//        [self resetDefaultBrushState];        
//    }
//    
//    return self;
//}

- (NSString*)name{
    return @"Pen";
}

- (BOOL)isEditable{
    return true;
}

- (void)setRadiusSliderValue{
    self.radiusSliderMinValue = 1;
    self.radiusSliderMaxValue = 5;
}

- (void)resetDefaultBrushState{
    self.brushState.radius = 2;
    self.brushState.radiusFade = 0;
    self.brushState.radiusJitter = 0;
    self.brushState.opacity = 1.0;
    self.brushState.flow = 1;
    self.brushState.flowFade = 0;
    self.brushState.flowJitter = 0;
    self.brushState.angle = 0;
    self.brushState.angleFade = 0;
    self.brushState.angleJitter = 0;
    self.brushState.roundness = 1.0;
    self.brushState.hardness = 1.0;
    self.brushState.spacing = 0.15;
    self.brushState.scattering = 0;
    self.brushState.isDissolve = false;
    self.brushState.isAirbrush = false;
    self.brushState.isVelocitySensor = true;
    self.brushState.isRadiusMagnifySensor = false;    
    self.brushState.wet = 0;
    
}

- (BOOL)free{
    return true;
}
@end
