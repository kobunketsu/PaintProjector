//
//  PaintLayer.h
//  PaintProjector
//
//  Created by 胡 文杰 on 13-4-5.
//  Copyright (c) 2013年 Hu Wenjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADLayer.h"

enum LayerBlendMode {
    kLayerBlendModeNormal,
    kLayerBlendModeMultiply,
    kLayerBlendModeScreen,
    kLayerBlendModeAdd,
    kLayerBlendModeLighten,
    kLayerBlendModeExclusion,
    kLayerBlendModeDifference,
    kLayerBlendModeSubstract,
    kLayerBlendModeLinearBurn,
    kLayerBlendModeColorDodge,
    kLayerBlendModeColorBurn,
    kLayerBlendModeOverlay,
    kLayerBlendModeHardLight,
    kLayerBlendModeColor,
    kLayerBlendModeLuminosity,
    kLayerBlendModeSoftLight,
    kLayerBlendModeHue,
    kLayerBlendModeSaturation,
    kLayerBlendModeMaxCount
};
typedef enum LayerBlendMode LayerBlendMode;


@interface ADPaintLayer : ADLayer
{
}
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *identifier;
@property (retain, nonatomic) NSData *data;
@property (assign, nonatomic) LayerBlendMode blendMode;
@property (assign, nonatomic) float opacity;
@property (assign, nonatomic) bool opacityLock;
@property (assign, nonatomic) bool operationLock;
//@property (assign, nonatomic) bool dirty;
//@property (assign, nonatomic) bool visible;
+ (ADPaintLayer*)createBlankLayerWithSize:(CGSize)size transparent:(BOOL)transparent;
+ (ADPaintLayer*)createLayerFormUIImage:(UIImage*)image withSize:(CGSize)size;
@end
