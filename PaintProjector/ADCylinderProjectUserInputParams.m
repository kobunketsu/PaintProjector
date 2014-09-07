//
//  CylinderProjectUserInputParams.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/16/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADCylinderProjectUserInputParams.h"

@implementation ADCylinderProjectUserInputParams
+ (NSString*)currentVersion{
    return DocVersion;
}
- (id)init{
    self = [super init];
    if (self) {
        _cylinderDiameter = 0.038;
        _cylinderHeight = 0.07;
        _imageWidth = 0.038;
        _imageCenterOnSurfHeight = 0.035;
        _eyeHonrizontalDistance = 0.35;
        _eyeVerticalHeight = 0.4;
        _eyeZoom = 1;
        _unitZoom = 1;
        _eyeTopZ = 0.01;
        _version = DocVersion;
    }
    return self;
}

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
    params.version = self.version;
    if (self.version.floatValue <= [ADCylinderProjectUserInputParams currentVersion].floatValue) {
        params.cylinderDiameter = self.cylinderDiameter;
        params.cylinderHeight = self.cylinderHeight;
        params.imageWidth = self.imageWidth;
        params.imageCenterOnSurfHeight = self.imageCenterOnSurfHeight;
        params.eyeHonrizontalDistance = self.eyeHonrizontalDistance;
        params.eyeVerticalHeight = self.eyeVerticalHeight;
        params.eyeZoom = self.eyeZoom;
        params.eyeTopZ = self.eyeTopZ;
        params.unitZoom = self.unitZoom;
    }
    else{
        DebugLogError(@"new doc version %.1f not supported in current version. %.1f", _version.floatValue, ((NSString*)DocVersion).floatValue);
        return nil;
    }

    return params;
}
#define kVersionKey                     @"Version"
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
    [encoder encodeObject:self.version forKey:kVersionKey];
    if (self.version.floatValue <= [ADCylinderProjectUserInputParams currentVersion].floatValue) {
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
    else{
        DebugLogError(@"new doc version %.1f not supported in current version. %.1f", _version.floatValue, ((NSString*)DocVersion).floatValue);
        return;
    }
}

- (id) initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self) {
        _version = [decoder decodeObjectForKey:kVersionKey];
        if (_version.floatValue <= [ADCylinderProjectUserInputParams currentVersion].floatValue) {
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
        else{
            DebugLogError(@"new doc version %.1f not supported in current version. %.1f", _version.floatValue, ((NSString*)DocVersion).floatValue);
            return nil;
        }
    }
    return self;
}

- (NSMutableDictionary*)propertyNameValueDic{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:[NSNumber numberWithFloat:self.cylinderDiameter] forKey:@"cylinderDiameter"];
    [dic setObject:[NSNumber numberWithFloat:self.cylinderHeight] forKey:@"cylinderHeight"];
    [dic setObject:[NSNumber numberWithFloat:self.imageWidth] forKey:@"imageWidth"];
    [dic setObject:[NSNumber numberWithFloat:self.imageCenterOnSurfHeight] forKey:@"imageCenterOnSurfHeight"];
    [dic setObject:[NSNumber numberWithFloat:self.eyeHonrizontalDistance] forKey:@"eyeHonrizontalDistance"];
    [dic setObject:[NSNumber numberWithFloat:self.eyeVerticalHeight] forKey:@"eyeVerticalHeight"];
    [dic setObject:[NSNumber numberWithFloat:self.eyeZoom] forKey:@"eyeZoom"];
    [dic setObject:[NSNumber numberWithFloat:self.eyeTopZ] forKey:@"eyeTopZ"];
    [dic setObject:[NSNumber numberWithFloat:self.unitZoom] forKey:@"unitZoom"];
    return dic;
}

@end
