//
//  ADReversePaint.m
//  PaintProjector
//
//  Created by 胡 文杰 on 8/27/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADReversePaint.h"
#import "ADPaintView.h"
#import "ADCylinderImage.h"
#import "ADShaderCylinderImage.h"
#import "ADPlaneMesh.h"
#import "REMeshFilter.h"
#import "REMeshRenderer.h"

@interface ADReversePaint()
@property(weak, nonatomic) ADPaintView *paintView;
@property (weak, nonatomic) ADPaintData *reversePaintData;//反向绘制数据
@property (retain, nonatomic) ADPaintData *srcPaintData;//正向绘制数据的拷贝

@property (retain, nonatomic) ADPaintData *paintData;//合成中的新数据
@property(retain, nonatomic)ADCylinderImage *cylinderImage;
@property(retain, nonatomic)RECamera *reversePaintCamera;
@end

@implementation ADReversePaint
- (id)initWithPaintView:(ADPaintView*)paintView srcPaintData:(ADPaintData*)srcPaintData{
    self = [super init];
    if (self) {
        _paintView = paintView;
        _reversePaintData = _paintView.paintData;
        _srcPaintData = srcPaintData;
        _layerTextures = [[NSMutableArray alloc]init];
    }
    return self;
}
- (void)dealloc{
//    self.srcPaintData = nil;
//    self.reversePaintData = nil;
//    self.paintData = nil;
}

#pragma mark- TransferReversePaint
- (ADPaintData *)combineReversePaintData{
    DebugLogGLGroupStart(@"combineReversePaintDataWithSrcPaintData");

    //创建资源
    [self createReversePaintResource];DebugLogMem(@"did createReversePaintResource");
    self.paintData = [_srcPaintData copy];DebugLogMem(@"did _srcPaintData copy to self.paintData");//合成数据的初始从正向数据中拷贝
    [self createSrcLayerRenderTextures];DebugLogMem(@"did createLayerRenderTextures");

    //合成反向绘制的内容到正向绘制的拷贝中，合成成新的paintData给paintDoc.data
    //add combined layerTexture and paintData layer
    [self combineReverseToSrc];DebugLogMem(@"did combine");
//        DebugLogGLSnapshotStart
    //layerTexture -> finalFramebuffer必须是合成后的效果，用于缩略图
    [self updateRender];DebugLogMem(@"did updateRender");
//        DebugLogGLSnapshotEnd
    //layerTexture -> paintData.layer.data
    [self uploadReverseLayerDatas];DebugLogMem(@"did uploadLayerDatas");

    //删除资源
    [self deleteSrcLayerRenderTextures];DebugLogMem(@"did deleteLayerRenderTextures");
    [self destroyReversePaintResource];DebugLogMem(@"did destroyReversePaintResource");

    DebugLogGLGroupEnd();
    return self.paintData;
}

- (void)createReversePaintResource{
    DebugLogGLGroupStart(@"createReversePaintResource");
    
    ADShaderCylinderImage *shaderCylinderImage = (ADShaderCylinderImage *)[[REGLWrapper current]createShader:@"ADShaderCylinderImage"];
    REMaterial *matCylinderImage = [[REMaterial alloc]initWithShader:shaderCylinderImage];
    matCylinderImage.faceMode = RE_BackFace;
    
    ADPlaneMesh *planeMesh = [[ADPlaneMesh alloc]initWithRow:1 column:1];
    [planeMesh create];
    REMeshFilter *meshFilter = [[REMeshFilter alloc]initWithMesh:planeMesh];
    REMeshRenderer *meshRenderer = [[REMeshRenderer alloc]initWithMeshFilter:meshFilter];
    meshRenderer.sharedMaterial = matCylinderImage;
    
    ADCylinderImage *cylinderImage = [[ADCylinderImage alloc]init];
    self.cylinderImage = cylinderImage;
    cylinderImage.name = @"cylinderImage";
    cylinderImage.renderer = meshRenderer;
    cylinderImage.radius = self.reversePaintInputData.radius;
    cylinderImage.eye = self.reversePaintInputData.eye;
    cylinderImage.imageWidth = self.reversePaintInputData.imageWidth;
    cylinderImage.imageCenterOnSurfHeight = self.reversePaintInputData.imageCenterOnSurfHeight;
    cylinderImage.imageRatio = self.reversePaintInputData.imageRatio;
    cylinderImage.reflectionTexUVSpace = self.reversePaintInputData.reflectionTexUVSpace;
    cylinderImage.layerMask = Culling_CylinderImage;
    meshRenderer.delegate = cylinderImage;
    [cylinderImage update];
    
    //add virtual camera to render cylinderImage
    RECamera *camera = [[RECamera alloc]init];
    self.reversePaintCamera = camera;
    camera.name = @"reversePaintCamera";
    RERenderTexture *renderTex = [RERenderTexture textureWithName:@"cylinderImageCameraTex" width:1024 height:1024 mipmap:Interpolation_Nearest wrapMode:WrapMode_Clamp];
    camera.targetTexture = renderTex;
    camera.cullingMask = Culling_CylinderImage;
    [camera.cullingEntities addObject:cylinderImage];
    camera.backgroundColor = GLKVector4Make(0, 0, 0, 0);
    DebugLogGLGroupEnd();
}

