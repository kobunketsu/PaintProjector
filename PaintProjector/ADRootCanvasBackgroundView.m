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

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    switch (self.paintView.state) {
        case PaintView_TouchTransformCanvas:
        {
            if([touches containsObject:self.paintView.firstTouch]){
                self.paintView.firstTouch = nil;
            }
            if (self.paintView.curNumberOfTouch == 0) {
                [self.paintView enterState:PaintView_TouchNone];
            }
        }
            break;
        case PaintView_TouchTransformLayer:
        case PaintView_TouchTransformImage:
        {
            if([touches containsObject:self.paintView.firstTouch]){
                self.paintView.firstTouch = nil;
            }
        }
            break;
        default:
            break;
    }
    
    [super touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    switch (self.paintView.state) {
        case PaintView_TouchTransformCanvas:
        {
            if([touches containsObject:self.paintView.firstTouch]){
                self.paintView.firstTouch = nil;
            }
            if (self.paintView.curNumberOfTouch == 0) {
                [self.paintView enterState:PaintView_TouchNone];
            }
        }
            break;
        case PaintView_TouchTransformLayer:
        case PaintView_TouchTransformImage:
        {
            if([touches containsObject:self.paintView.firstTouch]){
                self.paintView.firstTouch = nil;
            }
        }
        default:
            break;
    }
    
    [super touchesCancelled:touches withEvent:event];
}

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

@end
