//
//  CylinderProjectUserInputParams.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/16/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADCylinderProjectUserInputParams.h"

@implementation ADCylinderProjectUserInputParams
//- (void)setEyeZoom:(CGFloat)eyeZoom{
//    DebugLogWarn(@"setEyeZoom %.1f", eyeZoom);
//    _eyeZoom = eyeZoom;
//}
//- (void)setImageCenterOnSurfHeight:(CGFloat)imageCenterOnSurfHeight{
//    DebugLogWarn(@"setImageCenterOnSurfHeight %.1f", imageCenterOnSurfHeight);
//    _imageCenterOnSurfHeight = imageCenterOnSurfHeight;
//}
//
//- (void)setUnitZoom:(CGFloat)unitZoom{
//    DebugLogWarn(@"setUnitZoom %.1f", unitZoom);
//    _unitZoom = unitZoom;
//}

- (id)copyWithZone:(NSZone *)zone{
    ADCylinderProjectUserInputParams *params = [[ADCylinderProjectUserInputParams alloc]init];
    params.cylinderDiameter = self.cylinderDiameter;
    params.cylinderHeight = self.cylinderHeight;
    params.imageWidth = self.imageWidth;
    params.imageCenterOnSurfHeight = self.imageCenterOnSurfHeight;
    params.eyeHonrizontalDistance = self.eyeHonrizontalDistance;
    params.eyeVerticalHeight = self.eyeVerticalHeight;
    params.eyeZoom = self.eyeZoom;
    params.eyeTopZ = self.eyeTopZ;
    params.unitZoom = self.unitZoom;
    return params;
}

#define kCylinderDiameterKey            @"CylinderDiameter"
#define kCylinderHeightKey              @"CylinderHeight"
#define kImageWidthKey                  @"ImageWidth"
#define kImageCenterOnSurfHeightKey     @"ImageCenterOnSurfHeight"
#define kEyeHonrizontalDistanceKey      @"EyeHonrizontalDistance"
#define kEyeVerticalHeightKey           @"EyeVerticalHeight"
#define kEyeZoomKey                     @"EyeZoom"
#define kEyeTopZKey                     @"EyeTopZ"
#define kUnitZoomKey                    @"UnitZoom"

- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeFloat:self.cylinderDiameter forKey:kCylinderDiameterKey];
    [encoder encodeFloat:self.cylinderHeight forKey:kCylinderHeightKey];
    [encoder encodeFloat:self.imageWidth forKey:kImageWidthKey];
    [encoder encodeFloat:self.imageCenterOnSurfHeight forKey:kImageCenterOnSurfHeightKey];
    [encoder encodeFloat:self.eyeHonrizontalDistance forKey:kEyeHonrizontalDistanceKey];
    [encoder encodeFloat:self.eyeVerticalHeight forKey:kEyeVerticalHeightKey];
    [encoder encodeFloat:self.eyeZoom forKey:kEyeZoomKey];
    [encoder encodeFloat:self.eyeTopZ forKey:kEyeTopZKey];
    [encoder encodeFloat:self.unitZoom forKey:kUnitZoomKey];
}

- (id) initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self) {
        _cylinderDiameter = [decoder decodeFloatForKey:kCylinderDiameterKey];
        _cylinderHeight = [decoder decodeFloatForKey:kCylinderHeightKey];
        _imageWidth = [decoder decodeFloatForKey:kImageWidthKey];
        _imageCenterOnSurfHeight = [decoder decodeFloatForKey:kImageCenterOnSurfHeightKey];
        _eyeHonrizontalDistance = [decoder decodeFloatForKey:kEyeHonrizontalDistanceKey];
        _eyeVerticalHeight = [decoder decodeFloatForKey:kEyeVerticalHeightKey];
        _eyeZoom = [decoder decodeFloatForKey:kEyeZoomKey];
        _eyeTopZ = [decoder decodeFloatForKey:kEyeTopZKey];
        _unitZoom = [decoder decodeFloatForKey:kUnitZoomKey];
    }
    return self;
}
@end
