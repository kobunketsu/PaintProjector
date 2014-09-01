//
//  Pencil.m
//  PaintProjector
//
//  Created by 文杰 胡 on 12-11-12.
//  Copyright (c) 2012年 Hu Wenjie. All rights reserved.
//

#import "ADPencil.h"
static ADBrushState *brushStatePencil = nil;
@implementation ADPencil
//- (id)initWithPaintView:(PaintingView *)paintView{
//    self = [super initWithPaintView:paintView];
//    if (self !=nil) {
//        [self resetDefaultBrushState];
//    }
//    
//    return self;
//}
+(void)setBrushStateTemplate:(ADBrushState*)brushState{
    brushStatePencil = brushState;
}
+(ADBrushState*)brushStateTemplate{
    return brushStatePencil;
}
- (NSString*)name{
    return @"ADPencil";
}

- (BOOL)isEditable{
    return true;
}

- (void)setRadiusSliderValue{
    self.radiusSliderMinValue = 1;
    self.radiusSliderMaxValue = 5;
}

- (void)resetDefaultBrushState{
    self.brushState.radius = 3;
    self.brushState.radiusFade = 0;
    self.brushState.radiusJitter = 0;
    self.brushState.opacity = 1.0;
    self.brushState.flow = 1.0;
    self.brushState.flowFade = 0;
    self.brushState.flowJitter = 0;
    self.brushState.angle = 360;
    self.brushState.angleFade = 0;
    self.brushState.angleJitter = 1.0;
    self.brushState.roundness = 1.0;
    self.brushState.hardness = 1.0;
    self.brushState.spacing = 0.25;
    self.brushState.scattering = 0;
    self.brushState.isPatternTexture = true;
    self.brushState.isAirbrush = false;
    self.brushState.isVelocitySensor = false;
    self.brushState.isRadiusMagnifySensor = false;    
    self.brushState.wet = 0;
}

- (void)resetDefaultTextures{
    [super resetDefaultTextures];
    [self setBrushShapeTexture:@"brushPencilShape_r64.png"];
    [self setPatternTextureWithImage:@"brushPencilGrain_r64.png"];
}

- (BOOL)free{
    return true;
}

@end
