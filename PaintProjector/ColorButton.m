//
//  SelectColorButton.m
//  PaintProjector
//
//  Created by 文杰 胡 on 12-11-3.
//  Copyright (c) 2012年 Hu Wenjie. All rights reserved.
//

#import "ColorButton.h"

@implementation ColorButton
@synthesize color = _color;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* gradientColor = _color;
    UIColor* gradientColor2 = _color;
    UIColor* shadow2Color = [UIColor colorWithRed: 0.877 green: 0.877 blue: 0.877 alpha: 1];
    UIColor* shadowColor2 = [UIColor colorWithRed: 0.434 green: 0.434 blue: 0.434 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)gradientColor.CGColor,
                               (id)gradientColor2.CGColor, nil];
    CGFloat gradientLocations[] = {0, 0.51, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    
    //// Shadow Declarations
    UIColor* shadow = shadowColor2;
    CGSize shadowOffset = CGSizeMake(0.1, 1.1);
    CGFloat shadowBlurRadius = 2;
    UIColor* shadow2 = shadow2Color;
    CGSize shadow2Offset = CGSizeMake(0.1, 1.1);
    CGFloat shadow2BlurRadius = 2;
    
    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(3, 3, 44, 44)];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadow2Offset, shadow2BlurRadius, shadow2.CGColor);
    CGContextBeginTransparencyLayer(context, NULL);
    [ovalPath addClip];
    CGContextDrawRadialGradient(context, gradient,
                                CGPointMake(25, 25), 11.37,
                                CGPointMake(25, 25), 41.08,
                                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    CGContextEndTransparencyLayer(context);
    
    ////// Oval Inner Shadow
    CGRect ovalBorderRect = CGRectInset([ovalPath bounds], -shadowBlurRadius, -shadowBlurRadius);
    ovalBorderRect = CGRectOffset(ovalBorderRect, -shadowOffset.width, -shadowOffset.height);
    ovalBorderRect = CGRectInset(CGRectUnion(ovalBorderRect, [ovalPath bounds]), -1, -1);
    
    UIBezierPath* ovalNegativePath = [UIBezierPath bezierPathWithRect: ovalBorderRect];
    [ovalNegativePath appendPath: ovalPath];
    ovalNegativePath.usesEvenOddFillRule = YES;
    
    CGContextSaveGState(context);
    {
        CGFloat xOffset = shadowOffset.width + round(ovalBorderRect.size.width);
        CGFloat yOffset = shadowOffset.height;
        CGContextSetShadowWithColor(context,
                                    CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                    shadowBlurRadius,
                                    shadow.CGColor);
        
        [ovalPath addClip];
        CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(ovalBorderRect.size.width), 0);
        [ovalNegativePath applyTransform: transform];
        [[UIColor grayColor] setFill];
        [ovalNegativePath fill];
    }
    CGContextRestoreGState(context);
    
    CGContextRestoreGState(context);
    
   
    //// Cleanup
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    

    if(self.isHighlighted){
        [self showHightlight];
    }
}

