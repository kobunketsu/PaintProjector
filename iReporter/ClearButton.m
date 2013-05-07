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
    // Drawing code
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
    CGRect textRect = CGRectMake(0, 42, 60, 18);
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, labelHightlightOffset, labelHightlightBlurRadius, labelHightlight.CGColor);
    [iconColor setFill];
    [textContent drawInRect: textRect withFont: [UIFont fontWithName: @"Helvetica-Bold" size: 12] lineBreakMode: UILineBreakModeWordWrap alignment: UITextAlignmentCenter];
    CGContextRestoreGState(context);
    
    
    
    //// Main Drawing
    UIBezierPath* mainPath = [UIBezierPath bezierPath];
    [mainPath moveToPoint: CGPointMake(40.5, 11.5)];
    [mainPath addLineToPoint: CGPointMake(36.5, 11.5)];
    [mainPath addLineToPoint: CGPointMake(36.5, 34.5)];
    [mainPath addCurveToPoint: CGPointMake(38.5, 36.5) controlPoint1: CGPointMake(36.5, 35.6) controlPoint2: CGPointMake(37.4, 36.5)];
    [mainPath addCurveToPoint: CGPointMake(40.5, 34.5) controlPoint1: CGPointMake(39.6, 36.5) controlPoint2: CGPointMake(40.5, 35.6)];
    [mainPath addLineToPoint: CGPointMake(40.5, 11.5)];
    [mainPath closePath];
    [mainPath moveToPoint: CGPointMake(32.5, 11.5)];
    [mainPath addLineToPoint: CGPointMake(27.5, 11.5)];
    [mainPath addLineToPoint: CGPointMake(27.5, 34)];
    [mainPath addCurveToPoint: CGPointMake(30, 36.5) controlPoint1: CGPointMake(27.5, 35.38) controlPoint2: CGPointMake(28.62, 36.5)];
    [mainPath addCurveToPoint: CGPointMake(32.5, 34) controlPoint1: CGPointMake(31.38, 36.5) controlPoint2: CGPointMake(32.5, 35.38)];
    [mainPath addLineToPoint: CGPointMake(32.5, 11.5)];
    [mainPath closePath];
    [mainPath moveToPoint: CGPointMake(23.5, 11.5)];
    [mainPath addLineToPoint: CGPointMake(19.5, 11.5)];
    [mainPath addLineToPoint: CGPointMake(19.5, 34.5)];
    [mainPath addCurveToPoint: CGPointMake(21.5, 36.5) controlPoint1: CGPointMake(19.5, 35.6) controlPoint2: CGPointMake(20.4, 36.5)];
    [mainPath addCurveToPoint: CGPointMake(23.5, 34.5) controlPoint1: CGPointMake(22.6, 36.5) controlPoint2: CGPointMake(23.5, 35.6)];
    [mainPath addLineToPoint: CGPointMake(23.5, 11.5)];
    [mainPath closePath];
    [mainPath moveToPoint: CGPointMake(35.5, 5)];
    [mainPath addLineToPoint: CGPointMake(36.5, 6.5)];
    [mainPath addLineToPoint: CGPointMake(50, 6.5)];
    [mainPath addCurveToPoint: CGPointMake(52.5, 9) controlPoint1: CGPointMake(51.38, 6.5) controlPoint2: CGPointMake(52.5, 7.62)];
    [mainPath addCurveToPoint: CGPointMake(50, 11.5) controlPoint1: CGPointMake(52.5, 10.38) controlPoint2: CGPointMake(51.38, 11.5)];
    [mainPath addLineToPoint: CGPointMake(46.5, 11.5)];
    [mainPath addLineToPoint: CGPointMake(45.5, 37.22)];
    [mainPath addCurveToPoint: CGPointMake(41.5, 41.5) controlPoint1: CGPointMake(45.5, 39.59) controlPoint2: CGPointMake(43.71, 41.5)];
    [mainPath addLineToPoint: CGPointMake(18.5, 41.5)];
    [mainPath addCurveToPoint: CGPointMake(14.5, 37.22) controlPoint1: CGPointMake(16.29, 41.5) controlPoint2: CGPointMake(14.5, 39.59)];
    [mainPath addLineToPoint: CGPointMake(13.5, 11.5)];
    [mainPath addLineToPoint: CGPointMake(10, 11.5)];
    [mainPath addCurveToPoint: CGPointMake(7.5, 9) controlPoint1: CGPointMake(8.62, 11.5) controlPoint2: CGPointMake(7.5, 10.38)];
    [mainPath addCurveToPoint: CGPointMake(10, 6.5) controlPoint1: CGPointMake(7.5, 7.62) controlPoint2: CGPointMake(8.62, 6.5)];
    [mainPath addLineToPoint: CGPointMake(21.5, 6.5)];
    [mainPath addLineToPoint: CGPointMake(22.5, 5)];
    [mainPath addCurveToPoint: CGPointMake(25, 3.5) controlPoint1: CGPointMake(22.5, 3.62) controlPoint2: CGPointMake(23.62, 3.5)];
    [mainPath addLineToPoint: CGPointMake(33, 3.5)];
    [mainPath addCurveToPoint: CGPointMake(35.5, 5) controlPoint1: CGPointMake(34.38, 3.5) controlPoint2: CGPointMake(35.5, 3.62)];
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


@end
