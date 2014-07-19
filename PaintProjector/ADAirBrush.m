//
//  AirBrush.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-10-19.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADAirBrush.h"

@implementation ADAirBrush
//- (id)initWithPaintView:(PaintingView *)paintView{
//    self = [super initWithPaintView:paintView];
//    if (self !=nil) {
//
//        [self resetDefaultBrushState];
//    }
//    
//    return self;
//}

- (NSString*)name{
    return @"ADAirBrush";
}

- (BOOL)isEditable{
    return true;
}

- (void)setRadiusSliderValue{
    self.radiusSliderMinValue = 15;
    self.radiusSliderMaxValue = 60;
}

- (void)resetDefaultBrushState{
    self.brushState.opacity = 1;
    self.brushState.flow = 0.1;
    self.brushState.flowJitter = 0.0;
    self.brushState.flowFade = 0.0;
    self.brushState.radius = 15;
    self.brushState.radiusJitter = 0.0;
    self.brushState.radiusFade = 0.0;
    self.brushState.hardness = 0;
    self.brushState.roundness = 1.0;
    self.brushState.angle = 0;
    self.brushState.angleJitter = 0.0;
    self.brushState.angleFade = 0.0;
    self.brushState.spacing = 0.2;
    self.brushState.scattering = 0.2;
    self.brushState.isAirbrush = TRUE;
    self.brushState.isPatternTexture = false;
    self.brushState.isVelocitySensor = false;
    self.brushState.isRadiusMagnifySensor = false;    
    self.brushState.wet = 0;
}

- (BOOL)free{
    return false;
}

- (NSInteger)iapProductFeatureId{
    return 4;
}
@end
