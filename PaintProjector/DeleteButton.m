//
//  DeleteButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-1.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "DeleteButton.h"

@implementation DeleteButton

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
    UIColor* iconColor = [UIColor colorWithRed: 1 green: 0.3 blue: 0 alpha: 1];
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
    
    //// Frames
    CGRect frame = self.bounds;
    
    //// Subframes
    CGRect group = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 51) * 0.50649 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.41667 + 0.5), 51, 44);
    
    
    //// Group
    {
        //// Main Drawing
        UIBezierPath* mainPath = [UIBezierPath bezierPath];
        [mainPath moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.72826 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.21795 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.64130 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.21795 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.64130 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.80769 * CGRectGetHeight(group))];
        [mainPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.68478 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.85897 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.64130 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.83601 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.66077 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.85897 * CGRectGetHeight(group))];
        [mainPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.72826 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.80769 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.70879 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.85897 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.72826 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.83601 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.72826 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.21795 * CGRectGetHeight(group))];
        [mainPath closePath];
        [mainPath moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.55435 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.21795 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.44565 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.21795 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.44565 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.79487 * CGRectGetHeight(group))];
        [mainPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.50000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.85897 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.44565 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.83027 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.46998 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.85897 * CGRectGetHeight(group))];
        [mainPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.55435 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.79487 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.53002 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.85897 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.55435 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.83027 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.55435 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.21795 * CGRectGetHeight(group))];
        [mainPath closePath];
        [mainPath moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.35870 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.21795 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.27174 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.21795 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.27174 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.80769 * CGRectGetHeight(group))];
        [mainPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.31522 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.85897 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.27174 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.83601 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.29121 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.85897 * CGRectGetHeight(group))];
        [mainPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.35870 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.80769 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.33923 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.85897 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.35870 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.83601 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.35870 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.21795 * CGRectGetHeight(group))];
        [mainPath closePath];
        [mainPath moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.61957 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.05128 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.64130 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.08974 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.93478 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.08974 * CGRectGetHeight(group))];
        [mainPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.98913 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.15385 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.96480 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.08974 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.98913 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.11844 * CGRectGetHeight(group))];
        [mainPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.93478 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.21795 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.98913 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.18925 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.96480 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.21795 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.85870 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.21795 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.83696 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.87754 * CGRectGetHeight(group))];
        [mainPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.75000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.98718 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.83696 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.93809 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.79802 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.98718 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.25000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.98718 * CGRectGetHeight(group))];
        [mainPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.16304 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.87754 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.20198 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.98718 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.16304 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.93809 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.14130 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.21795 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.06522 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.21795 * CGRectGetHeight(group))];
        [mainPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.01087 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.15385 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.03520 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.21795 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.01087 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.18925 * CGRectGetHeight(group))];
        [mainPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.06522 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.08974 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.01087 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.11844 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.03520 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.08974 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.31522 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.08974 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.33696 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.05128 * CGRectGetHeight(group))];
        [mainPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.39130 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.01282 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.33696 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.01588 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.36129 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.01282 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.56522 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.01282 * CGRectGetHeight(group))];
        [mainPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.61957 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.05128 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.59523 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.01282 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.61957 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.01588 * CGRectGetHeight(group))];
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
