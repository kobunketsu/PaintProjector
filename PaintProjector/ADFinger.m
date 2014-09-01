//
//  Figure.m
//  PaintProjector
//
//  Created by 文杰 胡 on 13-1-25.
//  Copyright (c) 2013年 Hu Wenjie. All rights reserved.
//

#import "ADFinger.h"
static ADBrushState *brushStateFinger = nil;
@implementation ADFinger
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
    brushStateFinger = brushState;
}
+(ADBrushState*)brushStateTemplate{
    return brushStateFinger;
}
- (NSString*)name{
    return @"ADFinger";
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
    self.brushState.flow = 0.5;
    self.brushState.flowFade = 0;
    self.brushState.flowJitter = 0;
    self.brushState.angle = 0;
    self.brushState.angleFade = 0;
    self.brushState.angleJitter = 0;
    self.brushState.roundness = 1.0;
    self.brushState.hardness = 0;
    self.brushState.spacing = 0.1;
    //    self.brushState.spacing = 1.0 / self.brushState.radius;
    self.brushState.scattering = 0;
    self.brushState.isPatternTexture = false;
    self.brushState.isAirbrush = false;
    self.brushState.isVelocitySensor = false;
    self.brushState.isRadiusMagnifySensor = false;
    self.brushState.wet = 0.95;
}

- (BOOL)free{
    return false;
}

- (NSInteger)iapProductFeatureId{
    return 2;
}
@end
