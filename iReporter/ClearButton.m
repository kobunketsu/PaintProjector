//
//  ClearButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-6.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ClearButton.h"

@implementation ClearButton

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
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* iconHighlightColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* iconColor = [UIColor colorWithRed: 0.559 green: 0.558 blue: 0.559 alpha: 1];
    CGFloat iconColorHSBA[4];
    [iconColor getHue: &iconColorHSBA[0] saturation: &iconColorHSBA[1] brightness: &iconColorHSBA[2] alpha: &iconColorHSBA[3]];
    
    UIColor* iconShadowColorColor = [UIColor colorWithHue: iconColorHSBA[0] saturation: iconColorHSBA[1] brightness: 0.325 alpha: iconColorHSBA[3]];
    UIColor* labelHightlightColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Shadow Declarations
    UIColor* iconHighlight = iconHighlightColor;
    CGSize iconHighlightOffset = CGSizeMake(0.1, 1.1);
    CGFloat iconHighlightBlurRadius = 0;
    UIColor* iconShadow = iconShadowColorColor;
    CGSize iconShadowOffset = CGSizeMake(0.1, 1.1);
    CGFloat iconShadowBlurRadius = 0;
    UIColor* labelHightlight = labelHightlightColor;
    CGSize labelHightlightOffset = CGSizeMake(0.1, 1.1);
    CGFloat labelHightlightBlurRadius = 0;
    
    //// Abstracted Attributes
    NSString* textContent = @"Clear";
    
    
    //// Text Drawing
    CGRect textRect = CGRectMake(0, 52, 60, 18);
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, labelHightlightOffset, labelHightlightBlurRadius, labelHightlight.CGColor);
    [iconColor setFill];
    [textContent drawInRect: textRect withFont: [UIFont fontWithName: @"Helvetica-Bold" size: 12] lineBreakMode: UILineBreakModeWordWrap alignment: UITextAlignmentCenter];
    CGContextRestoreGState(context);
    
    

    
    
    
    if (self.tracking) {
        //// Down Drawing
        UIBezierPath* downPath = [UIBezierPath bezierPath];
        [downPath moveToPoint: CGPointMake(40.34, 22.73)];
        [downPath addLineToPoint: CGPointMake(36.35, 23.01)];
        [downPath addLineToPoint: CGPointMake(37.97, 45.96)];
        [downPath addCurveToPoint: CGPointMake(40.1, 47.81) controlPoint1: CGPointMake(38.05, 47.06) controlPoint2: CGPointMake(39, 47.89)];
        [downPath addCurveToPoint: CGPointMake(41.96, 45.68) controlPoint1: CGPointMake(41.21, 47.74) controlPoint2: CGPointMake(42.04, 46.78)];
        [downPath addLineToPoint: CGPointMake(40.34, 22.73)];
        [downPath closePath];
        [downPath moveToPoint: CGPointMake(32.36, 23.3)];
        [downPath addLineToPoint: CGPointMake(27.38, 23.65)];
        [downPath addLineToPoint: CGPointMake(28.96, 46.09)];
        [downPath addCurveToPoint: CGPointMake(31.62, 48.41) controlPoint1: CGPointMake(29.05, 47.47) controlPoint2: CGPointMake(30.25, 48.51)];
        [downPath addCurveToPoint: CGPointMake(33.94, 45.74) controlPoint1: CGPointMake(33, 48.31) controlPoint2: CGPointMake(34.04, 47.12)];
        [downPath addLineToPoint: CGPointMake(32.36, 23.3)];
        [downPath closePath];
        [downPath moveToPoint: CGPointMake(23.39, 23.93)];
        [downPath addLineToPoint: CGPointMake(19.4, 24.21)];
        [downPath addLineToPoint: CGPointMake(21.01, 47.15)];
        [downPath addCurveToPoint: CGPointMake(23.15, 49.01) controlPoint1: CGPointMake(21.09, 48.25) controlPoint2: CGPointMake(22.04, 49.08)];
        [downPath addCurveToPoint: CGPointMake(25, 46.87) controlPoint1: CGPointMake(24.25, 48.93) controlPoint2: CGPointMake(25.08, 47.97)];
        [downPath addLineToPoint: CGPointMake(23.39, 23.93)];
        [downPath closePath];
        [downPath moveToPoint: CGPointMake(49.82, 22.07)];
        [downPath addLineToPoint: CGPointMake(46.33, 22.31)];
        [downPath addLineToPoint: CGPointMake(47.14, 48.04)];
        [downPath addCurveToPoint: CGPointMake(43.45, 52.59) controlPoint1: CGPointMake(47.3, 50.4) controlPoint2: CGPointMake(45.65, 52.44)];
        [downPath addLineToPoint: CGPointMake(20.5, 54.2)];
        [downPath addCurveToPoint: CGPointMake(16.21, 50.22) controlPoint1: CGPointMake(18.3, 54.36) controlPoint2: CGPointMake(16.38, 52.58)];
        [downPath addLineToPoint: CGPointMake(13.41, 24.63)];
        [downPath addLineToPoint: CGPointMake(9.92, 24.87)];
        [downPath addCurveToPoint: CGPointMake(7.25, 22.56) controlPoint1: CGPointMake(8.54, 24.97) controlPoint2: CGPointMake(7.35, 23.93)];
        [downPath addLineToPoint: CGPointMake(52.14, 19.4)];
        [downPath addCurveToPoint: CGPointMake(49.82, 22.07) controlPoint1: CGPointMake(52.24, 20.78) controlPoint2: CGPointMake(51.2, 21.97)];
        [downPath closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
        [iconColor setFill];
        [downPath fill];
        
        ////// Down Inner Shadow
        CGRect downBorderRect = CGRectInset([downPath bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
        downBorderRect = CGRectOffset(downBorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
        downBorderRect = CGRectInset(CGRectUnion(downBorderRect, [downPath bounds]), -1, -1);
        
        UIBezierPath* downNegativePath = [UIBezierPath bezierPathWithRect: downBorderRect];
        [downNegativePath appendPath: downPath];
        downNegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = iconShadowOffset.width + round(downBorderRect.size.width);
            CGFloat yOffset = iconShadowOffset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        iconShadowBlurRadius,
                                        iconShadow.CGColor);
            
            [downPath addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(downBorderRect.size.width), 0);
            [downNegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [downNegativePath fill];
        }
        CGContextRestoreGState(context);
        
        CGContextRestoreGState(context);
        
        
        
        //// Up Drawing
        UIBezierPath* upPath = [UIBezierPath bezierPath];
        [upPath moveToPoint: CGPointMake(37.39, 10.19)];
        [upPath addLineToPoint: CGPointMake(37.86, 11.93)];
        [upPath addLineToPoint: CGPointMake(50.67, 16.2)];
        [upPath addCurveToPoint: CGPointMake(52.25, 19.37) controlPoint1: CGPointMake(51.98, 16.64) controlPoint2: CGPointMake(52.69, 18.06)];
        [upPath addLineToPoint: CGPointMake(9.56, 5.12)];
        [upPath addCurveToPoint: CGPointMake(12.73, 3.54) controlPoint1: CGPointMake(10, 3.81) controlPoint2: CGPointMake(11.42, 3.1)];
        [upPath addLineToPoint: CGPointMake(23.64, 7.18)];
        [upPath addLineToPoint: CGPointMake(25.06, 6.07)];
        [upPath addCurveToPoint: CGPointMake(27.9, 5.44) controlPoint1: CGPointMake(25.5, 4.76) controlPoint2: CGPointMake(26.6, 5.01)];
        [upPath addLineToPoint: CGPointMake(35.49, 7.98)];
        [upPath addCurveToPoint: CGPointMake(37.39, 10.19) controlPoint1: CGPointMake(36.8, 8.41) controlPoint2: CGPointMake(37.83, 8.88)];
        [upPath closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
        [iconColor setFill];
        [upPath fill];
        
        ////// Up Inner Shadow
        CGRect upBorderRect = CGRectInset([upPath bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
        upBorderRect = CGRectOffset(upBorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
        upBorderRect = CGRectInset(CGRectUnion(upBorderRect, [upPath bounds]), -1, -1);
        
        UIBezierPath* upNegativePath = [UIBezierPath bezierPathWithRect: upBorderRect];
        [upNegativePath appendPath: upPath];
        upNegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = iconShadowOffset.width + round(upBorderRect.size.width);
            CGFloat yOffset = iconShadowOffset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        iconShadowBlurRadius,
                                        iconShadow.CGColor);
            
            [upPath addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(upBorderRect.size.width), 0);
            [upNegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [upNegativePath fill];
        }
        CGContextRestoreGState(context);
        
        CGContextRestoreGState(context);
        
    }
    else{
        
        //// Main Drawing
        UIBezierPath* mainPath = [UIBezierPath bezierPath];
        [mainPath moveToPoint: CGPointMake(40.5, 21.5)];
        [mainPath addLineToPoint: CGPointMake(36.5, 21.5)];
        [mainPath addLineToPoint: CGPointMake(36.5, 44.5)];
        [mainPath addCurveToPoint: CGPointMake(38.5, 46.5) controlPoint1: CGPointMake(36.5, 45.6) controlPoint2: CGPointMake(37.4, 46.5)];
        [mainPath addCurveToPoint: CGPointMake(40.5, 44.5) controlPoint1: CGPointMake(39.6, 46.5) controlPoint2: CGPointMake(40.5, 45.6)];
        [mainPath addLineToPoint: CGPointMake(40.5, 21.5)];
        [mainPath closePath];
        [mainPath moveToPoint: CGPointMake(32.5, 21.5)];
        [mainPath addLineToPoint: CGPointMake(27.5, 21.5)];
        [mainPath addLineToPoint: CGPointMake(27.5, 44)];
        [mainPath addCurveToPoint: CGPointMake(30, 46.5) controlPoint1: CGPointMake(27.5, 45.38) controlPoint2: CGPointMake(28.62, 46.5)];
        [mainPath addCurveToPoint: CGPointMake(32.5, 44) controlPoint1: CGPointMake(31.38, 46.5) controlPoint2: CGPointMake(32.5, 45.38)];
        [mainPath addLineToPoint: CGPointMake(32.5, 21.5)];
        [mainPath closePath];
        [mainPath moveToPoint: CGPointMake(23.5, 21.5)];
        [mainPath addLineToPoint: CGPointMake(19.5, 21.5)];
        [mainPath addLineToPoint: CGPointMake(19.5, 44.5)];
        [mainPath addCurveToPoint: CGPointMake(21.5, 46.5) controlPoint1: CGPointMake(19.5, 45.6) controlPoint2: CGPointMake(20.4, 46.5)];
        [mainPath addCurveToPoint: CGPointMake(23.5, 44.5) controlPoint1: CGPointMake(22.6, 46.5) controlPoint2: CGPointMake(23.5, 45.6)];
        [mainPath addLineToPoint: CGPointMake(23.5, 21.5)];
        [mainPath closePath];
        [mainPath moveToPoint: CGPointMake(35.5, 15)];
        [mainPath addLineToPoint: CGPointMake(36.5, 16.5)];
        [mainPath addLineToPoint: CGPointMake(50, 16.5)];
        [mainPath addCurveToPoint: CGPointMake(52.5, 19) controlPoint1: CGPointMake(51.38, 16.5) controlPoint2: CGPointMake(52.5, 17.62)];
        [mainPath addCurveToPoint: CGPointMake(50, 21.5) controlPoint1: CGPointMake(52.5, 20.38) controlPoint2: CGPointMake(51.38, 21.5)];
        [mainPath addLineToPoint: CGPointMake(46.5, 21.5)];
        [mainPath addLineToPoint: CGPointMake(45.5, 47.22)];
        [mainPath addCurveToPoint: CGPointMake(41.5, 51.5) controlPoint1: CGPointMake(45.5, 49.59) controlPoint2: CGPointMake(43.71, 51.5)];
        [mainPath addLineToPoint: CGPointMake(18.5, 51.5)];
        [mainPath addCurveToPoint: CGPointMake(14.5, 47.22) controlPoint1: CGPointMake(16.29, 51.5) controlPoint2: CGPointMake(14.5, 49.59)];
        [mainPath addLineToPoint: CGPointMake(13.5, 21.5)];
        [mainPath addLineToPoint: CGPointMake(10, 21.5)];
        [mainPath addCurveToPoint: CGPointMake(7.5, 19) controlPoint1: CGPointMake(8.62, 21.5) controlPoint2: CGPointMake(7.5, 20.38)];
        [mainPath addCurveToPoint: CGPointMake(10, 16.5) controlPoint1: CGPointMake(7.5, 17.62) controlPoint2: CGPointMake(8.62, 16.5)];
        [mainPath addLineToPoint: CGPointMake(21.5, 16.5)];
        [mainPath addLineToPoint: CGPointMake(22.5, 15)];
        [mainPath addCurveToPoint: CGPointMake(25, 13.5) controlPoint1: CGPointMake(22.5, 13.62) controlPoint2: CGPointMake(23.62, 13.5)];
        [mainPath addLineToPoint: CGPointMake(33, 13.5)];
        [mainPath addCurveToPoint: CGPointMake(35.5, 15) controlPoint1: CGPointMake(34.38, 13.5) controlPoint2: CGPointMake(35.5, 13.62)];
        [mainPath closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
        [iconColor setFill];
        [mainPath fill];
        
        ////// Main Inner Shadow
        CGRect mainBorderRect = CGRectInset([mainPath bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
        mainBorderRect = CGRectOffset(mainBorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
        mainBorderRect = CGRectInset(CGRectUnion(mainBorderRect, [mainPath bounds]), -1, -1);
        
        UIBezierPath* mainNegativePath = [UIBezierPath bezierPathWithRect: mainBorderRect];
        [mainNegativePath appendPath: mainPath];
        mainNegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = iconShadowOffset.width + round(mainBorderRect.size.width);
            CGFloat yOffset = iconShadowOffset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        iconShadowBlurRadius,
                                        iconShadow.CGColor);
            
            [mainPath addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(mainBorderRect.size.width), 0);
            [mainNegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [mainNegativePath fill];
        }
        CGContextRestoreGState(context);
        
        CGContextRestoreGState(context);
    }
    

}


@end
