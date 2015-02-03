//
//  ADBrushState.m
//  PaintProjector
//
//  Created by kobunketsu on 9/23/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADBrushState.h"

#define kVersionKey             @"version"
#define kClassIdKey             @"classId"
#define kRadiusKey              @"radius"
#define kRadiusJitterKey              @"radiusJitter"
#define kRadiusFadeKey              @"radiusFade"
#define kHardnessKey              @"hardness"
#define kRoundnessKey              @"roundness"
#define kAngleKey              @"angle"
#define kAngleJitterKey              @"angleJitter"
#define kAngleFadeKey              @"angleFade"
#define kColorRKey              @"colorR"
#define kColorGKey              @"colorG"
#define kColorBKey              @"colorB"
#define kColorAKey              @"colorA"
#define kOpacityKey              @"opacity"
#define kFlowKey              @"flow"
#define kFlowJitterKey              @"flowJitter"
#define kFlowFadeKey              @"flowFade"
#define kSeedKey              @"seed"
#define kSpacingKey              @"spacing"
#define kScatteringKey              @"scattering"
#define kWetKey              @"wet"
#define kWaterColorBlendKey              @"waterColorBlend"
#define kIsPatternTextureKey              @"isPatternTexture"
#define kIsAirbrushKey              @"isAirbrush"
#define kIsShapeTextureKey              @"isShapeTexture"
#define kIsVelocitySensorKey              @"isVelocitySensor"
#define kIsRadiusMagnifySensorKey              @"isRadiusMagnifySensor"
#define kIsOpacityLockedKey              @"isOpacityLocked"
@implementation ADBrushState


