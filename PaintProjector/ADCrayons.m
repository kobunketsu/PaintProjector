//
//  Crayons.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-10-19.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADCrayons.h"
static ADBrushState *brushStateCrayons = nil;
@implementation ADCrayons
//- (id)initWithPaintView:(PaintingView *)paintView{
//    self = [super initWithPaintView:paintView];
//    if (self !=nil) {
//        [self resetDefaultBrushState];
//    }
//    
//    return self;
//}
+(void)setBrushStateTemplate:(ADBrushState*)brushState{
    brushStateCrayons = brushState;
}
+(ADBrushState*)brushStateTemplate{
    return brushStateCrayons;
}
- (NSString*)name{
    return @"ADCrayons";
}

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
    self.brushState.radiusJitter = 0;
    self.brushState.opacity = 1.0;
    self.brushState.flow = 0.5;
    self.brushState.flowFade = 0;
    self.brushState.flowJitter = 0;
    self.brushState.angle = 360;
    self.brushState.angleFade = 0;
    self.brushState.angleJitter = 1.0;
    self.brushState.roundness = 1.0;
    self.brushState.hardness = 1.0;
    self.brushState.spacing = 0.025;
    self.brushState.scattering = 0;
    self.brushState.isAirbrush = false;
    self.brushState.isPatternTexture = true;
    self.brushState.isVelocitySensor = false;
    self.brushState.isRadiusMagnifySensor = false;    
    self.brushState.wet = 0;
}

- (void)resetDefaultTextures{
    [super resetDefaultTextures];
    [self setShapeTextureWithName:@"brushCrayonsShape_r64.png"];
    [self setPatternTextureWithName:@"brushCrayonsGrain_r64.png"];
}

- (BOOL)free{
    return false;
}

- (NSInteger)iapProductFeatureId{
    return 1;
}
@end
