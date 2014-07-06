//
//  RadiusIndicatorButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-4.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADOpacityIndicatorView.h"

@implementation ADOpacityIndicatorView

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
        CGSize size = CGSizeMake(40, 20);
        _label = [[UILabel alloc]initWithFrame:CGRectMake((self.bounds.size.width - size.width)* 0.5, (self.bounds.size.height - size.height)* 0.5, size.width, size.height)];
        _label.textColor = [UIColor whiteColor];
        _label.text = [NSString stringWithFormat:@"%.0f",_opacity * 100];
        _label.opaque = false;
        _label.backgroundColor = [UIColor clearColor];
        
        [self addSubview:_label];
    }
    return self;
}

- (void)setFrame:(CGRect)frame{
    super.frame = frame;
    CGSize size = CGSizeMake(40, 20);
    self.label.frame = CGRectMake((self.bounds.size.width - size.width)* 0.5, (self.bounds.size.height - size.height)* 0.5, size.width, size.height);
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [self drawCanvas1WithFrame:rect];
}

- (void)drawCanvas1WithFrame: (CGRect)frame;
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* shadowColor2 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.3];
    UIColor* color = [UIColor colorWithRed: 0.765 green: 0.765 blue: 0.765 alpha: 1.0 - self.opacity];
    
    //// Shadow Declarations
    UIColor* shadow = shadowColor2;
    CGSize shadowOffset = CGSizeMake(0.1, 2.1);
    CGFloat shadowBlurRadius = 2;
    
    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame) + 3, CGRectGetMinY(frame) + 3, 44, 44)];
    [color setFill];
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
}

- (void)setOpacity:(CGFloat)opacity{
    _opacity = opacity;
    _label.hidden = false;
    _label.text = [NSString stringWithFormat:@"%.0f",_opacity * 100];
    [_label alignTextHorizonCenterWithFontSize:[UIFont labelFontSize]];
    [self setNeedsDisplay];
}
@end
