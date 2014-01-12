//
//  PaintLayer.h
//  iReporter
//
//  Created by 胡 文杰 on 13-4-5.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Layer.h"

enum LayerBlendMode {
    kLayerBlendModeNormal,
    kLayerBlendModeMultiply,
    kLayerBlendModeScreen,
    kLayerBlendModeOverlay,
    kLayerBlendModeDarken,
    kLayerBlendModeLighten,
    kLayerBlendModeColorDodge,
    kLayerBlendModeColorBurn,
    kLayerBlendModeSoftLight,
    kLayerBlendModeHardLight,
    kLayerBlendModeDifference,
    kLayerBlendModeExclusion,
    kLayerBlendModeHue,
    kLayerBlendModeSaturation,
    kLayerBlendModeColor,
    kLayerBlendModeLuminosity,
    kLayerBlendModeMaxCount
};
typedef enum LayerBlendMode LayerBlendMode;


@interface PaintLayer : Layer
{
}
@property (nonatomic, retain) NSData* data;
@property (nonatomic, assign) LayerBlendMode blendMode;
@property (nonatomic, assign) bool dirty;
@property (nonatomic, assign) float opacity;
@property (nonatomic, assign) bool visible;
- (id)initWithData:(NSData*)data blendMode:(LayerBlendMode)blendMode visible:(bool)visible opacity:(float)opacity;
+ (PaintLayer*)createBlankLayerWithSize:(CGSize)size transparent:(BOOL)transparent;
@end
