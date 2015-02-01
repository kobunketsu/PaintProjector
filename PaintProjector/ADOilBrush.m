//
//  OilBrush.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-10-19.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADOilBrush.h"
static ADBrushState *brushStateOilBrush = nil;
@implementation ADOilBrush
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
+(void)setBrushStateTemplate:(ADBrushState*)brushState{
    brushStateOilBrush = brushState;
}
+(ADBrushState*)brushStateTemplate{
    return brushStateOilBrush;
}
- (NSString*)name{
    return @"ADOilBrush";
}

- (BOOL)isEditable{
    return true;
}

- (void)setRadiusSliderValue{
    self.radiusSliderMinValue = 2;
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
    self.brushState.isPatternTexture = false;
    self.brushState.isAirbrush = false;
    self.brushState.isVelocitySensor = false;
    self.brushState.isRadiusMagnifySensor = false;    
    self.brushState.wet = 0.9;
}

- (void)resetDefaultTextures{
    [super resetDefaultTextures];
    [self setShapeTextureWithName:@"brush_dryTip_64.png"];
}

- (BOOL)free{
    return false;
}

- (NSInteger)iapProductFeatureId{
    return 6;
}
@end
