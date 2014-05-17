//
//  LayerOpacityLockButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 5/16/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "LayerOpacityLockButton.h"

@implementation LayerOpacityLockButton

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
- (void)pastPaintCode:(CGContextRef)ctx iconColor:(UIColor *)iconColor
{
    //// General Declarations
    CGContextRef context = ctx;
    
    //// Color Declarations
    UIColor* shadowColor2 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.2];
    UIColor* color = iconColor; 
    UIColor* color2 = [UIColor colorWithRed: 0.852 green: 0.844 blue: 0.844 alpha: 1];
    
    //// Shadow Declarations
    UIColor* highlight = [UIColor whiteColor];
    CGSize highlightOffset = CGSizeMake(0.1, 1.1);
    CGFloat highlightBlurRadius = 0;
    UIColor* shadow = shadowColor2;
    CGSize shadowOffset = CGSizeMake(0.1, 1.1);
    CGFloat shadowBlurRadius = 0;
    
    //// Frames
    CGRect frame = CGRectMake(0, 0, 44, 44);
    
    
    //// Group
    {
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 17)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17, CGRectGetMinY(frame) + 17)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17, CGRectGetMinY(frame) + 7)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 7)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 17)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 17, CGRectGetMinY(frame) + 27)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 27, CGRectGetMinY(frame) + 27)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 27, CGRectGetMinY(frame) + 17)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17, CGRectGetMinY(frame) + 17)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17, CGRectGetMinY(frame) + 27)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 27, CGRectGetMinY(frame) + 37)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 37, CGRectGetMinY(frame) + 37)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 37, CGRectGetMinY(frame) + 27)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 27, CGRectGetMinY(frame) + 27)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 27, CGRectGetMinY(frame) + 37)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 27, CGRectGetMinY(frame) + 17)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 37, CGRectGetMinY(frame) + 17)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 37, CGRectGetMinY(frame) + 7)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 27, CGRectGetMinY(frame) + 7)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 27, CGRectGetMinY(frame) + 17)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 37)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17, CGRectGetMinY(frame) + 37)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17, CGRectGetMinY(frame) + 27)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 27)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 37)];
        [bezier2Path closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, highlightOffset, highlightBlurRadius, highlight.CGColor);
        [color2 setFill];
        [bezier2Path fill];
        
        ////// Bezier 2 Inner Shadow
        CGRect bezier2BorderRect = CGRectInset([bezier2Path bounds], -shadowBlurRadius, -shadowBlurRadius);
        bezier2BorderRect = CGRectOffset(bezier2BorderRect, -shadowOffset.width, -shadowOffset.height);
        bezier2BorderRect = CGRectInset(CGRectUnion(bezier2BorderRect, [bezier2Path bounds]), -1, -1);
        
        UIBezierPath* bezier2NegativePath = [UIBezierPath bezierPathWithRect: bezier2BorderRect];
        [bezier2NegativePath appendPath: bezier2Path];
        bezier2NegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = shadowOffset.width + round(bezier2BorderRect.size.width);
            CGFloat yOffset = shadowOffset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        shadowBlurRadius,
                                        shadow.CGColor);
            
            [bezier2Path addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezier2BorderRect.size.width), 0);
            [bezier2NegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [bezier2NegativePath fill];
        }
        CGContextRestoreGState(context);
        
        CGContextRestoreGState(context);
        
        
        
        //// Bezier 3 Drawing
        if (self.isOpacityLocked) {
            UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 17, CGRectGetMinY(frame) + 17)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 27, CGRectGetMinY(frame) + 17)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 27, CGRectGetMinY(frame) + 7)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17, CGRectGetMinY(frame) + 7)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17, CGRectGetMinY(frame) + 17)];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 27)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17, CGRectGetMinY(frame) + 27)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17, CGRectGetMinY(frame) + 17)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 17)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 27)];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 27, CGRectGetMinY(frame) + 27)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 37, CGRectGetMinY(frame) + 27)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 37, CGRectGetMinY(frame) + 17)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 27, CGRectGetMinY(frame) + 17)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 27, CGRectGetMinY(frame) + 27)];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 17, CGRectGetMinY(frame) + 37)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 27, CGRectGetMinY(frame) + 37)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 27, CGRectGetMinY(frame) + 27)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17, CGRectGetMinY(frame) + 27)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17, CGRectGetMinY(frame) + 37)];
            [bezier3Path closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, highlightOffset, highlightBlurRadius, highlight.CGColor);
            [color setFill];
            [bezier3Path fill];
            
            ////// Bezier 3 Inner Shadow
            CGRect bezier3BorderRect = CGRectInset([bezier3Path bounds], -shadowBlurRadius, -shadowBlurRadius);
            bezier3BorderRect = CGRectOffset(bezier3BorderRect, -shadowOffset.width, -shadowOffset.height);
            bezier3BorderRect = CGRectInset(CGRectUnion(bezier3BorderRect, [bezier3Path bounds]), -1, -1);
            
            UIBezierPath* bezier3NegativePath = [UIBezierPath bezierPathWithRect: bezier3BorderRect];
            [bezier3NegativePath appendPath: bezier3Path];
            bezier3NegativePath.usesEvenOddFillRule = YES;
            
            CGContextSaveGState(context);
            {
                CGFloat xOffset = shadowOffset.width + round(bezier3BorderRect.size.width);
                CGFloat yOffset = shadowOffset.height;
                CGContextSetShadowWithColor(context,
                                            CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                            shadowBlurRadius,
                                            shadow.CGColor);
                
                [bezier3Path addClip];
                CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezier3BorderRect.size.width), 0);
                [bezier3NegativePath applyTransform: transform];
                [[UIColor grayColor] setFill];
                [bezier3NegativePath fill];
            }
            CGContextRestoreGState(context);
            
            CGContextRestoreGState(context);
        }
        

        
    }
    
    
 

}
-(void)setIsOpacityLocked:(BOOL)isOpacityLocked{
    _isOpacityLocked = isOpacityLocked;
    [self setNeedsDisplay];
}

@end
