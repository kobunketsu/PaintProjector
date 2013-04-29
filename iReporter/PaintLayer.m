//
//  PaintLayer.m
//  iReporter
//
//  Created by 胡 文杰 on 13-4-5.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "PaintLayer.h"

@implementation PaintLayer
@synthesize data = _data;
@synthesize blendMode = _blendMode;
@synthesize visible = _visible;
@synthesize dirty = _dirty;

- (id)initWithData:(NSData*)data blendMode:(LayerBlendMode)blendMode visible:(bool)visible{
    if([self init]!=nil){
        _data = data;
        _blendMode = blendMode;
        _visible = visible;
        _dirty = true;
        
//        NSLog(@"initWithData data:%d blendMode:%d visible %i", (id)data, (int)blendMode, visible);
        return self;
    }
    return nil;
}


#define kBlendModeKey     @"BlendMode"
#define kDataKey          @"Data"
#define kVisibleKey       @"Visible"

- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:_data forKey:kDataKey];
    [encoder encodeInteger:(NSInteger)_blendMode forKey:kBlendModeKey];
    [encoder encodeBool:_visible forKey:kVisibleKey];
    NSLog(@"endcodeWithCoder data:%d blendMode:%d visible:%i", (id)_data, (int)_blendMode, _visible);
}

- (id) initWithCoder:(NSCoder *)decoder {
    NSData *data = [decoder decodeObjectForKey:kDataKey];
    LayerBlendMode blendMode = (LayerBlendMode)[decoder decodeObjectForKey:kBlendModeKey];
    bool visible = [decoder decodeBoolForKey:kVisibleKey];
    NSLog(@"initWithCoder data:%d blendMode:%d visible:%i", (id)data, (int)blendMode, visible);    
    return [self initWithData:data blendMode:blendMode visible:visible];
}

+ (PaintLayer*)createBlankLayerWithSize:(CGSize)size transparent:(BOOL)transparent{
    NSInteger width = UndoImageSize;NSInteger height = UndoImageSize;
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
    CGImageRef image = CGImageCreate(width, height, 8, 32, width * 4, colorspace, kCGBitmapByteOrder32Big | kCGImageAlphaPremultipliedLast,
                                    dataProvider, NULL, true, kCGRenderingIntentDefault);
    
    NSData* nsData = UIImagePNGRepresentation([UIImage imageWithCGImage:image]);

    // Clean up
    free(data);
    CFRelease(dataProvider);
    CFRelease(colorspace);
    CGImageRelease(image);

    PaintLayer* layer = [[PaintLayer alloc]initWithData:nsData blendMode:kLayerBlendModeNormal visible:true];
    
    return layer;
}
@end
