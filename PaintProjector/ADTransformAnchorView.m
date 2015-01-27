//
//  TransformAnchorView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-12-10.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADTransformAnchorView.h"

@implementation ADTransformAnchorView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
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
    UIColor* strokeColor = [UIColor colorWithRed: 0.88 green: 0.843 blue: 0.843 alpha: 1];
    
    //// Shadow Declarations
    UIColor* shadow = strokeColor;
    CGSize shadowOffset = CGSizeMake(0.1, 3.1);
    CGFloat shadowBlurRadius = 5;
    
    //// Oval Drawing
    CGFloat size = self.bounds.size.width - 4;
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(2, 2, size, size)];
    [UIColor.lightGrayColor setFill];
    [ovalPath fill];
    
    ////// Oval Inner Shadow
    CGContextSaveGState(context);
    UIRectClip(ovalPath.bounds);
    CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
    
    CGContextSetAlpha(context, CGColorGetAlpha([shadow CGColor]));
    CGContextBeginTransparencyLayer(context, NULL);
    {
        UIColor* opaqueShadow = [shadow colorWithAlphaComponent: 1];
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, [opaqueShadow CGColor]);
        CGContextSetBlendMode(context, kCGBlendModeSourceOut);
        CGContextBeginTransparencyLayer(context, NULL);
        
        [opaqueShadow setFill];
        [ovalPath fill];
        
        CGContextEndTransparencyLayer(context);
    }
    CGContextEndTransparencyLayer(context);
    CGContextRestoreGState(context);
    
    [UIColor.whiteColor setStroke];
    ovalPath.lineWidth = 0.5;
    [ovalPath stroke];
  
    
}


@end
