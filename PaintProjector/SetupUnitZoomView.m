//
//  SetupUnitZoomView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 5/2/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "SetupUnitZoomView.h"

@implementation SetupUnitZoomView

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
    UIColor* fillColor2 = [UIColor colorWithRed: 0.495 green: 0.495 blue: 0.495 alpha: 1];
    UIColor* glowColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.941];
    UIColor* innerShadowColor = [UIColor colorWithRed: 0.327 green: 0.327 blue: 0.327 alpha: 1];
    UIColor* shadowColor4 = [UIColor colorWithRed: 0.375 green: 0.375 blue: 0.375 alpha: 0.498];
    UIColor* hightlightColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Shadow Declarations
    UIColor* glow = glowColor;
    CGSize glowOffset = CGSizeMake(0.1, -0.1);
    CGFloat glowBlurRadius = 13;
    UIColor* shadow = shadowColor4;
    CGSize shadowOffset = CGSizeMake(0.1, 2.1);
    CGFloat shadowBlurRadius = 4;
    UIColor* innerShadow = innerShadowColor;
    CGSize innerShadowOffset = CGSizeMake(0.1, 1.1);
    CGFloat innerShadowBlurRadius = 0;
    UIColor* hightlight = hightlightColor;
    CGSize hightlightOffset = CGSizeMake(0.1, 1.1);
    CGFloat hightlightBlurRadius = 0;
    
    //// Frames
    CGRect frame = CGRectMake(0, 0, 66, 66);
    
    //// Subframes
    CGRect group3 = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 43) * 0.52174 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.40909 + 0.5), 43, 44);
    
    
    //// Group 3
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Group
        {
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, glow.CGColor);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier Drawing
            UIBezierPath* bezierPath = [UIBezierPath bezierPath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.17418 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.16982 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.17418 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.50620 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.07891 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.26271 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.07891 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.41331 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.50734 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.51704 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.26560 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.59532 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.41151 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.59893 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.53292 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.49168 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.51922 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.16982 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.61425 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.39824 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.60968 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.25801 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.17418 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.16982 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.42394 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.07693 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.26946 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.07693 * CGRectGetHeight(group3))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.59185 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.09900 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.61933 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.54687 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.71737 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.22137 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.72653 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.41422 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.98487 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.91357 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.91253 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.98521 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.54430 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.61581 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.10155 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.57701 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.40914 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.70741 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.22203 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.69448 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.10155 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.09900 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + -0.03385 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.44501 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + -0.03385 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.23100 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.59185 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.09900 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.23694 * CGRectGetWidth(group3), CGRectGetMinY(group3) + -0.03300 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.45646 * CGRectGetWidth(group3), CGRectGetMinY(group3) + -0.03300 * CGRectGetHeight(group3))];
            [bezierPath closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, hightlightOffset, hightlightBlurRadius, hightlight.CGColor);
            [fillColor2 setFill];
            [bezierPath fill];
            
            ////// Bezier Inner Shadow
            CGRect bezierBorderRect = CGRectInset([bezierPath bounds], -innerShadowBlurRadius, -innerShadowBlurRadius);
            bezierBorderRect = CGRectOffset(bezierBorderRect, -innerShadowOffset.width, -innerShadowOffset.height);
            bezierBorderRect = CGRectInset(CGRectUnion(bezierBorderRect, [bezierPath bounds]), -1, -1);
            
            UIBezierPath* bezierNegativePath = [UIBezierPath bezierPathWithRect: bezierBorderRect];
            [bezierNegativePath appendPath: bezierPath];
            bezierNegativePath.usesEvenOddFillRule = YES;
            
            CGContextSaveGState(context);
            {
                CGFloat xOffset = innerShadowOffset.width + round(bezierBorderRect.size.width);
                CGFloat yOffset = innerShadowOffset.height;
                CGContextSetShadowWithColor(context,
                                            CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                            innerShadowBlurRadius,
                                            innerShadow.CGColor);
                
                [bezierPath addClip];
                CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezierBorderRect.size.width), 0);
                [bezierNegativePath applyTransform: transform];
                [[UIColor grayColor] setFill];
                [bezierNegativePath fill];
            }
            CGContextRestoreGState(context);
            
            CGContextRestoreGState(context);
            
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
        
        
        //// Group 2
        {
            CGContextSaveGState(context);
            CGContextSetAlpha(context, 0.25);
            CGContextSetBlendMode(context, kCGBlendModeOverlay);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    

}


@end
