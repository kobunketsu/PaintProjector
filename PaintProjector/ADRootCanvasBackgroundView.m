//
//  ADRootCanvasBackgroundView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 7/7/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADRootCanvasBackgroundView.h"


#define BackgroundViewGridWidth 64
#define BackgroundViewRepeatWidth 128
#define BackgroundViewGridHeight 48
#define BackgroundViewRepeatHeight 96

@implementation ADRootCanvasBackgroundView
//+ (Class)layerClass
//{
//	return [ADRootCanvasBackgroundViewLayer class];
//}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initCustom];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [self initCustom];
    }
    return self;
}

- (void)initCustom{
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"RootCanvasFullPattern.png"]];
}

//-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
////    DebugLogWarn(@"morph %.2f", ((ADLaunchLogoViewLayer *)layer).morph);
//    CGFloat blend = ((ADRootCanvasBackgroundViewLayer *)layer).blend;
//    
//    NSInteger column = (NSInteger)ceilf((self.frame.size.width / (CGFloat)BackgroundViewRepeatWidth));
//    NSInteger row = (NSInteger)ceilf((self.frame.size.height / (CGFloat)BackgroundViewRepeatHeight));
//    
//    UIGraphicsPushContext(ctx);
//    for (NSInteger i =0; i < column; ++i) {
//        for (NSInteger j =0; j < row; ++j) {
////        BNRTimeBlock (^{//测试运行速度            
//            [self drawCanvas:ctx withTop:blend origin:CGPointMake(i*BackgroundViewRepeatWidth, j*BackgroundViewRepeatHeight) size:CGSizeMake(BackgroundViewGridWidth, BackgroundViewGridHeight) row:j column:i];
////        });
//        }
//    }
//    UIGraphicsPopContext();
//}

//- (void)drawRect:(CGRect)rect{
//    [self drawCanvas1WithFrame:rect];
//}

- (void)drawCanvas1WithFrame: (CGRect)frame;
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* black = [UIColor colorWithRed: 0.11 green: 0.102 blue: 0.102 alpha: 1];
    UIColor* gradientColor = [UIColor colorWithRed: 0.37 green: 0.375 blue: 0.378 alpha: 1];
    UIColor* centerLightColor = [UIColor colorWithRed: 0.391 green: 0.414 blue: 0.428 alpha: 1];
    
    //// Gradient Declarations
    CGFloat centerLightLocations[] = {0, 0.05, 0.1, 1};
    CGGradientRef centerLight = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)gradientColor.CGColor, (id)[UIColor colorWithRed: 0.381 green: 0.394 blue: 0.403 alpha: 1].CGColor, (id)centerLightColor.CGColor, (id)black.CGColor], centerLightLocations);
    
    //// Group
    {
        //// Rectangle Light Drawing
        CGRect rectangleLightRect = CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), 768, 1024);
        UIBezierPath* rectangleLightPath = [UIBezierPath bezierPathWithRect: rectangleLightRect];
        CGContextSaveGState(context);
        [rectangleLightPath addClip];
        CGFloat rectangleLightResizeRatio = MIN(CGRectGetWidth(rectangleLightRect) / 768, CGRectGetHeight(rectangleLightRect) / 1024);
        CGContextDrawRadialGradient(context, centerLight,
                                    CGPointMake(CGRectGetMidX(rectangleLightRect) + 0 * rectangleLightResizeRatio, CGRectGetMidY(rectangleLightRect) + 0 * rectangleLightResizeRatio), 10 * rectangleLightResizeRatio,
                                    CGPointMake(CGRectGetMidX(rectangleLightRect) + 0 * rectangleLightResizeRatio, CGRectGetMidY(rectangleLightRect) + 0 * rectangleLightResizeRatio), 698.67 * rectangleLightResizeRatio,
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
    }
    
    
    //// Cleanup
    CGGradientRelease(centerLight);
    CGColorSpaceRelease(colorSpace);
}



- (void)drawCanvas:(CGContextRef)context withTop: (CGFloat)top origin: (CGPoint)origin size: (CGSize)size row:(NSInteger)row column:(NSInteger)column;
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGContextRef context = UIGraphicsGetCurrentContext();
    