- (void)showHightlight{
    
    //// Group
    {
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(9.95, 39)];
        [bezierPath addCurveToPoint: CGPointMake(18.18, 34.33) controlPoint1: CGPointMake(9.95, 39) controlPoint2: CGPointMake(12.53, 38.72)];
        [bezierPath addCurveToPoint: CGPointMake(24.59, 25) controlPoint1: CGPointMake(23.83, 29.94) controlPoint2: CGPointMake(24.81, 28.5)];
        [bezierPath addCurveToPoint: CGPointMake(21.84, 20.33) controlPoint1: CGPointMake(24.36, 21.5) controlPoint2: CGPointMake(24.36, 19.87)];
        [bezierPath addCurveToPoint: CGPointMake(14.52, 26.87) controlPoint1: CGPointMake(19.32, 20.8) controlPoint2: CGPointMake(20.01, 20.33)];
        [bezierPath addCurveToPoint: CGPointMake(5.37, 32.47) controlPoint1: CGPointMake(9.03, 33.4) controlPoint2: CGPointMake(5.37, 32.47)];
        [[UIColor whiteColor] setStroke];
        bezierPath.lineWidth = 1;
        [bezierPath stroke];
        
        
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(11.78, 40.87)];
        [bezier2Path addCurveToPoint: CGPointMake(19.36, 37.32) controlPoint1: CGPointMake(11.78, 40.87) controlPoint2: CGPointMake(15.77, 39.4)];
        [bezier2Path addCurveToPoint: CGPointMake(26.41, 33.4) controlPoint1: CGPointMake(22.1, 35.73) controlPoint2: CGPointMake(24.22, 33.4)];
        [bezier2Path addCurveToPoint: CGPointMake(32.58, 36.82) controlPoint1: CGPointMake(28.38, 33.4) controlPoint2: CGPointMake(30.09, 35.45)];
        [bezier2Path addCurveToPoint: CGPointMake(40.14, 40.87) controlPoint1: CGPointMake(36.54, 38.99) controlPoint2: CGPointMake(40.14, 40.87)];
        [[UIColor whiteColor] setStroke];
        bezier2Path.lineWidth = 1;
        [bezier2Path stroke];
        
        
        //// Bezier 3 Drawing
        UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
        [bezier3Path moveToPoint: CGPointMake(41.97, 39)];
        [bezier3Path addLineToPoint: CGPointMake(32.82, 33.4)];
        [bezier3Path addCurveToPoint: CGPointMake(27.33, 24.07) controlPoint1: CGPointMake(32.82, 33.4) controlPoint2: CGPointMake(26.87, 28.27)];
        [bezier3Path addCurveToPoint: CGPointMake(20.93, 17.53) controlPoint1: CGPointMake(27.79, 19.87) controlPoint2: CGPointMake(24.36, 15.67)];
        [bezier3Path addCurveToPoint: CGPointMake(13.61, 24.07) controlPoint1: CGPointMake(17.49, 19.4) controlPoint2: CGPointMake(19.1, 17.53)];
        [bezier3Path addCurveToPoint: CGPointMake(4.46, 29.67) controlPoint1: CGPointMake(8.12, 30.6) controlPoint2: CGPointMake(4.46, 29.67)];
        [[UIColor whiteColor] setStroke];
        bezier3Path.lineWidth = 1;
        [bezier3Path stroke];
        
        
        //// Bezier 4 Drawing
        UIBezierPath* bezier4Path = [UIBezierPath bezierPath];
        [bezier4Path moveToPoint: CGPointMake(43.8, 36.2)];
        [bezier4Path addCurveToPoint: CGPointMake(35.56, 31.53) controlPoint1: CGPointMake(43.8, 36.2) controlPoint2: CGPointMake(38.77, 35.03)];
        [bezier4Path addCurveToPoint: CGPointMake(30.07, 21.27) controlPoint1: CGPointMake(32.36, 28.03) controlPoint2: CGPointMake(29.62, 25.47)];
        [bezier4Path addCurveToPoint: CGPointMake(20.93, 13.8) controlPoint1: CGPointMake(30.53, 17.07) controlPoint2: CGPointMake(24.36, 11.93)];
        [bezier4Path addCurveToPoint: CGPointMake(13.61, 20.33) controlPoint1: CGPointMake(17.49, 15.67) controlPoint2: CGPointMake(19.1, 13.8)];
        [bezier4Path addCurveToPoint: CGPointMake(4.46, 25.93) controlPoint1: CGPointMake(8.12, 26.87) controlPoint2: CGPointMake(4.46, 25.93)];
        [[UIColor whiteColor] setStroke];
        bezier4Path.lineWidth = 1;
        [bezier4Path stroke];
        
        
        //// Bezier 5 Drawing
        UIBezierPath* bezier5Path = [UIBezierPath bezierPath];
        [bezier5Path moveToPoint: CGPointMake(13.61, 42.73)];
        [bezier5Path addCurveToPoint: CGPointMake(20.28, 40.12) controlPoint1: CGPointMake(13.61, 42.73) controlPoint2: CGPointMake(16.69, 42.2)];
        [bezier5Path addCurveToPoint: CGPointMake(26.41, 37.13) controlPoint1: CGPointMake(23.02, 38.53) controlPoint2: CGPointMake(24.22, 37.13)];
        [bezier5Path addCurveToPoint: CGPointMake(31.67, 39.62) controlPoint1: CGPointMake(28.38, 37.13) controlPoint2: CGPointMake(29.18, 38.25)];
        [bezier5Path addCurveToPoint: CGPointMake(37.39, 42.73) controlPoint1: CGPointMake(35.62, 41.79) controlPoint2: CGPointMake(37.39, 42.73)];
        [[UIColor whiteColor] setStroke];
        bezier5Path.lineWidth = 1;
        [bezier5Path stroke];
        
        
        //// Bezier 6 Drawing
        UIBezierPath* bezier6Path = [UIBezierPath bezierPath];
        [bezier6Path moveToPoint: CGPointMake(18.18, 44.6)];
        [bezier6Path addCurveToPoint: CGPointMake(21.19, 42.92) controlPoint1: CGPointMake(18.18, 44.6) controlPoint2: CGPointMake(17.6, 45)];
        [bezier6Path addCurveToPoint: CGPointMake(26.41, 40.87) controlPoint1: CGPointMake(23.93, 41.33) controlPoint2: CGPointMake(24.22, 40.87)];
        [bezier6Path addCurveToPoint: CGPointMake(30.75, 42.42) controlPoint1: CGPointMake(28.38, 40.87) controlPoint2: CGPointMake(28.26, 41.05)];
        [bezier6Path addCurveToPoint: CGPointMake(33.73, 44.6) controlPoint1: CGPointMake(34.71, 44.59) controlPoint2: CGPointMake(33.73, 44.6)];
        [[UIColor whiteColor] setStroke];
        bezier6Path.lineWidth = 1;
        [bezier6Path stroke];
        
        
        //// Bezier 7 Drawing
        UIBezierPath* bezier7Path = [UIBezierPath bezierPath];
        [bezier7Path moveToPoint: CGPointMake(22.11, 45.72)];
        [bezier7Path addCurveToPoint: CGPointMake(26.41, 43.67) controlPoint1: CGPointMake(24.85, 44.13) controlPoint2: CGPointMake(24.22, 43.67)];
        [bezier7Path addCurveToPoint: CGPointMake(29.84, 45.22) controlPoint1: CGPointMake(28.38, 43.67) controlPoint2: CGPointMake(27.35, 43.85)];
        [[UIColor whiteColor] setStroke];
        bezier7Path.lineWidth = 1;
        [bezier7Path stroke];
        
        
        //// Bezier 8 Drawing
        UIBezierPath* bezier8Path = [UIBezierPath bezierPath];
        [bezier8Path moveToPoint: CGPointMake(8.12, 37.13)];
        [bezier8Path addCurveToPoint: CGPointMake(16.35, 32.47) controlPoint1: CGPointMake(8.12, 37.13) controlPoint2: CGPointMake(12.92, 35.5)];
        [bezier8Path addCurveToPoint: CGPointMake(21.84, 24.07) controlPoint1: CGPointMake(19.78, 29.43) controlPoint2: CGPointMake(22.98, 25.7)];
        [bezier8Path addCurveToPoint: CGPointMake(15.44, 30.6) controlPoint1: CGPointMake(20.7, 22.43) controlPoint2: CGPointMake(19.1, 27.8)];
        [bezier8Path addCurveToPoint: CGPointMake(7.2, 35.27) controlPoint1: CGPointMake(11.78, 33.4) controlPoint2: CGPointMake(7.2, 35.27)];
        [[UIColor whiteColor] setStroke];
        bezier8Path.lineWidth = 1;
        [bezier8Path stroke];
        
        
        //// Bezier 9 Drawing
        UIBezierPath* bezier9Path = [UIBezierPath bezierPath];
        [bezier9Path moveToPoint: CGPointMake(44.71, 33.4)];
        [bezier9Path addCurveToPoint: CGPointMake(37.39, 28.73) controlPoint1: CGPointMake(44.71, 33.4) controlPoint2: CGPointMake(40.6, 32.23)];
        [bezier9Path addCurveToPoint: CGPointMake(32.82, 18.47) controlPoint1: CGPointMake(34.19, 25.23) controlPoint2: CGPointMake(34.3, 23.36)];
        [bezier9Path addCurveToPoint: CGPointMake(20.93, 11) controlPoint1: CGPointMake(31.33, 13.57) controlPoint2: CGPointMake(24.36, 9.13)];
        [bezier9Path addCurveToPoint: CGPointMake(11.78, 17.53) controlPoint1: CGPointMake(17.49, 12.87) controlPoint2: CGPointMake(17.27, 11)];
        [bezier9Path addCurveToPoint: CGPointMake(4.46, 23.13) controlPoint1: CGPointMake(6.29, 24.07) controlPoint2: CGPointMake(4.46, 23.13)];
        [[UIColor whiteColor] setStroke];
        bezier9Path.lineWidth = 1;
        [bezier9Path stroke];
        
        
        //// Bezier 10 Drawing
        UIBezierPath* bezier10Path = [UIBezierPath bezierPath];
        [bezier10Path moveToPoint: CGPointMake(45.63, 30.6)];
        [bezier10Path addCurveToPoint: CGPointMake(41.05, 27.8) controlPoint1: CGPointMake(45.63, 30.6) controlPoint2: CGPointMake(44.26, 31.3)];
        [bezier10Path addCurveToPoint: CGPointMake(36.48, 20.33) controlPoint1: CGPointMake(37.85, 24.3) controlPoint2: CGPointMake(37.96, 25.23)];
        [bezier10Path addCurveToPoint: CGPointMake(21.84, 8.2) controlPoint1: CGPointMake(34.99, 15.44) controlPoint2: CGPointMake(30.82, 7.44)];
        [bezier10Path addCurveToPoint: CGPointMake(10.86, 14.73) controlPoint1: CGPointMake(12.86, 8.96) controlPoint2: CGPointMake(10.86, 14.73)];
        [bezier10Path addLineToPoint: CGPointMake(4.46, 20.33)];
        [[UIColor whiteColor] setStroke];
        bezier10Path.lineWidth = 1;
        [bezier10Path stroke];
        
        
        //// Bezier 11 Drawing
        UIBezierPath* bezier11Path = [UIBezierPath bezierPath];
        [bezier11Path moveToPoint: CGPointMake(46.54, 27.8)];
        [bezier11Path addCurveToPoint: CGPointMake(40.14, 20.33) controlPoint1: CGPointMake(46.54, 27.8) controlPoint2: CGPointMake(41.62, 25.23)];
        [bezier11Path addCurveToPoint: CGPointMake(22.76, 5.4) controlPoint1: CGPointMake(38.65, 15.44) controlPoint2: CGPointMake(34.3, 5.1)];
        [bezier11Path addCurveToPoint: CGPointMake(7.2, 13.8) controlPoint1: CGPointMake(11.21, 5.7) controlPoint2: CGPointMake(7.2, 13.8)];
        [[UIColor whiteColor] setStroke];
        bezier11Path.lineWidth = 1;
        [bezier11Path stroke];
        
        
        //// Bezier 12 Drawing
        UIBezierPath* bezier12Path = [UIBezierPath bezierPath];
        [bezier12Path moveToPoint: CGPointMake(46.54, 24.07)];
        [bezier12Path addCurveToPoint: CGPointMake(40.14, 12.87) controlPoint1: CGPointMake(42.79, 21.38) controlPoint2: CGPointMake(43.04, 17.68)];
        [bezier12Path addCurveToPoint: CGPointMake(32.82, 5.4) controlPoint1: CGPointMake(37.24, 8.05) controlPoint2: CGPointMake(31.68, 3.3)];
        [[UIColor whiteColor] setStroke];
        bezier12Path.lineWidth = 1;
        [bezier12Path stroke];
    }
    
    

}

