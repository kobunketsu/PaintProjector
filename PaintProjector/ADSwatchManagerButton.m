//
//  SwatchManagerButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 3/4/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADSwatchManagerButton.h"

@implementation ADSwatchManagerButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSwatchColorDatas:(NSArray *)swatchColorDatas{
    _swatchColorDatas = swatchColorDatas;
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [self drawCanvas1WithFrame:rect];
}

- (void)drawCanvas1WithFrame:(CGRect)rect
    {
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* strokeColor = [UIColor colorWithRed: 0.95 green: 0.95 blue: 0.95 alpha: 1];
//    UIColor* gradientColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
//    UIColor* shadow1Color = [UIColor colorWithRed: 0.316 green: 0.316 blue: 0.316 alpha: 1];
    UIColor* highlightedColor = [UIColor colorWithRed: 0.903 green: 0.903 blue: 0.903 alpha: 1];
    UIColor* color = [UIColor colorWithRed: 1 green: 0 blue: 0 alpha: 1];
    UIColor* color2 = [UIColor colorWithRed: 1 green: 0.749 blue: 0 alpha: 1];
    UIColor* color3 = [UIColor colorWithRed: 0.977 green: 1 blue: 0 alpha: 1];
    UIColor* color4 = [UIColor colorWithRed: 0.501 green: 1 blue: 0 alpha: 1];
    UIColor* color5 = [UIColor colorWithRed: 0 green: 0.86 blue: 1 alpha: 1];
    UIColor* color6 = [UIColor colorWithRed: 0 green: 0.46 blue: 1 alpha: 1];
    UIColor* color7 = [UIColor colorWithRed: 0.625 green: 0.114 blue: 1 alpha: 1];
    
    //// Shadow Declarations
//    UIColor* shadow = shadow1Color;
//    CGSize shadowOffset = CGSizeMake(0.1, 2.1);
//    CGFloat shadowBlurRadius = 4;
    UIColor* highlighted = highlightedColor;
    CGSize highlightedOffset = CGSizeMake(0.1, 2.1);
    CGFloat highlightedBlurRadius = 4;
    
    CGFloat edgeInset = 4;
    CGFloat innerEdgeInset = 15;
    //// Group 2
    {
        //// Oval Drawing
        CGRect ovalRect = CGRectMake(edgeInset, edgeInset, rect.size.width - edgeInset * 2, rect.size.height - edgeInset * 2);
        UIBezierPath* ovalPath = [UIBezierPath bezierPath];
        [ovalPath addArcWithCenter: CGPointMake(CGRectGetMidX(ovalRect), CGRectGetMidY(ovalRect)) radius: CGRectGetWidth(ovalRect) / 2 startAngle: 334 * M_PI/180 endAngle: 26 * M_PI/180 clockwise: YES];
        [ovalPath addLineToPoint: CGPointMake(CGRectGetMidX(ovalRect), CGRectGetMidY(ovalRect))];
        [ovalPath closePath];
        
        [color setFill];
        [ovalPath fill];
        
        
        //// Oval 1 Drawing
        CGRect oval1Rect = CGRectMake(edgeInset, edgeInset, rect.size.width - edgeInset * 2, rect.size.height - edgeInset * 2);
        UIBezierPath* oval1Path = [UIBezierPath bezierPath];
        [oval1Path addArcWithCenter: CGPointMake(CGRectGetMidX(oval1Rect), CGRectGetMidY(oval1Rect)) radius: CGRectGetWidth(oval1Rect) / 2 startAngle: 26 * M_PI/180 endAngle: 78 * M_PI/180 clockwise: YES];
        [oval1Path addLineToPoint: CGPointMake(CGRectGetMidX(oval1Rect), CGRectGetMidY(oval1Rect))];
        [oval1Path closePath];
        
        [color2 setFill];
        [oval1Path fill];
        
        
        //// Oval 2 Drawing
        CGRect oval2Rect = CGRectMake(edgeInset, edgeInset, rect.size.width - edgeInset * 2, rect.size.height - edgeInset * 2);
        UIBezierPath* oval2Path = [UIBezierPath bezierPath];
        [oval2Path addArcWithCenter: CGPointMake(CGRectGetMidX(oval2Rect), CGRectGetMidY(oval2Rect)) radius: CGRectGetWidth(oval2Rect) / 2 startAngle: 78 * M_PI/180 endAngle: 130 * M_PI/180 clockwise: YES];
        [oval2Path addLineToPoint: CGPointMake(CGRectGetMidX(oval2Rect), CGRectGetMidY(oval2Rect))];
        [oval2Path closePath];
        
        [color3 setFill];
        [oval2Path fill];
        
        
        //// Oval 3 Drawing
        CGRect oval3Rect = CGRectMake(edgeInset, edgeInset, rect.size.width - edgeInset * 2, rect.size.height - edgeInset * 2);
        UIBezierPath* oval3Path = [UIBezierPath bezierPath];
        [oval3Path addArcWithCenter: CGPointMake(CGRectGetMidX(oval3Rect), CGRectGetMidY(oval3Rect)) radius: CGRectGetWidth(oval3Rect) / 2 startAngle: 130 * M_PI/180 endAngle: 182 * M_PI/180 clockwise: YES];
        [oval3Path addLineToPoint: CGPointMake(CGRectGetMidX(oval3Rect), CGRectGetMidY(oval3Rect))];
        [oval3Path closePath];
        
        [color4 setFill];
        [oval3Path fill];
        
        
        //// Oval 4 Drawing
        CGRect oval4Rect = CGRectMake(edgeInset, edgeInset, rect.size.width - edgeInset * 2, rect.size.height - edgeInset * 2);
        UIBezierPath* oval4Path = [UIBezierPath bezierPath];
        [oval4Path addArcWithCenter: CGPointMake(CGRectGetMidX(oval4Rect), CGRectGetMidY(oval4Rect)) radius: CGRectGetWidth(oval4Rect) / 2 startAngle: 182 * M_PI/180 endAngle: 234 * M_PI/180 clockwise: YES];
        [oval4Path addLineToPoint: CGPointMake(CGRectGetMidX(oval4Rect), CGRectGetMidY(oval4Rect))];
        [oval4Path closePath];
        
        [color5 setFill];
        [oval4Path fill];
        
        
        //// Oval 5 Drawing
        CGRect oval5Rect = CGRectMake(edgeInset, edgeInset, rect.size.width - edgeInset * 2, rect.size.height - edgeInset * 2);
        UIBezierPath* oval5Path = [UIBezierPath bezierPath];
        [oval5Path addArcWithCenter: CGPointMake(CGRectGetMidX(oval5Rect), CGRectGetMidY(oval5Rect)) radius: CGRectGetWidth(oval5Rect) / 2 startAngle: 234 * M_PI/180 endAngle: 286 * M_PI/180 clockwise: YES];
        [oval5Path addLineToPoint: CGPointMake(CGRectGetMidX(oval5Rect), CGRectGetMidY(oval5Rect))];
        [oval5Path closePath];
        
        [color6 setFill];
        [oval5Path fill];
        
        
        //// Oval 6 Drawing
        CGRect oval6Rect = CGRectMake(edgeInset, edgeInset, rect.size.width - edgeInset * 2, rect.size.height - edgeInset * 2);
        UIBezierPath* oval6Path = [UIBezierPath bezierPath];
        [oval6Path addArcWithCenter: CGPointMake(CGRectGetMidX(oval6Rect), CGRectGetMidY(oval6Rect)) radius: CGRectGetWidth(oval6Rect) / 2 startAngle: 286 * M_PI/180 endAngle: 338 * M_PI/180 clockwise: YES];
        [oval6Path addLineToPoint: CGPointMake(CGRectGetMidX(oval6Rect), CGRectGetMidY(oval6Rect))];
        [oval6Path closePath];
        
        [color7 setFill];
        [oval6Path fill];
    }
    
    
    //// Group
    {
        CGContextSaveGState(context);
        CGContextSetBlendMode(context, kCGBlendModeMultiply);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Oval Background Drawing
//        UIBezierPath* ovalBackgroundPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(edgeInset, edgeInset, rect.size.width - edgeInset * 2, rect.size.height - edgeInset * 2)];
//        CGContextSaveGState(context);
//        CGContextSetShadowWithColor(context, highlightedOffset, highlightedBlurRadius, highlighted.CGColor);
//        [gradientColor setFill];
//        [ovalBackgroundPath fill];
//        
//        ////// Oval Background Inner Shadow
//        CGRect ovalBackgroundBorderRect = CGRectInset([ovalBackgroundPath bounds], -shadowBlurRadius, -shadowBlurRadius);
//        ovalBackgroundBorderRect = CGRectOffset(ovalBackgroundBorderRect, -shadowOffset.width, -shadowOffset.height);
//        ovalBackgroundBorderRect = CGRectInset(CGRectUnion(ovalBackgroundBorderRect, [ovalBackgroundPath bounds]), -1, -1);
//        
//        UIBezierPath* ovalBackgroundNegativePath = [UIBezierPath bezierPathWithRect: ovalBackgroundBorderRect];
//        [ovalBackgroundNegativePath appendPath: ovalBackgroundPath];
//        ovalBackgroundNegativePath.usesEvenOddFillRule = YES;
//        
//        CGContextSaveGState(context);
//        {
//            CGFloat xOffset = shadowOffset.width + round(ovalBackgroundBorderRect.size.width);
//            CGFloat yOffset = shadowOffset.height;
//            CGContextSetShadowWithColor(context,
//                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
//                                        shadowBlurRadius,
//                                        shadow.CGColor);
//            
//            [ovalBackgroundPath addClip];
//            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(ovalBackgroundBorderRect.size.width), 0);
//            [ovalBackgroundNegativePath applyTransform: transform];
//            [[UIColor grayColor] setFill];
//            [ovalBackgroundNegativePath fill];
//        }
//        CGContextRestoreGState(context);
//        
//        CGContextRestoreGState(context);
        
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
    //// Oval 7 Drawing
    UIBezierPath* oval7Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(innerEdgeInset, innerEdgeInset, rect.size.width - innerEdgeInset * 2, rect.size.height - innerEdgeInset * 2)];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, highlightedOffset, highlightedBlurRadius, highlighted.CGColor);
    [highlightedColor setFill];
    [oval7Path fill];
    CGContextRestoreGState(context);
    
    [strokeColor setStroke];
    oval7Path.lineWidth = 1;
    [oval7Path stroke];
    
    //// Bezier 2 Drawing
