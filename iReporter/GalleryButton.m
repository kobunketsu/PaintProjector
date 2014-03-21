//
//  GalleryButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-5.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "GalleryButton.h"

@implementation GalleryButton

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
    UIColor* iconHighlightColor = [UIColor colorWithRed: 0.9 green: 0.9 blue: 0.9 alpha: 0.75];
    UIColor* iconColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    CGFloat iconColorHSBA[4];
    [iconColor getHue: &iconColorHSBA[0] saturation: &iconColorHSBA[1] brightness: &iconColorHSBA[2] alpha: &iconColorHSBA[3]];
    
    UIColor* iconShadowColorColor = [UIColor colorWithHue: iconColorHSBA[0] saturation: 0.325 brightness: iconColorHSBA[2] alpha: iconColorHSBA[3]];
    UIColor* iconColorA50 = [iconColor colorWithAlphaComponent: 0.5];
    
    //// Shadow Declarations
    UIColor* iconHighlight = iconHighlightColor;
    CGSize iconHighlightOffset = CGSizeMake(0.1, 1.1);
    CGFloat iconHighlightBlurRadius = 0;
    UIColor* iconShadow = iconShadowColorColor;
    CGSize iconShadowOffset = CGSizeMake(0.1, 1.1);
    CGFloat iconShadowBlurRadius = 0;
    
    //// Frames
    CGRect frameBound = CGRectMake(0, 0, 128, 80);
    
    //// Subframes
    CGRect icon = CGRectMake(CGRectGetMinX(frameBound) + floor((CGRectGetWidth(frameBound) - 61) * 0.52239 + 0.5), CGRectGetMinY(frameBound) + floor((CGRectGetHeight(frameBound) - 66) * 0.78571 + 0.5), 61, 66);
    
    
    //// Icon
    {
        //// frameIcon
        {
            //// paintFrame
            {
                //// frame 5 Drawing
                UIBezierPath* frame5Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(icon) + floor(CGRectGetWidth(icon) * 0.56557) + 0.5, CGRectGetMinY(icon) + floor(CGRectGetHeight(icon) * 0.12879) + 0.5, floor(CGRectGetWidth(icon) * 0.89344) - floor(CGRectGetWidth(icon) * 0.56557), floor(CGRectGetHeight(icon) * 0.53788) - floor(CGRectGetHeight(icon) * 0.12879))];
                CGContextSaveGState(context);
                CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
                [iconColorA50 setFill];
                [frame5Path fill];
                
                ////// frame 5 Inner Shadow
                CGRect frame5BorderRect = CGRectInset([frame5Path bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
                frame5BorderRect = CGRectOffset(frame5BorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
                frame5BorderRect = CGRectInset(CGRectUnion(frame5BorderRect, [frame5Path bounds]), -1, -1);
                
                UIBezierPath* frame5NegativePath = [UIBezierPath bezierPathWithRect: frame5BorderRect];
                [frame5NegativePath appendPath: frame5Path];
                frame5NegativePath.usesEvenOddFillRule = YES;
                
                CGContextSaveGState(context);
                {
                    CGFloat xOffset = iconShadowOffset.width + round(frame5BorderRect.size.width);
                    CGFloat yOffset = iconShadowOffset.height;
                    CGContextSetShadowWithColor(context,
                                                CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                                iconShadowBlurRadius,
                                                iconShadow.CGColor);
                    
                    [frame5Path addClip];
                    CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(frame5BorderRect.size.width), 0);
                    [frame5NegativePath applyTransform: transform];
                    [[UIColor grayColor] setFill];
                    [frame5NegativePath fill];
                }
                CGContextRestoreGState(context);
                
                CGContextRestoreGState(context);
                
                CGContextSaveGState(context);
                CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
                [iconColor setStroke];
                frame5Path.lineWidth = 3;
                [frame5Path stroke];
                CGContextRestoreGState(context);
                
                
                //// Bezier 4 Drawing
                UIBezierPath* bezier4Path = [UIBezierPath bezierPath];
                [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.64754 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.12879 * CGRectGetHeight(icon))];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.72951 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.00758 * CGRectGetHeight(icon))];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.81148 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.12879 * CGRectGetHeight(icon))];
                [iconColor setStroke];
                bezier4Path.lineWidth = 1;
                [bezier4Path stroke];
            }
            
            
            //// paintFrame 3
            {
                //// frame 6 Drawing
                UIBezierPath* frame6Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(icon) + floor(CGRectGetWidth(icon) * 0.10656) + 0.5, CGRectGetMinY(icon) + floor(CGRectGetHeight(icon) * 0.12879) + 0.5, floor(CGRectGetWidth(icon) * 0.43443) - floor(CGRectGetWidth(icon) * 0.10656), floor(CGRectGetHeight(icon) * 0.53788) - floor(CGRectGetHeight(icon) * 0.12879))];
                CGContextSaveGState(context);
                CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
                [iconColorA50 setFill];
                [frame6Path fill];
                
                ////// frame 6 Inner Shadow
                CGRect frame6BorderRect = CGRectInset([frame6Path bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
                frame6BorderRect = CGRectOffset(frame6BorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
                frame6BorderRect = CGRectInset(CGRectUnion(frame6BorderRect, [frame6Path bounds]), -1, -1);
                
                UIBezierPath* frame6NegativePath = [UIBezierPath bezierPathWithRect: frame6BorderRect];
                [frame6NegativePath appendPath: frame6Path];
                frame6NegativePath.usesEvenOddFillRule = YES;
                
                CGContextSaveGState(context);
                {
                    CGFloat xOffset = iconShadowOffset.width + round(frame6BorderRect.size.width);
                    CGFloat yOffset = iconShadowOffset.height;
                    CGContextSetShadowWithColor(context,
                                                CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                                iconShadowBlurRadius,
                                                iconShadow.CGColor);
                    
                    [frame6Path addClip];
                    CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(frame6BorderRect.size.width), 0);
                    [frame6NegativePath applyTransform: transform];
                    [[UIColor grayColor] setFill];
                    [frame6NegativePath fill];
                }
                CGContextRestoreGState(context);
                
                CGContextRestoreGState(context);
                
                CGContextSaveGState(context);
                CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
                [iconColor setStroke];
                frame6Path.lineWidth = 3;
                [frame6Path stroke];
                CGContextRestoreGState(context);
                
                
                //// Bezier 6 Drawing
                UIBezierPath* bezier6Path = [UIBezierPath bezierPath];
                [bezier6Path moveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.18852 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.12879 * CGRectGetHeight(icon))];
                [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.27049 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.00758 * CGRectGetHeight(icon))];
                [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.35246 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.12879 * CGRectGetHeight(icon))];
                [iconColor setStroke];
                bezier6Path.lineWidth = 1;
                [bezier6Path stroke];
            }
        }
        
        
        //// Group
        {
            //// Rectangle Drawing
            UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(icon) + floor(CGRectGetWidth(icon) * 0.45902 + 0.5), CGRectGetMinY(icon) + floor(CGRectGetHeight(icon) * 0.61364) + 0.5, floor(CGRectGetWidth(icon) * 0.52459 + 0.5) - floor(CGRectGetWidth(icon) * 0.45902 + 0.5), floor(CGRectGetHeight(icon) * 0.85606) - floor(CGRectGetHeight(icon) * 0.61364))];
            [iconColor setFill];
            [rectanglePath fill];
            
            
            //// Rectangle 2 Drawing
            UIBezierPath* rectangle2Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(icon) + floor(CGRectGetWidth(icon) * 0.42623 + 0.5), CGRectGetMinY(icon) + floor(CGRectGetHeight(icon) * 0.84848 + 0.5), floor(CGRectGetWidth(icon) * 0.55738 + 0.5) - floor(CGRectGetWidth(icon) * 0.42623 + 0.5), floor(CGRectGetHeight(icon) * 0.87879 + 0.5) - floor(CGRectGetHeight(icon) * 0.84848 + 0.5))];
            [iconColor setFill];
            [rectangle2Path fill];
            
            
            //// Bezier 7 Drawing
            UIBezierPath* bezier7Path = [UIBezierPath bezierPath];
            [bezier7Path moveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.51639 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.64394 * CGRectGetHeight(icon))];
            [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.71311 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.71970 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.51639 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.64394 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.62061 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.69055 * CGRectGetHeight(icon))];
            [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.89344 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.75000 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.80562 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.74884 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.89344 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.75000 * CGRectGetHeight(icon))];
            [iconColor setStroke];
            bezier7Path.lineWidth = 1;
            [bezier7Path stroke];
            
            
            //// Bezier 8 Drawing
            UIBezierPath* bezier8Path = [UIBezierPath bezierPath];
            [bezier8Path moveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.48361 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.64394 * CGRectGetHeight(icon))];
            [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.28689 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.71970 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.48361 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.64394 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.37939 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.69055 * CGRectGetHeight(icon))];
            [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.10656 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.75000 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.19438 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.74884 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.10656 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.75000 * CGRectGetHeight(icon))];
            [iconColor setStroke];
            bezier8Path.lineWidth = 1;
            [bezier8Path stroke];
        }
    }
    
    
}


@end
