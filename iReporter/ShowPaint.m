//
//  ShowPaint.m
//  iReporter
//
//  Created by 文杰 胡 on 12-11-18.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "ShowPaint.h"
#import "CalculateRunTime.h"

@implementation ShowPaint

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib{
    _layerDelegate = [[LayerDelegate alloc] initWithView: self];
    [self layer].delegate = _layerDelegate;
    
    //初始化deviceToEye
    self.deviceToEye = GLKVector3Make(-0.5, 0.5, 0.0);

    _motionManager = [[CMMotionManager alloc]init];
    NSOperationQueue *aQueue=[[NSOperationQueue alloc]init];
    if (!_motionManager.deviceMotionAvailable) {
        //pop message box
        DebugLog(@"motion manager not available!");
    }
    
    _motionManager.deviceMotionUpdateInterval = 0.01;
    if (![_motionManager isDeviceMotionActive]) {
        [_motionManager startDeviceMotionUpdatesToQueue:aQueue withHandler:
        ^(CMDeviceMotion *motion, NSError *error){
            if (motion) {
                _attitude = motion.attitude;
//                DebugLog(@"attitude yaw: %.1f  pitch: %.1f  roll: %.1f", _attitude.yaw, _attitude.pitch, _attitude.roll);                
                    _lastPitch = _attitude.pitch;
      
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self.layer3D setNeedsDisplay];
                    });                    
            }  
        }];

    }
}

//- (void)setSourcePaintView:(PaintView*)paintView{
////    self.sourceImage = [paintView getCacheImage];
////    [self create3DImage];
//    
//    [_layerDelegate copyLayerInfo:[paintView layer] ToLayer:[self layer]];
//    //根据paintView的层创建出结果相同的层
//    for (CALayer* layer in [[paintView layer] sublayers]) {
//        
//        UIGraphicsBeginImageContext(self.bounds.size);
//        [layer renderInContext:UIGraphicsGetCurrentContext()];
//        UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();    
//        
//        CALayer* subLayer = [_layerDelegate addLayerWithName:layer.name Contents:(id)viewImage.CGImage InRect:layer.bounds];
//        
//        if ([subLayer.name rangeOfString:@"_3D"].location != NSNotFound) {
//            _srcLayer3D = layer;
//            layer3D = subLayer;
//        }
//        [subLayer setNeedsDisplay];
//    }
//}

