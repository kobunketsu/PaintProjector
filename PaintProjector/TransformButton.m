//
//  TransformButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-5.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "TransformButton.h"

@implementation TransformButton

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
    //    DebugLog(@"LayerButton drawLayer inContext");
    CGFloat r = ((CustomLayer*)layer).baseColorR;
    CGFloat g = ((CustomLayer*)layer).baseColorG;
    CGFloat b = ((CustomLayer*)layer).baseColorB;
    UIColor* iconColor = (self.isHighlighted || self.isSelected) ? [UIColor whiteColor] : [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    
    UIGraphicsPushContext(ctx);
    
    [self pastPaintCode:ctx iconColor:iconColor];
    
    UIGraphicsPopContext();
}

- (void)pastPaintCode:(CGContextRef)ctx iconColor:(UIColor *)iconColor{
    //// General Declarations
    CGContextRef context = ctx;
    
    //// Color Declarations
//    UIColor* iconColor = [UIColor colorWithRed: 0.176 green: 0.648 blue: 0.141 alpha: 1];
    CGFloat iconColorRGBA[4];
    [iconColor getRed: &iconColorRGBA[0] green: &iconColorRGBA[1] blue: &iconColorRGBA[2] alpha: &iconColorRGBA[3]];
    
    UIColor* iconHighlightColor = [UIColor colorWithRed: (iconColorRGBA[0] * 0 + 1) green: (iconColorRGBA[1] * 0 + 1) blue: (iconColorRGBA[2] * 0 + 1) alpha: (iconColorRGBA[3] * 0 + 1)];
    UIColor* iconShadowColorColor = [UIColor colorWithRed: (iconColorRGBA[0] * 0.5) green: (iconColorRGBA[1] * 0.5) blue: (iconColorRGBA[2] * 0.5) alpha: (iconColorRGBA[3] * 0.5 + 0.5)];
    
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
    CGRect group = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 44) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.41667 + 0.5), 44, 44);
    
    
    //// Group
    {
        //// transformIcon Drawing
        UIBezierPath* transformIconPath = [UIBezierPath bezierPath];
        [transformIconPath moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.66472 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.17394 * CGRectGetHeight(group))];
        [transformIconPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.54359 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.17394 * CGRectGetHeight(group))];
        [transformIconPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.54359 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.44593 * CGRectGetHeight(group))];
        [transformIconPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.80869 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.44593 * CGRectGetHeight(group))];
        [transformIconPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.80588 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32613 * CGRectGetHeight(group))];
        [transformIconPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.98867 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.48381 * CGRectGetHeight(group))];
        [transformIconPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.81410 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.65692 * CGRectGetHeight(group))];
        [transformIconPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.81107 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.52941 * CGRectGetHeight(group))];
        [transformIconPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.54359 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.52941 * CGRectGetHeight(group))];
        [transformIconPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.54359 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.80398 * CGRectGetHeight(group))];
        [transformIconPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.66088 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.80111 * CGRectGetHeight(group))];
        [transformIconPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.50650 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.98780 * CGRectGetHeight(group))];
        [transformIconPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.33701 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.80950 * CGRectGetHeight(group))];
        [transformIconPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.46186 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.80640 * CGRectGetHeight(group))];
        [transformIconPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.46186 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.52941 * CGRectGetHeight(group))];
        [transformIconPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.19184 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.52941 * CGRectGetHeight(group))];
        [transformIconPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.19184 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.65313 * CGRectGetHeight(group))];
        [transformIconPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.01306 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.48767 * CGRectGetHeight(group))];
        [transformIconPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.19184 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32221 * CGRectGetHeight(group))];
        [transformIconPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.19184 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.44593 * CGRectGetHeight(group))];
        [transformIconPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.46186 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.44593 * CGRectGetHeight(group))];
        [transformIconPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.46186 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.17394 * CGRectGetHeight(group))];
        [transformIconPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.34073 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.17394 * CGRectGetHeight(group))];
        [transformIconPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.50272 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.01220 * CGRectGetHeight(group))];
        [transformIconPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.66472 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.17394 * CGRectGetHeight(group))];
        [transformIconPath closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
        [iconColor setFill];
        [transformIconPath fill];
        
        ////// transformIcon Inner Shadow
        CGRect transformIconBorderRect = CGRectInset([transformIconPath bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
        transformIconBorderRect = CGRectOffset(transformIconBorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
        transformIconBorderRect = CGRectInset(CGRectUnion(transformIconBorderRect, [transformIconPath bounds]), -1, -1);
        
        UIBezierPath* transformIconNegativePath = [UIBezierPath bezierPathWithRect: transformIconBorderRect];
        [transformIconNegativePath appendPath: transformIconPath];
        transformIconNegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = iconShadowOffset.width + round(transformIconBorderRect.size.width);
            CGFloat yOffset = iconShadowOffset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        iconShadowBlurRadius,
                                        iconShadow.CGColor);
            
            [transformIconPath addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(transformIconBorderRect.size.width), 0);
            [transformIconNegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [transformIconNegativePath fill];
        }
        CGContextRestoreGState(context);
        
        CGContextRestoreGState(context);
        
    }
    
    
 
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
}
*/

@end