-(void)enableHighlighted:(BOOL)highlighted{
    self.highlighted = highlighted;
    [self setNeedsDisplay];    

//    if (self.isHighlighted == highlighted) {
//        return;
//    }
//    
//    if(highlighted){
//        self.highlighted = true;
//        [UIView animateWithDuration:0.2 animations:^{
//
//        } completion:^(BOOL finished) {
//        }];
//    }
//    else{
//        [UIView animateWithDuration:0.2 animations:^{
//
//        } completion:^(BOOL finished) {
//            self.highlighted = false;
//        }];
//    }
//    [self setNeedsDisplay];

//    [CATransaction begin];
//    [CATransaction setAnimationDuration:0.3];
//    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
//    [CATransaction setCompletionBlock:^{
//        //            DebugLog(@"button baseColor finished");
//    }];
//    //        DebugLog(@"topToolBarButton %@", button);
//    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"highlightedOpacity"];
//    anim.fromValue = 0;
//    anim.toValue = 1;
//    
//    [button.layer addAnimation:colorAnim forKey:@"highlightedOpacity"];
//    ((CustomLayer*)button.layer).baseColor = toColorShadow;
//    
//    [CATransaction commit];

}

- (UIColor *)color {
    return _color;
}

- (void)setColor:(UIColor *)newValue {
    _color = [newValue copy];
    [self setNeedsDisplay];
}

@end