- (UIImage*)filterImage:(UIImage*)image{
    GPUImage3DViewFilter *selectedFilter;
    selectedFilter = [[GPUImage3DViewFilter alloc] init];
    [selectedFilter setAngle:-_lastPitch];
    [selectedFilter setEyeRelativeX:self.deviceToEye.x Y:self.deviceToEye.y Z:self.deviceToEye.z];
    return [selectedFilter imageByFilteringImage:image];    
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
//    DebugLog(@"%@", layer.name);
    if ([layer.name rangeOfString:@"_3D"].location == NSNotFound) {
        if ([layer.name  isEqual: @"rootLayer"]) {
            return;
        }
        [layer renderInContext:ctx];
    } 
    else {
        UIGraphicsBeginImageContext(self.bounds.size);
        [_srcLayer3D renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();   
        
        //    BNRTimeBlock (^{//测试运行速度
        filteredImage = [self filterImage:viewImage];
        //    });
        CGContextDrawImage(ctx, self.bounds, filteredImage.CGImage);            
    }
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
}

@end
//- (void)create3DImage{
//    assert(sourceImage!=nil);
//
//    CGDataProviderRef providerSrc = CGImageGetDataProvider(sourceImage);
//    CFDataRef bitmapDataSrc = CGDataProviderCopyData(providerSrc);
//    const UInt8* dataSrc = CFDataGetBytePtr(bitmapDataSrc);
//    
//    size_t width = CGImageGetWidth(sourceImage);
//    size_t height = CGImageGetHeight(sourceImage);    
//    size_t bytesPerComponent = CGImageGetBitsPerComponent(sourceImage);
//    size_t bytesPerPixel = CGImageGetBitsPerPixel(sourceImage);
//    size_t bytesPerRow = CGImageGetBytesPerRow(sourceImage);
//    
//    /*height and width are integers denoting the dimensions of the image*/
//    UInt8* rawData = malloc(width*height*4);
//    
//    for (int i=0; i<width*height; ++i) 
//    {
//        rawData[4*i] = dataSrc[4*i];
//        rawData[4*i+1] = dataSrc[4*i+1];
//        rawData[4*i+2] = dataSrc[4*i+2];
//        rawData[4*i+3] = dataSrc[4*i+3];
//    }
//    
//    CGDataProviderRef provider = CGDataProviderCreateWithData(NULL, 
//                                                              rawData, 
//                                                              width*height*4, 
//                                                              NULL);
//
//    CGColorSpaceRef colorSpaceRef = CGImageGetColorSpace(sourceImage);    
//    CGBitmapInfo bitmapInfo = CGImageGetBitmapInfo(sourceImage);    
//    CGColorRenderingIntent renderingIntent = kCGRenderingIntentDefault;
//    _destImage = CGImageCreate(width,
//                               height,
//                               bytesPerComponent,
//                               bytesPerPixel,
//                               bytesPerRow,colorSpaceRef,
//                               bitmapInfo,
//                               provider,NULL,NO,renderingIntent);
//    
//    CFRelease(bitmapDataSrc);    
//}

/*
 - (CGPoint)projectPointOnFakePlane:(CGPoint)pointInRealView{
 CGPoint viewPoint;
 float viewHeight = CGImageGetHeight(sourceImage);
 float viewWidth = CGImageGetWidth(sourceImage);    
 //coordinate is defined on the device near edge plane perpendicular to eye vertical vector
 
 float h = 0.5;//eye to device height
 GLKVector3 eye = GLKVector3Make(0, h, 0); 
 float dN = 0.5;//eye to device distance
 float dL = 0.2412;//device length (ipad2)
 float dW = 0.1857;
 
 float angle = -_lastPitch;//device angle 由于问题，取负
 GLKVector3 bottomCenter = GLKVector3Make(dN, 0, 0);
 GLKVector3 topCenter = GLKVector3Make(cos(angle)*dL + dN, sin(angle)*dL, 0);
 
 //tangent of eye to device far edge center on xy plane
 float tanFar = (topCenter.y - eye.y) / (topCenter.x - eye.x);
 GLKVector3 fakeTopCenter;    
 fakeTopCenter.x = sqrtf((dN*dN + h*h)/(1 + tanFar*tanFar));
 fakeTopCenter.y = tanFar * fakeTopCenter.x + h;
 fakeTopCenter.z = 0;
 
 float fakeDeviceLength = GLKVector3Length(GLKVector3Subtract(fakeTopCenter, bottomCenter));
 float ratio = fakeDeviceLength / dL;    
 float fakeDeviceWidth = dW * ratio;    
 
 //定义假象平面坐标系
 GLKVector3 fakePlaneUp = GLKVector3Make(fakeTopCenter.x - bottomCenter.x, fakeTopCenter.y - bottomCenter.y, 0);
 fakePlaneUp = GLKVector3Normalize(fakePlaneUp);
 GLKVector3 fakePlaneRight = GLKVector3Make(0, 0, 1);
 GLKVector3 fakePlaneNormal = GLKVector3CrossProduct(fakePlaneRight, fakePlaneUp);
 fakePlaneNormal = GLKVector3Normalize(fakePlaneNormal);      
 
 //定义真实平面坐标系
 GLKVector3 realPlaneUp = GLKVector3Make(topCenter.x - bottomCenter.x, topCenter.y - bottomCenter.y, 0);
 realPlaneUp = GLKVector3Normalize(realPlaneUp);
 GLKVector3 realPlaneRight = GLKVector3Make(0, 0, 1);    
 GLKVector3 realPlaneNormal = GLKVector3CrossProduct(realPlaneRight, realPlaneUp); 
 realPlaneNormal = GLKVector3Normalize(realPlaneNormal);
 
 //定义真实平面上的点
 GLKVector3 realPointOffsetX = GLKVector3MultiplyScalar(realPlaneRight, (pointInRealView.x / viewWidth - 0.5) * dW);
 GLKVector3 realPointOffsetY = GLKVector3MultiplyScalar(realPlaneUp, (pointInRealView.y / viewHeight) * dL);    
 GLKVector3 realPoint = GLKVector3Add(topCenter, GLKVector3Subtract(realPointOffsetX, realPointOffsetY));    
 
 //定义射线
 GLKVector3 eyeToRealPoint = GLKVector3Subtract(realPoint, eye);
 eyeToRealPoint = GLKVector3Normalize(eyeToRealPoint);    
 
 //找到真实平面点和视点构成的射线和假象平面的交点    
 //fakeTopCenter and fakePlaneNormal define fake Plane 
 //n dot (p - p0) = 0 --> fakePlaneNormal dot (point - fakeTopCenter) = 0
 
 //eye to realPoint define ray
 //p = p0 + t * u --> p = eye + t * eyeToRealPoint
 
 //t = (n dot p1 - n dot p0) / (n dot u)   (p1 is fakeTopCenter, p0 is eye)    
 float t = (GLKVector3DotProduct(fakePlaneNormal, fakeTopCenter) - GLKVector3DotProduct(fakePlaneNormal, eye)) / GLKVector3DotProduct(fakePlaneNormal, eyeToRealPoint);  
 
 if(t<0){
 //eye is on real plane
 //todo
 }
 else {
 GLKVector3 fakePoint = GLKVector3Add(eye, GLKVector3MultiplyScalar(eyeToRealPoint, t));
 
 
 //转换到真实平面的坐标系中
 GLKMatrix4 fakePlaneCoordinate = GLKMatrix4MakeLookAt(fakeTopCenter.x, fakeTopCenter.y, fakeTopCenter.z, fakeTopCenter.x - fakePlaneNormal.x, fakeTopCenter.y - fakePlaneNormal.y, fakeTopCenter.z - fakePlaneNormal.z, fakePlaneUp.x, fakePlaneUp.y, fakePlaneUp.z);
 //convert to real plane coordinate
 
 GLKVector3 pointInPlaneCoord =  GLKMatrix4MultiplyVector3WithTranslation(fakePlaneCoordinate, fakePoint);
 viewPoint.x = (pointInPlaneCoord.x + fakeDeviceWidth * 0.5) / fakeDeviceWidth * viewWidth;
 viewPoint.y = (- pointInPlaneCoord.y / fakeDeviceLength) * viewHeight;
 }
 
 return viewPoint;    
 }
 */