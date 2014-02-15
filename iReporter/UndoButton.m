//
//  UndoButton.m
//  iReporter
//
//  Created by 文杰 胡 on 12-11-6.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "UndoButton.h"

@implementation UndoButton

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
-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{

    UIGraphicsPushContext(ctx);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = ctx;
    
    //// Color Declarations
    UIColor* iconHighlightColor = [UIColor colorWithRed: 0.92 green: 0.92 blue: 0.92 alpha: 1];
    CGFloat r = ((CustomLayer*)layer).baseColorR;
    CGFloat g = ((CustomLayer*)layer).baseColorG;
    CGFloat b = ((CustomLayer*)layer).baseColorB;
    UIColor* iconColor = self.isHighlighted ? [UIColor whiteColor] : [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    CGFloat iconColorHSBA[4];
    [iconColor getHue: &iconColorHSBA[0] saturation: &iconColorHSBA[1] brightness: &iconColorHSBA[2] alpha: &iconColorHSBA[3]];
    
    UIColor* iconShadowColorColor = [UIColor colorWithHue: iconColorHSBA[0] saturation: iconColorHSBA[1] brightness: 0.325 alpha: iconColorHSBA[3]];
    
    //// Shadow Declarations
    UIColor* iconHighlight = iconHighlightColor;
    CGSize iconHighlightOffset = CGSizeMake(0.1, 1.1);
    CGFloat iconHighlightBlurRadius = 0;
    UIColor* iconShadow = iconShadowColorColor;
    CGSize iconShadowOffset = CGSizeMake(0.1, 1.1);
    CGFloat iconShadowBlurRadius = 0;
    
    //// Main Drawing
    UIBezierPath* mainPath = [UIBezierPath bezierPath];
    [mainPath moveToPoint: CGPointMake(41.07, 18.57)];
    [mainPath addLineToPoint: CGPointMake(33.83, 25.96)];
    [mainPath addLineToPoint: CGPointMake(55.08, 25.96)];
    [mainPath addCurveToPoint: CGPointMake(65.03, 30.16) controlPoint1: CGPointMake(58.68, 25.96) controlPoint2: CGPointMake(62.28, 27.36)];
    [mainPath addCurveToPoint: CGPointMake(65.03, 50.46) controlPoint1: CGPointMake(70.52, 35.77) controlPoint2: CGPointMake(70.52, 44.85)];
    [mainPath addCurveToPoint: CGPointMake(55.08, 54.66) controlPoint1: CGPointMake(62.28, 53.26) controlPoint2: CGPointMake(58.68, 54.66)];
    [mainPath addLineToPoint: CGPointMake(55.08, 49.14)];
    [mainPath addCurveToPoint: CGPointMake(61.2, 46.55) controlPoint1: CGPointMake(57.3, 49.14) controlPoint2: CGPointMake(59.51, 48.28)];
    [mainPath addCurveToPoint: CGPointMake(61.2, 34.06) controlPoint1: CGPointMake(64.58, 43.11) controlPoint2: CGPointMake(64.58, 37.51)];
    [mainPath addCurveToPoint: CGPointMake(55.08, 31.48) controlPoint1: CGPointMake(59.51, 32.34) controlPoint2: CGPointMake(57.3, 31.48)];
    [mainPath addLineToPoint: CGPointMake(33.83, 31.48)];
    [mainPath addLineToPoint: CGPointMake(41.07, 38.87)];
    [mainPath addLineToPoint: CGPointMake(38.53, 41.47)];
    [mainPath addLineToPoint: CGPointMake(25.82, 28.93)];
    [mainPath addLineToPoint: CGPointMake(38.53, 15.97)];
    [mainPath addLineToPoint: CGPointMake(41.07, 18.57)];
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

//override touchesBegan will ignore touch up inside function
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    UITouch* touch = [touches anyObject];
//    touchPoint = [touch locationInView:self];
//}
//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
//    UITouch* touch = [touches anyObject];
//    touchPoint = [touch locationInView:self];    
//}
//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
//    touchPoint = CGPointMake(0, 0);
//}

@end
