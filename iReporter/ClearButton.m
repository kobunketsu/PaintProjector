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

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        self.layer.delegate = self;
    }
    return self;
}

-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    UIGraphicsPushContext(ctx);
    
    //// General Declarations
    CGContextRef context = ctx;
    
    //// Color Declarations
    UIColor* iconHighlightColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    CGFloat r = ((CustomLayer*)layer).baseColorR;
    CGFloat g = ((CustomLayer*)layer).baseColorG;
    CGFloat b = ((CustomLayer*)layer).baseColorB;
    UIColor* iconColor = self.isHighlighted ? [UIColor whiteColor] : [UIColor colorWithRed:r green:g blue:b alpha:1.0];
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
//    CGRect textRect = CGRectMake(25, 52, 60, 18);
//    CGContextSaveGState(context);
//    CGContextSetShadowWithColor(context, labelHightlightOffset, labelHightlightBlurRadius, labelHightlight.CGColor);
//    [iconColor setFill];
//    [textContent drawInRect: textRect withFont: [UIFont fontWithName: @"Helvetica-Bold" size: 12] lineBreakMode: UILineBreakModeWordWrap alignment: UITextAlignmentCenter];
//    CGContextRestoreGState(context);
    
    
    
    //// Main Drawing
    UIBezierPath* mainPath = [UIBezierPath bezierPath];
    [mainPath moveToPoint: CGPointMake(65.5, 19.5)];
    [mainPath addLineToPoint: CGPointMake(61.5, 19.5)];
    [mainPath addLineToPoint: CGPointMake(61.5, 42.5)];
    [mainPath addCurveToPoint: CGPointMake(63.5, 44.5) controlPoint1: CGPointMake(61.5, 43.6) controlPoint2: CGPointMake(62.4, 44.5)];
    [mainPath addCurveToPoint: CGPointMake(65.5, 42.5) controlPoint1: CGPointMake(64.6, 44.5) controlPoint2: CGPointMake(65.5, 43.6)];
    [mainPath addLineToPoint: CGPointMake(65.5, 19.5)];
    [mainPath closePath];
    [mainPath moveToPoint: CGPointMake(57.5, 19.5)];
    [mainPath addLineToPoint: CGPointMake(52.5, 19.5)];
    [mainPath addLineToPoint: CGPointMake(52.5, 42)];
    [mainPath addCurveToPoint: CGPointMake(55, 44.5) controlPoint1: CGPointMake(52.5, 43.38) controlPoint2: CGPointMake(53.62, 44.5)];
    [mainPath addCurveToPoint: CGPointMake(57.5, 42) controlPoint1: CGPointMake(56.38, 44.5) controlPoint2: CGPointMake(57.5, 43.38)];
    [mainPath addLineToPoint: CGPointMake(57.5, 19.5)];
    [mainPath closePath];
    [mainPath moveToPoint: CGPointMake(48.5, 19.5)];
    [mainPath addLineToPoint: CGPointMake(44.5, 19.5)];
    [mainPath addLineToPoint: CGPointMake(44.5, 42.5)];
    [mainPath addCurveToPoint: CGPointMake(46.5, 44.5) controlPoint1: CGPointMake(44.5, 43.6) controlPoint2: CGPointMake(45.4, 44.5)];
    [mainPath addCurveToPoint: CGPointMake(48.5, 42.5) controlPoint1: CGPointMake(47.6, 44.5) controlPoint2: CGPointMake(48.5, 43.6)];
    [mainPath addLineToPoint: CGPointMake(48.5, 19.5)];
    [mainPath closePath];
    [mainPath moveToPoint: CGPointMake(60.5, 13)];
    [mainPath addLineToPoint: CGPointMake(61.5, 14.5)];
    [mainPath addLineToPoint: CGPointMake(75, 14.5)];
    [mainPath addCurveToPoint: CGPointMake(77.5, 17) controlPoint1: CGPointMake(76.38, 14.5) controlPoint2: CGPointMake(77.5, 15.62)];
    [mainPath addCurveToPoint: CGPointMake(75, 19.5) controlPoint1: CGPointMake(77.5, 18.38) controlPoint2: CGPointMake(76.38, 19.5)];
    [mainPath addLineToPoint: CGPointMake(71.5, 19.5)];
    [mainPath addLineToPoint: CGPointMake(70.5, 45.22)];
    [mainPath addCurveToPoint: CGPointMake(66.5, 49.5) controlPoint1: CGPointMake(70.5, 47.59) controlPoint2: CGPointMake(68.71, 49.5)];
    [mainPath addLineToPoint: CGPointMake(43.5, 49.5)];
    [mainPath addCurveToPoint: CGPointMake(39.5, 45.22) controlPoint1: CGPointMake(41.29, 49.5) controlPoint2: CGPointMake(39.5, 47.59)];
    [mainPath addLineToPoint: CGPointMake(38.5, 19.5)];
    [mainPath addLineToPoint: CGPointMake(35, 19.5)];
    [mainPath addCurveToPoint: CGPointMake(32.5, 17) controlPoint1: CGPointMake(33.62, 19.5) controlPoint2: CGPointMake(32.5, 18.38)];
    [mainPath addCurveToPoint: CGPointMake(35, 14.5) controlPoint1: CGPointMake(32.5, 15.62) controlPoint2: CGPointMake(33.62, 14.5)];
    [mainPath addLineToPoint: CGPointMake(46.5, 14.5)];
    [mainPath addLineToPoint: CGPointMake(47.5, 13)];
    [mainPath addCurveToPoint: CGPointMake(50, 11.5) controlPoint1: CGPointMake(47.5, 11.62) controlPoint2: CGPointMake(48.62, 11.5)];
    [mainPath addLineToPoint: CGPointMake(58, 11.5)];
    [mainPath addCurveToPoint: CGPointMake(60.5, 13) controlPoint1: CGPointMake(59.38, 11.5) controlPoint2: CGPointMake(60.5, 11.62)];
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
    
 
    UIGraphicsPopContext();
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
}
*/

@end
