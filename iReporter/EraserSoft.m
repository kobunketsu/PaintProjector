//
//  EraserSoft.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-10-19.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "EraserSoft.h"

@implementation EraserSoft

- (NSString*)name{
    return @"EraserSoft";
}

- (void)resetDefaultBrushState{
    self.brushState.opacity = 1;
    self.brushState.flow = 1.0;
    self.brushState.flowJitter = 0.0;
    self.brushState.flowFade = 0.0;
    self.brushState.radius = 10;
    self.brushState.radiusJitter = 0.0;
    self.brushState.radiusFade = 0.0;
    self.brushState.hardness = 0.5;
    self.brushState.roundness = 1.0;
    self.brushState.angle = 0;
    self.brushState.angleJitter = 0.0;
    self.brushState.angleFade = 0.0;
    self.brushState.spacing = 0.2;
    self.brushState.scattering = 0.0;
    self.brushState.isAirbrush = false;
    self.brushState.isDissolve = false;
    self.brushState.isVelocitySensor = false;
    self.brushState.isRadiusMagnifySensor = false;    
    self.brushState.wet = 0;
    
    [self setBrushCommonTextures];
    [self setBrushShapeTexture:nil];
}

- (BOOL)free{
    return true;
}
@end
