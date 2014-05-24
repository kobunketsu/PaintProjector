//
//  PaintLayer.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-4-5.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "PaintLayer.h"

@implementation PaintLayer

- (id)initWithData:(NSData*)data name:(NSString *)name identifier:(NSString*)identifier blendMode:(LayerBlendMode)blendMode visible:(bool)visible opacity:(float)opacity opacityLock:(BOOL)opacityLock{
    self = [super init];
    if(self!=NULL){
        self.data = data;
        self.name = name;
        self.identifier = identifier;
        self.blendMode = blendMode;
        self.visible = visible;
        self.opacityLock = opacityLock;
        self.dirty = true;
        self.opacity = 1.0;

    }
    
    return self;
}

#define kName             @"Name"
#define kIdentifier       @"Identifier"
#define kBlendModeKey     @"BlendMode"
#define kDataKey          @"Data"
#define kVisibleKey       @"Visible"
#define kOpacityKey       @"Opacity"
#define kOpacityLockKey   @"OpacityLock"

- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.data forKey:kDataKey];
    [encoder encodeObject:self.name forKey:kName];
    [encoder encodeObject:self.identifier forKey:kIdentifier];
    [encoder encodeInteger:(NSInteger)self.blendMode forKey:kBlendModeKey];
    [encoder encodeBool:self.visible forKey:kVisibleKey];
    [encoder encodeFloat:self.opacity forKey:kOpacityKey];
    [encoder encodeBool:self.opacityLock forKey:kOpacityLockKey];
//    DebugLog(@"endcodeWithCoder data:%d blendMode:%d visible:%i opacity:%.2f", (id)self.data, (int)self.blendMode, self.visible, self.opacity);
}

- (id) initWithCoder:(NSCoder *)decoder {
    NSData *data = [decoder decodeObjectForKey:kDataKey];
    NSString *name = [decoder decodeObjectForKey:kName];
    NSString *identifier = [decoder decodeObjectForKey:kIdentifier];
    LayerBlendMode blendMode = (LayerBlendMode)[decoder decodeIntegerForKey:kBlendModeKey];
    bool visible = [decoder decodeBoolForKey:kVisibleKey];
    float opacity = [decoder decodeFloatForKey:kOpacityKey];
    BOOL opacityLock = [decoder decodeBoolForKey:kOpacityLockKey];
//    DebugLog(@"initWithCoder data:%d blendMode:%d visible:%i opacity:%.2f", (id)data, (int)blendMode, visible, opacity);
    return [self initWithData:data name:name identifier:identifier blendMode:blendMode visible:visible opacity:opacity opacityLock:opacityLock];
}

- (id)copyWithZone:(NSZone *)zone{
    PaintLayer *layer = [[PaintLayer alloc] init];
    layer.name = self.name;
    layer.identifier = self.identifier;
    layer.blendMode = self.blendMode;
    layer.visible = self.visible;
    layer.opacity = self.opacity;
    layer.dirty = self.dirty;
    layer.data = [self.data copyWithZone:zone];
    layer.opacityLock = self.opacityLock;
    
    return layer;
}

+ (PaintLayer*)createBlankLayerWithSize:(CGSize)size transparent:(BOOL)transparent{
//    NSInteger width = UndoImageSize;NSInteger height = UndoImageSize;
    NSInteger width = size.width;NSInteger height = size.height;
    NSInteger dataLength = width * height * 4;
    GLubyte *data = (GLubyte*)malloc(dataLength * sizeof(GLubyte));
    //初始化颜色
    for (int i=0; i< width * height; i++) {
        if(transparent){
            data[i*4] = 0;   //red
            data[i*4+1] =0; //green
            data[i*4+2] = 0;    //blue
            data[i*4+3] = 0;    //alpha
        }
        else{
            data[i*4] = 255;
            data[i*4+1] = 255;
            data[i*4+2] = 255;
            data[i*4+3] = 255;
        }
    }
    // Create a CGImage with the pixel data
    // If your OpenGL ES content is opaque, use kCGImageAlphaNoneSkipLast to ignore the alpha channel
    // otherwise, use kCGImageAlphaPremultipliedLast
    CGDataProviderRef dataProvider = CGDataProviderCreateWithData(NULL, data, dataLength, NULL);
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGImageRef image = CGImageCreate(width, height, 8, 32, width * 4, colorspace, kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast,
                                    dataProvider, NULL, true, kCGRenderingIntentDefault);
    
    NSData* nsData = UIImagePNGRepresentation([UIImage imageWithCGImage:image]);

    // Clean up
    free(data);
    CFRelease(dataProvider);
    CFRelease(colorspace);
    CGImageRelease(image);

    CFUUIDRef   uuidObj = CFUUIDCreate(nil);
    NSString    *uuidString = (__bridge_transfer NSString *)CFUUIDCreateString(nil, uuidObj);
    CFRelease(uuidObj);
    
    PaintLayer* layer = [[PaintLayer alloc]initWithData:nsData name:@"NewLayer" identifier:uuidString blendMode:kLayerBlendModeNormal visible:true opacity:1.0 opacityLock:false];

    return layer;
}
- (void)setOpacity:(float)opacity{
    if (_opacity != opacity) {
        _opacity = opacity;
        _dirty = true;
    }
}

- (void)setBlendMode:(LayerBlendMode)blendMode{
    if (_blendMode != blendMode) {
        _blendMode = blendMode;
        _dirty = true;
    }
}

- (void)setVisible:(bool)visible{
    if (_visible != visible) {
        _visible = visible;
        _dirty = true;
    }
}

- (void)setOpacityLock:(bool)opacityLock{
    if (_opacityLock != opacityLock) {
        _opacityLock = opacityLock;
        _dirty = true;
    }
}
@end
