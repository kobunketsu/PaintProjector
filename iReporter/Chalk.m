//
//  Chalk.m
//  iReporter
//
//  Created by 文杰 胡 on 13-1-12.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "Chalk.h"

@implementation Chalk
//- (id)initWithPaintView:(PaintingView *)paintView{
//    self = [super initWithPaintView:paintView];
//    if (self !=nil) {
////        [self setPatternTextureWithImage:@"chalkStroke.png"];
//
//        
//        [self resetDefaultBrushState];
//    }
//    
//    return self;
//}

- (NSString*)name{
    return @"Chalk";
}

- (BOOL)isEditable{
    return true;
}

- (void)setRadiusSliderValue{
    self.radiusSliderMinValue = 2;
    self.radiusSliderMaxValue = 10;
}

- (void)resetDefaultBrushState{
    self.brushState.radius = 10;
    self.brushState.radiusFade = 0;
    self.brushState.radiusJitter = 0.5;
    self.brushState.opacity = 1.0;
    self.brushState.flow = 0.8;
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
    
    [self setBrushCommonTextures];
    [self setBrushShapeTexture:nil];
}

- (BOOL)free{
    return false;
}
@end
