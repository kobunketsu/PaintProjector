//
//  OilBrush.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-10-19.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "OilBrush.h"

@implementation OilBrush
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
    return @"OilBrush";
}

- (BOOL)isEditable{
    return true;
}

- (void)setRadiusSliderValue{
    self.radiusSliderMinValue = 5;
    self.radiusSliderMaxValue = 40;
}

- (void)resetDefaultBrushState{
    self.brushState.radius = 20;
    self.brushState.radiusFade = 0;
    self.brushState.radiusJitter = 0;
    self.brushState.opacity = 1.0;
    self.brushState.flow = 0.7;
    self.brushState.flowFade = 0;
    self.brushState.flowJitter = 0;
    self.brushState.angle = 0;
    self.brushState.angleFade = 0;
    self.brushState.angleJitter = 0;
    self.brushState.roundness = 1.0;
    self.brushState.hardness = 0;
    self.brushState.spacing = 0.025;
    self.brushState.scattering = 0;
    self.brushState.isDissolve = false;
    self.brushState.isAirbrush = false;
    self.brushState.isVelocitySensor = false;
    self.brushState.isRadiusMagnifySensor = false;    
    self.brushState.wet = 0.9;
    
    [self setBrushCommonTextures];
    [self setBrushShapeTexture:@"brush_dryTip_64.png"];
//    [self setBrushShapeTexture:nil];
}

- (BOOL)free{
    return false;
}
@end