//    UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
//    [bezier2Path moveToPoint: CGPointMake(23.66, 28.52)];
//    [bezier2Path addLineToPoint: CGPointMake(26.21, 28.52)];
//    [bezier2Path addLineToPoint: CGPointMake(26.21, 13)];
//    [bezier2Path addLineToPoint: CGPointMake(23.66, 13)];
//    [bezier2Path addLineToPoint: CGPointMake(23.66, 28.52)];
//    [bezier2Path closePath];
//    [bezier2Path moveToPoint: CGPointMake(34.49, 28.1)];
//    [bezier2Path addLineToPoint: CGPointMake(25.46, 37.24)];
//    [bezier2Path addLineToPoint: CGPointMake(25.02, 37.24)];
//    [bezier2Path addLineToPoint: CGPointMake(16, 28.1)];
//    [bezier2Path addLineToPoint: CGPointMake(17.8, 26.27)];
//    [bezier2Path addLineToPoint: CGPointMake(25.24, 33.81)];
//    [bezier2Path addLineToPoint: CGPointMake(32.68, 26.27)];
//    [bezier2Path addLineToPoint: CGPointMake(34.49, 28.1)];
//    [bezier2Path closePath];
//    CGContextSaveGState(context);
//    CGContextSetShadowWithColor(context, highlightedOffset, highlightedBlurRadius, highlighted.CGColor);
//    [gradientColor2 setFill];
//    [bezier2Path fill];
//    CGContextRestoreGState(context);
 
}
//- (void)drawRect:(CGRect)rect
//{
//    
//    //// General Declarations
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    //// Color Declarations
//    UIColor* gradientColor = [UIColor whiteColor];
//    UIColor* gradientColor2 = gradientColor;
//    UIColor* shadow2Color = [UIColor colorWithRed: 0.877 green: 0.877 blue: 0.877 alpha: 1];
//    UIColor* shadowColor2 = [UIColor colorWithRed: 0.434 green: 0.434 blue: 0.434 alpha: 1];
//    
//    //// Gradient Declarations
//    NSArray* gradientColors = [NSArray arrayWithObjects:
//                               (id)gradientColor.CGColor,
//                               (id)gradientColor2.CGColor, nil];
//    CGFloat gradientLocations[] = {0, 0.51, 1};
//    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
//    
//    //// Shadow Declarations
//    UIColor* shadow = shadowColor2;
//    CGSize shadowOffset = CGSizeMake(0.1, 1.1);
//    CGFloat shadowBlurRadius = 2;
//    UIColor* shadow2 = shadow2Color;
//    CGSize shadow2Offset = CGSizeMake(0.1, 1.1);
//    CGFloat shadow2BlurRadius = 2;
//    
//    //// Oval Drawing
//    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: self.bounds];
//    CGContextSaveGState(context);
//    CGContextSetShadowWithColor(context, shadow2Offset, shadow2BlurRadius, shadow2.CGColor);
//    CGContextBeginTransparencyLayer(context, NULL);
//    [ovalPath addClip];
//    CGContextDrawRadialGradient(context, gradient,
//                                CGPointMake(25, 25), 11.37,
//                                CGPointMake(25, 25), 41.08,
//                                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
//    CGContextEndTransparencyLayer(context);
//    
//    ////// Oval Inner Shadow
//    CGRect ovalBorderRect = CGRectInset([ovalPath bounds], -shadowBlurRadius, -shadowBlurRadius);
//    ovalBorderRect = CGRectOffset(ovalBorderRect, -shadowOffset.width, -shadowOffset.height);
//    ovalBorderRect = CGRectInset(CGRectUnion(ovalBorderRect, [ovalPath bounds]), -1, -1);
//    
//    UIBezierPath* ovalNegativePath = [UIBezierPath bezierPathWithRect: ovalBorderRect];
//    [ovalNegativePath appendPath: ovalPath];
//    ovalNegativePath.usesEvenOddFillRule = YES;
//    
//    CGContextSaveGState(context);
//    {
//        CGFloat xOffset = shadowOffset.width + round(ovalBorderRect.size.width);
//        CGFloat yOffset = shadowOffset.height;
//        CGContextSetShadowWithColor(context,
//                                    CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
//                                    shadowBlurRadius,
//                                    shadow.CGColor);
//        
//        [ovalPath addClip];
//        CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(ovalBorderRect.size.width), 0);
//        [ovalNegativePath applyTransform: transform];
//        [[UIColor grayColor] setFill];
//        [ovalNegativePath fill];
//    }
//    CGContextRestoreGState(context);
//    
//    CGContextRestoreGState(context);
//    
//    //// Cleanup
//    CGGradientRelease(gradient);
//    CGColorSpaceRelease(colorSpace);
//    
//    /////////////////////////////////////////////////////////////////////////////////////////////
//    CGFloat startAngle = -90;
//    CGFloat margin = 1;
//    CGFloat size = self.bounds.size.width - margin * 2;
//    CGRect ovalRect = CGRectMake(margin, margin, size, size);
//    // Drawing code
//    for (NSString *colorStr in self.swatchColorDatas) {
//        CGFloat percent = (CGFloat)[[[colorStr componentsSeparatedByString:@"%"]lastObject]integerValue];
//        //// Color Declarations
//        UIColor* fillColor = [UIColor colorWithString:colorStr];
//        
//        //// Abstracted Attributes
//        CGFloat ovalStartAngle = startAngle;
//        CGFloat ovalEndAngle = startAngle + percent / 100.0 * 360.0;
//        startAngle = ovalEndAngle;
//        
//        
//        //// Oval Drawing
//        UIBezierPath* ovalPath = [UIBezierPath bezierPath];
//        [ovalPath addArcWithCenter: CGPointMake(CGRectGetMidX(ovalRect), CGRectGetMidY(ovalRect)) radius: CGRectGetWidth(ovalRect) / 2 startAngle: ovalStartAngle * M_PI/180 endAngle: ovalEndAngle * M_PI/180 clockwise: YES];
//        [ovalPath addLineToPoint: CGPointMake(CGRectGetMidX(ovalRect), CGRectGetMidY(ovalRect))];
//        [ovalPath closePath];
//        
//        [fillColor setFill];
//        [ovalPath fill];
//    }
//}

@end