- (void)destroyReversePaintResource{
    DebugLogGLGroupStart(@"destroyReversePaintResource");
    [self.cylinderImage destroy];
    self.cylinderImage = nil;
    
    [self.reversePaintCamera destroy];
    self.reversePaintCamera = nil;
    DebugLogGLGroupEnd();
}

- (void)combineReverseToSrc{
    DebugLogGLGroupStart(@"combine");

    RERenderTexture *tempRT = [RERenderTexture textureWithName:@"cylinderImageReflectionTex" size:self.paintView.viewGLSize mipmap:Interpolation_Linear wrapMode:WrapMode_Clamp];DebugLogMem(@"did create tempRT");
    self.cylinderImage.reflectionTex = tempRT;

    
    //在合成层内插入反向绘制的RenderTexture
    for (int i = 0; i < self.reversePaintData.layers.count; ++i) {
        ADPaintLayer *newLayer = [self.reversePaintData.layers[i] copy];DebugLogMem(@"did reversePaintData Layer %d",i);
        newLayer.dirty = true;
        
        //TODO: 该texture可以应该可以直接从_paintView.paintData中对应的texture取出
        //        RERenderTexture* texture = self.paintView.layerTextures[i];//(premultiply)
        RERenderTexture* texture = [RERenderTexture textureFromData:newLayer.data name:@"test"];
        
        //创建一个临时renderTexture, 更改viewport后，将texture描画到临时renderTexture上，reflectionTex使用临时rt
        CGFloat heightScale = (self.paintView.bounds.size.height + ToSeeCylinderTopPixelOffset) / self.paintView.bounds.size.height;
        CGFloat height = self.paintView.bounds.size.height / heightScale;
        CGFloat offsetY = -ToSeeCylinderTopViewportPixelOffsetY / heightScale;
        glViewport(0, offsetY, self.paintView.bounds.size.height, height);
        
        DebugLogGLSnapshotStart
        [[REGLWrapper current]bindFramebufferOES:tempRT.frameBuffer discardHint:true clear:true];
        [[REGLWrapper current] setImageInterpolation:Interpolation_Linear];
        [self.paintView drawQuad:self.paintView.VAOScreenQuad texture2D:texture.texID premultiplied:true alpha:1.0];
        //        [[REGLWrapper current]blendFunc:BlendFuncAlphaBlendPremultiplied];
        [self.reversePaintCamera render];DebugLogMem(@"did reversePaintCamera render");
        [[REGLWrapper current] setImageInterpolationFinished];
        DebugLogGLSnapshotEnd
        [texture destroy];
        
        glViewport(0, 0, self.paintView.bounds.size.width, self.paintView.bounds.size.height);
        
        [self addLayerRenderTexturesFromTexture:self.reversePaintCamera.targetTexture];DebugLogMem(@"did addLayerRenderTexturesFromTexture");
        DebugLog(@"layerTexture num:%d", self.layerTextures.count);
        [self.paintData.layers addObject:newLayer];
    }
    [tempRT destroy];DebugLogMem(@"did destroy tempRT");

    DebugLogGLGroupEnd();
}

