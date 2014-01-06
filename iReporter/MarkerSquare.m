//
//  MarkerSquare.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-10-19.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "MarkerSquare.h"
#import "TextureManager.h"
@implementation MarkerSquare
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
    self.radiusSliderMaxValue = 10;
}

- (void)resetDefaultBrushState{
    self.brushState.opacity = 0.9;
    self.brushState.flow = 1.0;
    self.brushState.flowJitter = 0.0;
    self.brushState.flowFade = 0.0;
    self.brushState.radius = 10;
    self.brushState.radiusJitter = 0.0;
    self.brushState.radiusFade = 0.0;
    self.brushState.hardness = 0.5;
    self.brushState.roundness = 0.5;
    self.brushState.angle = 30;
    self.brushState.angleJitter = 0.0;
    self.brushState.angleFade = 0.0;
    self.brushState.spacing = 0.05;
    self.brushState.scattering = 0.0;
    self.brushState.isAirbrush = false;
    self.brushState.isDissolve = false;
    self.brushState.isVelocitySensor = false;
    self.brushState.isRadiusMagnifySensor = false;    
    self.brushState.wet = 0;
    
    [self setBrushCommonTextures];
    [self setBrushShapeTexture:@"brush_square_64.png"];
}
@end
