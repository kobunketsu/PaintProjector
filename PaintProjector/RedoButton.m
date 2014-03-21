//
//  RedoButton.m
//  PaintProjector
//
//  Created by 文杰 胡 on 12-11-10.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "RedoButton.h"

@implementation RedoButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    //    DebugLog(@"LayerButton drawLayer inContext");
    
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
    [mainPath moveToPoint: CGPointMake(54.89, 52.06)];
    [mainPath addLineToPoint: CGPointMake(62.14, 44.67)];
    [mainPath addLineToPoint: CGPointMake(40.88, 44.67)];
    [mainPath addCurveToPoint: CGPointMake(30.94, 40.47) controlPoint1: CGPointMake(37.28, 44.67) controlPoint2: CGPointMake(33.68, 43.27)];
    [mainPath addCurveToPoint: CGPointMake(30.94, 20.17) controlPoint1: CGPointMake(25.45, 34.86) controlPoint2: CGPointMake(25.45, 25.77)];
    [mainPath addCurveToPoint: CGPointMake(40.88, 15.97) controlPoint1: CGPointMake(33.68, 17.37) controlPoint2: CGPointMake(37.28, 15.97)];
    [mainPath addLineToPoint: CGPointMake(40.88, 21.49)];
    [mainPath addCurveToPoint: CGPointMake(34.76, 24.07) controlPoint1: CGPointMake(38.67, 21.49) controlPoint2: CGPointMake(36.45, 22.35)];
    [mainPath addCurveToPoint: CGPointMake(34.76, 36.56) controlPoint1: CGPointMake(31.38, 27.52) controlPoint2: CGPointMake(31.38, 33.11)];
    [mainPath addCurveToPoint: CGPointMake(40.88, 39.15) controlPoint1: CGPointMake(36.45, 38.29) controlPoint2: CGPointMake(38.67, 39.15)];
    [mainPath addLineToPoint: CGPointMake(62.14, 39.15)];
    [mainPath addLineToPoint: CGPointMake(54.89, 31.76)];
    [mainPath addLineToPoint: CGPointMake(57.44, 29.16)];
    [mainPath addLineToPoint: CGPointMake(70.15, 41.69)];
    [mainPath addLineToPoint: CGPointMake(57.44, 54.66)];
    [mainPath addLineToPoint: CGPointMake(54.89, 52.06)];
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

//- (id) hitTest:(CGPoint)point withEvent:(UIEvent*)event {
//        
//}
//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
//    if(point.x > 0 && point.x < self.frame.size.width && point.y < 0 && point.y > - self.frame.size.height){
//        return true;        
//    }
//    else {
//        return false;
//
//    }
//}
@end