- (void)updateRender{
    DebugLogGLGroupStart(@"updateRender");
    [[REGLWrapper current] bindFramebufferOES: self.paintView.finalFramebuffer discardHint:true clear:true];
    
    //绘制背景层
    [self drawBackgroundLayer];
//        DebugLogGLSnapshotStart
    //合成图层(用于截图)
    for (int i = 0; i < self.paintData.layers.count; ++i) {
        ADPaintLayer* layer = self.paintData.layers[i];
        //隐藏层不绘制
        if(!layer.visible) continue;
        RERenderTexture *layerTexture = (RERenderTexture *)self.layerTextures[i];
        [self.paintView drawLayerWithTex:layerTexture.texID blend:(CGBlendMode)layer.blendMode opacity:layer.opacity];
    }
//        DebugLogGLSnapshotEnd    
    DebugLogGLGroupEnd();
}

- (void)uploadReverseLayerDatas{
    //绘制完成上传数据
    DebugLogGLGroupStart(@"uploadLayerDatas");
    NSUInteger indexStart = self.srcPaintData.layers.count;
    for (int i = indexStart; i < self.paintData.layers.count; ++i) {
        ADPaintLayer* layer = self.paintData.layers[i];
        if (layer.dirty == true) {
            [self uploadLayerDataAtIndex:i];
            layer.dirty = false;
        }
    }
    DebugLogGLGroupEnd();
}

- (void)uploadLayerDataAtIndex:(int)index{
//    @autoreleasepool {
    DebugLog(@"uploadLayerDataAtIndex %d", index);
    ADPaintLayer* layer = self.paintData.layers[index];
    layer.data = nil;

    GLuint layerFramebuffer = ((RERenderTexture*)self.layerTextures[index]).frameBuffer;
    UIImage* image = [self.paintView snapshotFramebufferToUIImage:layerFramebuffer];
    layer.data = (NSData*)UIImagePNGRepresentation(image);//+4m MALLOC_LARGE
    image = nil;
//    }
}

#pragma mark-
//创建图层
- (void)addLayerRenderTexturesFromTexture:(RETexture *)texture{
    DebugLogGLGroupStart(@"addLayerRenderTexturesFromTexture id%d name:%@", texture.texID, texture.name);
    if(!self.layerTextures)return;
    
    NSString *name = [NSString stringWithFormat:@"layerTexture_%@", texture.name];
    RERenderTexture *layerTexture = [RERenderTexture textureWithName:name size:self.paintView.viewGLSize mipmap:Interpolation_Nearest wrapMode:WrapMode_Clamp];
    [self.paintView drawQuad:self.paintView.VAOScreenQuad texture2D:texture.texID premultiplied:false alpha:1.0];
    [self.layerTextures addObject:layerTexture];
    DebugLogGLGroupEnd();
}

- (BOOL)createSrcLayerRenderTextures{
    if (self.srcPaintData == nil) {
        DebugLogError(@"srcPaintData nil");
        return NO;
    }
    
    DebugLogGLGroupStart(@"createLayerRenderTextures");
    for (int i=0; i < self.srcPaintData.layers.count; ++i) {
        ADPaintLayer* layer = self.srcPaintData.layers[i];
        NSString *name = [NSString stringWithFormat:@"srcPaintDataLayer_%d", i];
        RETexture *dataTexture = [RETexture textureFromData:layer.data name:name];
        [self addLayerRenderTexturesFromTexture:dataTexture];
        [dataTexture destroy];
    }
//    DebugLogWarn(@"layerTexture num:%d", self.layerTextures.count);
    DebugLogGLGroupEnd();
    return true;
}
- (void)deleteSrcLayerRenderTextures{
    DebugLogGLGroupStart(@"deleteLayerRenderTextures");
    
    for(int i = 0; i< self.layerTextures.count;++i){
        RERenderTexture *texture = (RERenderTexture *)self.layerTextures[i];
        [texture destroy];
        texture = nil;
    }

    [self.layerTextures removeAllObjects];
    DebugLogGLGroupEnd();
}

#pragma mark-
-(void)drawBackgroundLayer{
    DebugLogGLGroupStart(@"drawBackgroundLayer");
    //隐藏层不绘制
    if(!self.paintData.backgroundLayer.visible) {
        glClearColor(0, 0, 0, 0);
        glClear(GL_COLOR_BUFFER_BIT);
    }
    else{
        const CGFloat* colors = CGColorGetComponents(self.paintData.backgroundLayer.clearColor.CGColor);
        glClearColor(colors[0], colors[1], colors[2], colors[3]);
        glClear(GL_COLOR_BUFFER_BIT);
        glClearColor(0, 0, 0, 0);
    }

    DebugLogGLGroupEnd();
}
@end