- (id)copyWithZone:(NSZone *)zone{
    ADBrushState *state = [[ADBrushState alloc] init];
    state.classId = self.classId;
    state.seed = self.seed;
    state.radius = self.radius;
    state.radiusJitter = self.radiusJitter;
    state.radiusFade = self.radiusFade;
    state.hardness = self.hardness;
    state.roundness = self.roundness;
    state.angle = self.angle;
    state.angleJitter = self.angleJitter;
    state.angleFade = self.angleFade;
    state.color = self.color;
    state.opacity = self.opacity;
    state.flow = self.flow;
    state.flowJitter = self.flowJitter;
    state.flowFade = self.flowFade;
    state.spacing = self.spacing;
    state.scattering = self.scattering;
    state.isPatternTexture = self.isPatternTexture;
    state.isAirbrush = self.isAirbrush;
    state.isShapeTexture = self.isShapeTexture;
    state.isVelocitySensor = self.isVelocitySensor;
    state.isRadiusMagnifySensor = self.isRadiusMagnifySensor;
    state.wet = self.wet;
    state.waterColorBlend = self.waterColorBlend;
    state.isOpacityLocked = self.isOpacityLocked;
    return state;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:DocVersion forKey:kVersionKey];
    if (self.version.floatValue <= ((NSString*)DocVersion).floatValue) {
        [aCoder encodeInteger:self.classId forKey:kClassIdKey];
        [aCoder encodeInteger:self.seed forKey:kSeedKey];
        [aCoder encodeFloat:self.radius forKey:kRadiusKey];
        [aCoder encodeFloat:self.radiusJitter forKey:kRadiusJitterKey];
        [aCoder encodeFloat:self.radiusFade forKey:kRadiusFadeKey];
        [aCoder encodeFloat:self.hardness forKey:kHardnessKey];
        [aCoder encodeFloat:self.roundness forKey:kRoundnessKey];
        [aCoder encodeFloat:self.angle forKey:kAngleKey];
        [aCoder encodeFloat:self.angleJitter forKey:kAngleJitterKey];
        [aCoder encodeFloat:self.angleFade forKey:kAngleFadeKey];
        [aCoder encodeFloat:self.opacity forKey:kOpacityKey];
        [aCoder encodeFloat:self.flow forKey:kFlowKey];
        [aCoder encodeFloat:self.flowJitter forKey:kFlowJitterKey];
        [aCoder encodeFloat:self.flowFade forKey:kFlowFadeKey];
        [aCoder encodeFloat:self.spacing forKey:kSpacingKey];
        [aCoder encodeFloat:self.scattering forKey:kScatteringKey];
        [aCoder encodeBool:self.isPatternTexture forKey:kIsPatternTextureKey];
        [aCoder encodeBool:self.isAirbrush forKey:kIsAirbrushKey];
        [aCoder encodeBool:self.isShapeTexture forKey:kIsShapeTextureKey];
        [aCoder encodeBool:self.isVelocitySensor forKey:kIsVelocitySensorKey];
        [aCoder encodeBool:self.isRadiusMagnifySensor forKey:kIsRadiusMagnifySensorKey];
        [aCoder encodeBool:self.isOpacityLocked forKey:kIsOpacityLockedKey];
        [aCoder encodeFloat:self.wet forKey:kWetKey];
        [aCoder encodeFloat:self.waterColorBlend forKey:kWaterColorBlendKey];
        const float*colors = CGColorGetComponents(self.color.CGColor);
        [aCoder encodeFloat:colors[0] forKey:kColorRKey];
        [aCoder encodeFloat:colors[1] forKey:kColorGKey];
        [aCoder encodeFloat:colors[2] forKey:kColorBKey];
        [aCoder encodeFloat:colors[3] forKey:kColorAKey];
    }
    else{
        DebugLogError(DocVersionErrorMessage, _version.floatValue, ((NSString*)DocVersion).floatValue);
        return;
    }
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _version = [aDecoder decodeObjectForKey:kVersionKey];
        if (_version.floatValue >= 1.11) {
            _classId = [aDecoder decodeIntegerForKey:kClassIdKey];
            _seed = [aDecoder decodeIntegerForKey:kSeedKey];
            _radius = [aDecoder decodeFloatForKey:kRadiusKey];
            _radiusJitter = [aDecoder decodeFloatForKey:kRadiusJitterKey];
            _radiusFade = [aDecoder decodeFloatForKey:kRadiusFadeKey];
            _hardness = [aDecoder decodeFloatForKey:kHardnessKey];
            _roundness = [aDecoder decodeFloatForKey:kRoundnessKey];
            _angle = [aDecoder decodeFloatForKey:kAngleKey];
            _angleJitter = [aDecoder decodeFloatForKey:kAngleJitterKey];
            _angleFade = [aDecoder decodeFloatForKey:kAngleFadeKey];
            _opacity = [aDecoder decodeFloatForKey:kOpacityKey];
            _flow = [aDecoder decodeFloatForKey:kFlowKey];
            _flowJitter = [aDecoder decodeFloatForKey:kFlowJitterKey];
            _flowFade = [aDecoder decodeFloatForKey:kFlowFadeKey];
            _spacing = [aDecoder decodeFloatForKey:kSpacingKey];
            _scattering = [aDecoder decodeFloatForKey:kScatteringKey];
            _isPatternTexture = [aDecoder decodeBoolForKey:kIsPatternTextureKey];
            _isAirbrush = [aDecoder decodeBoolForKey:kIsAirbrushKey];
            _isShapeTexture = [aDecoder decodeBoolForKey:kIsShapeTextureKey];
            _isVelocitySensor = [aDecoder decodeBoolForKey:kIsVelocitySensorKey];
            _isRadiusMagnifySensor = [aDecoder decodeBoolForKey:kIsRadiusMagnifySensorKey];
            _isOpacityLocked = [aDecoder decodeBoolForKey:kIsOpacityLockedKey];
            _wet = [aDecoder decodeFloatForKey:kWetKey];
            _waterColorBlend = [aDecoder decodeFloatForKey:kWaterColorBlendKey];
            CGFloat r = [aDecoder decodeFloatForKey:kColorRKey];
            CGFloat g = [aDecoder decodeFloatForKey:kColorGKey];
            CGFloat b = [aDecoder decodeFloatForKey:kColorBKey];
            CGFloat a = [aDecoder decodeFloatForKey:kColorAKey];
            _color = [UIColor colorWithRed:r green:g blue:b alpha:a];
        }
    }
    return self;
}
@end