//    UIColor*topColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1];
//    UIColor*sideColor = [UIColor colorWithRed:0.05 green:0.05 blue:0.05 alpha:1];
//    //// Color Declarations
//    UIColor* color7 = [[UIColor colorWithRed: 0.179 green: 0.182 blue: 0.189 alpha: 1] blendColor:topColor withAlpha:top];
//    UIColor* color3 = [[UIColor colorWithRed: 0.163 green: 0.166 blue: 0.176 alpha: 1] blendColor:sideColor withAlpha:top];
//    UIColor* color8 = [[UIColor colorWithRed: 0.232 green: 0.229 blue: 0.229 alpha: 1] blendColor:topColor withAlpha:top];
//    UIColor* color9 = [[UIColor colorWithRed: 0.26 green: 0.257 blue: 0.257 alpha: 1] blendColor:topColor withAlpha:top];
//    UIColor* color4 = [[UIColor colorWithRed: 0.173 green: 0.175 blue: 0.185 alpha: 1] blendColor:sideColor withAlpha:top];
//    UIColor* color5 = [[UIColor colorWithRed: 0.151 green: 0.153 blue: 0.163 alpha: 1] blendColor:sideColor withAlpha:top];
//    UIColor* color6 = [[UIColor colorWithRed: 0.163 green: 0.163 blue: 0.163 alpha: 1] blendColor:topColor withAlpha:top];
//    UIColor* color1 = [[UIColor colorWithRed: 0.292 green: 0.285 blue: 0.285 alpha: 1] blendColor:sideColor withAlpha:top];
//    UIColor* color2 = [[UIColor colorWithRed: 0.222 green: 0.215 blue: 0.215 alpha: 1] blendColor:sideColor withAlpha:top];
    UIColor* color7 = [UIColor colorWithRed: 0.179 green: 0.182 blue: 0.189 alpha: 1];
    UIColor* color3 = [UIColor colorWithRed: 0.163 green: 0.166 blue: 0.176 alpha: 1];
    UIColor* color8 = [UIColor colorWithRed: 0.232 green: 0.229 blue: 0.229 alpha: 1];
    UIColor* color9 = [UIColor colorWithRed: 0.26 green: 0.257 blue: 0.257 alpha: 1];
    UIColor* color4 = [UIColor colorWithRed: 0.173 green: 0.175 blue: 0.185 alpha: 1];
    UIColor* color5 = [UIColor colorWithRed: 0.151 green: 0.153 blue: 0.163 alpha: 1];
    UIColor* color6 = [UIColor colorWithRed: 0.163 green: 0.163 blue: 0.163 alpha: 1];
    UIColor* color1 = [UIColor colorWithRed: 0.292 green: 0.285 blue: 0.285 alpha: 1];
    UIColor* color2 = [UIColor colorWithRed: 0.222 green: 0.215 blue: 0.215 alpha: 1];
    
    
    //// Gradient Declarations
    CGFloat linearGradient4Locations[] = {0, 0.05, 0.97, 1};
    CGGradientRef linearGradient4 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)color6.CGColor, (id)color7.CGColor, (id)color8.CGColor, (id)color9.CGColor], linearGradient4Locations);
    CGFloat linearGradient1Locations[] = {0, 0.06, 0.91, 0.95, 1};
    CGGradientRef linearGradient1 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)color1.CGColor, (id)color2.CGColor, (id)color3.CGColor, (id)color4.CGColor, (id)color5.CGColor], linearGradient1Locations);
    
    //// Variable Declarations
    CGRect leftTopFrame = CGRectMake(origin.x, origin.y, size.width, (1 - top) * size.height);
    CGRect leftDownFrame = CGRectMake(origin.x, (1 - top) * size.height + origin.y, size.width, (top + 1) * size.height);
    CGRect rightTopFrame = CGRectMake(origin.x + size.width, origin.y, size.width, (1 + top) * size.height);
    CGRect rightDownFrame = CGRectMake(origin.x + size.width, (1 + top) * size.height + origin.y, size.width, size.height * (1 - top));
    
    //// leftDown Drawing
    UIBezierPath* leftDownPath = [UIBezierPath bezierPathWithRect: leftDownFrame];
    CGContextSaveGState(context);
    [leftDownPath addClip];
    CGContextDrawLinearGradient(context, linearGradient4,
                                CGPointMake(column*BackgroundViewRepeatWidth + BackgroundViewGridWidth * 0.5, row*BackgroundViewRepeatHeight + BackgroundViewGridHeight*(1-top)),
                                CGPointMake(column*BackgroundViewRepeatWidth + BackgroundViewGridWidth * 0.5, row*BackgroundViewRepeatHeight + BackgroundViewRepeatHeight),
                                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    CGContextRestoreGState(context);
    
    //// rightTop Drawing
    UIBezierPath* rightTopPath = [UIBezierPath bezierPathWithRect: rightTopFrame];
    CGContextSaveGState(context);
    [rightTopPath addClip];
    CGContextDrawLinearGradient(context, linearGradient4,
                                CGPointMake(column*BackgroundViewRepeatWidth + BackgroundViewGridWidth * 1.5, row*BackgroundViewRepeatHeight),
                                CGPointMake(column*BackgroundViewRepeatWidth + BackgroundViewGridWidth * 1.5, row*BackgroundViewRepeatHeight + BackgroundViewGridHeight *(1+top)),
                                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    CGContextRestoreGState(context);
    
    //// rightDown Drawing
    UIBezierPath* rightDownPath = [UIBezierPath bezierPathWithRect: rightDownFrame];
    CGContextSaveGState(context);
    [rightDownPath addClip];
    CGContextDrawLinearGradient(context, linearGradient1,
                                CGPointMake(column*BackgroundViewRepeatWidth + BackgroundViewGridWidth * 1.5, row*BackgroundViewRepeatHeight + BackgroundViewGridHeight *(1+top)),
                                CGPointMake(column*BackgroundViewRepeatWidth + BackgroundViewGridWidth * 1.5, row*BackgroundViewRepeatHeight + BackgroundViewRepeatHeight),
                                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    CGContextRestoreGState(context);
    
    //// leftTop Drawing
    UIBezierPath* leftTopPath = [UIBezierPath bezierPathWithRect: leftTopFrame];
    CGContextSaveGState(context);
    [leftTopPath addClip];
    CGContextDrawLinearGradient(context, linearGradient1,
                                CGPointMake(column*BackgroundViewRepeatWidth + BackgroundViewGridWidth * 0.5, row*BackgroundViewRepeatHeight),
                                CGPointMake(column*BackgroundViewRepeatWidth + BackgroundViewGridWidth * 0.5, row*BackgroundViewRepeatHeight + BackgroundViewGridHeight * (1-top)),
                                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    CGContextRestoreGState(context);
    
    
    //// Cleanup
    CGGradientRelease(linearGradient4);
    CGGradientRelease(linearGradient1);
    CGColorSpaceRelease(colorSpace);
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect
//{
//    // Drawing code
//    //// General Declarations
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    //// Color Declarations
//    UIColor* gradientColor1 = [UIColor colorWithRed: 0.89 green: 0.851 blue: 0.847 alpha: 1];
//    UIColor* gradientColor2 = [UIColor colorWithRed: 0.545 green: 0.655 blue: 0.694 alpha: 1];
//    UIColor* gradientColor3 = [UIColor colorWithRed: 0.51 green: 0.373 blue: 0.373 alpha: 1];
//    UIColor* fillColor = [UIColor colorWithRed: 0.168 green: 0.168 blue: 0.168 alpha: 1];
//    UIColor* black = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
//    UIColor* bottomLightCenter = [UIColor colorWithRed: 0.336 green: 0.336 blue: 0.336 alpha: 1];
//    UIColor* gradientColor = [UIColor colorWithRed: 0.505 green: 0.505 blue: 0.505 alpha: 1];
//    UIColor* white = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
//    
//    //// Gradient Declarations
//    CGFloat gradientLocations[] = {0, 0.51, 1};
//    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)gradientColor1.CGColor, (id)gradientColor2.CGColor, (id)gradientColor3.CGColor], gradientLocations);
//    CGFloat bottomLightLocations[] = {0.09, 0.57, 1};
//    CGGradientRef bottomLight = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)black.CGColor, (id)bottomLightCenter.CGColor, (id)white.CGColor], bottomLightLocations);
//    CGFloat centerLightLocations[] = {0, 0.51, 1};
//    CGGradientRef centerLight = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)gradientColor.CGColor, (id)[UIColor colorWithRed: 0.252 green: 0.252 blue: 0.252 alpha: 1].CGColor, (id)black.CGColor], centerLightLocations);
//    
//    //// Rectangle Drawing
//    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 768, 1024)];
//    CGContextSaveGState(context);
//    [rectanglePath addClip];
//    CGContextDrawLinearGradient(context, gradient, CGPointMake(384, -0), CGPointMake(384, 1024), 0);
//    CGContextRestoreGState(context);
//    
//    
//    //// Group
//    {
//        CGContextSaveGState(context);
//        CGContextSetBlendMode(context, kCGBlendModeScreen);
//        CGContextBeginTransparencyLayer(context, NULL);
//        
//        
//        //// Bezier Drawing
//        UIBezierPath* bezierPath = UIBezierPath.bezierPath;
//        [bezierPath moveToPoint: CGPointMake(768, 568.25)];
//        [bezierPath addLineToPoint: CGPointMake(768, 1023)];
//        [bezierPath addCurveToPoint: CGPointMake(0, 1023) controlPoint1: CGPointMake(762.61, 1024.79) controlPoint2: CGPointMake(0, 1023)];
//        [bezierPath addLineToPoint: CGPointMake(0, 567.26)];
//        [bezierPath addCurveToPoint: CGPointMake(768, 568.25) controlPoint1: CGPointMake(227.21, 492.58) controlPoint2: CGPointMake(541.56, 492.91)];
//        [bezierPath closePath];
//        CGContextSaveGState(context);
//        [bezierPath addClip];
//        CGContextDrawLinearGradient(context, bottomLight, CGPointMake(384, 511.5), CGPointMake(384, 1023.8), 0);
//        CGContextRestoreGState(context);
//        
//        
//        CGContextEndTransparencyLayer(context);
//        CGContextRestoreGState(context);
//    }
//    
//    
//    //// Group 2
//    {
//        CGContextSaveGState(context);
//        CGContextSetAlpha(context, 0.88);
//        CGContextSetBlendMode(context, kCGBlendModeMultiply);
//        CGContextBeginTransparencyLayer(context, NULL);
//        
//        
//        //// Rectangle 2 Drawing
//        UIBezierPath* rectangle2Path = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 768, 1024)];
//        [fillColor setFill];
//        [rectangle2Path fill];
//        
//        
//        CGContextEndTransparencyLayer(context);
//        CGContextRestoreGState(context);
//    }
//    
//    
//    //// Group 3
//    {
//        CGContextSaveGState(context);
//        CGContextSetAlpha(context, 0.62);
//        CGContextSetBlendMode(context, kCGBlendModeScreen);
//        CGContextBeginTransparencyLayer(context, NULL);
//        
//        
//        //// Rectangle Light Drawing
//        UIBezierPath* rectangleLightPath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 768, 1024)];
//        CGContextSaveGState(context);
//        [rectangleLightPath addClip];
//        CGContextDrawRadialGradient(context, centerLight,
//                                    CGPointMake(384, 260.57), 31.96,
//                                    CGPointMake(384, 512), 637.58,
//                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
//        CGContextRestoreGState(context);
//        
//        
//        CGContextEndTransparencyLayer(context);
//        CGContextRestoreGState(context);
//    }
//    
//    
//    //// Cleanup
//    CGGradientRelease(gradient);
//    CGGradientRelease(bottomLight);
//    CGGradientRelease(centerLight);
//    CGColorSpaceRelease(colorSpace);
//    
//    
//}

@end
