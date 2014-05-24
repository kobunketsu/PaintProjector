//
//  Pencil.m
//  PaintProjector
//
//  Created by 文杰 胡 on 12-11-12.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "Pencil.h"

@implementation Pencil
//- (id)initWithPaintView:(PaintingView *)paintView{
//    self = [super initWithPaintView:paintView];
//    if (self !=nil) {
//        [self resetDefaultBrushState];
//    }
//    
//    return self;
//}

- (NSString*)name{
    return @"Pencil";
}

- (BOOL)isEditable{
    return true;
}

- (void)setRadiusSliderValue{
    self.radiusSliderMinValue = 3;
    self.radiusSliderMaxValue = 4;
}

- (void)resetDefaultBrushState{
    self.brushState.radius = 3;
    self.brushState.radiusFade = 0;
    self.brushState.radiusJitter = 0.5;
    self.brushState.opacity = 1.0;
    self.brushState.flow = 0.5;
    self.brushState.flowFade = 0;
    self.brushState.flowJitter = 0;
    self.brushState.angle = 0;
    self.brushState.angleFade = 0;
    self.brushState.angleJitter = 0;
    self.brushState.roundness = 1.0;
    self.brushState.hardness = 1.0;
    self.brushState.spacing = 0.25;
    self.brushState.scattering = 0.5;
    self.brushState.isDissolve = true;
    self.brushState.isAirbrush = false;
    self.brushState.isVelocitySensor = false;
    self.brushState.isRadiusMagnifySensor = false;    
    self.brushState.wet = 0;
}

- (BOOL)free{
    return true;
}
@end
