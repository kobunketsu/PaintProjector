//
//  PaintLayer.h
//  iReporter
//
//  Created by 胡 文杰 on 13-4-5.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import <Foundation/Foundation.h>

enum LayerBlendMode {
#if SIMPLE_LAYER    
    kLayerBlendModeNormal,
    kLayerBlendModeMultiply,
    kLayerBlendModeAdd,
    kLayerBlendModeScreen
#else
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
    kLayerBlendModeLuminosity
#endif
};
typedef enum LayerBlendMode LayerBlendMode;



@interface PaintLayer : NSObject
{
    NSData* _data;
    LayerBlendMode _blendMode;
    bool _visible;
    bool _dirty;
}
@property (nonatomic, retain) NSData* data;
@property (nonatomic, assign) LayerBlendMode blendMode;
@property (nonatomic, assign) bool visible;
@property (nonatomic, assign) bool dirty;
- (id)initWithData:(NSData*)data blendMode:(LayerBlendMode)blendMode visible:(bool)visible;
+ (PaintLayer*)createBlankLayerWithSize:(CGSize)size transparent:(BOOL)transparent;
@end
