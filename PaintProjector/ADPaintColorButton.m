//
//  PaintColorButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-2.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADPaintColorButton.h"

@implementation ADPaintColorButton

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
        _color = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    }
    return self;
}


- (void)setColor:(UIColor *)newValue{
    _color = newValue;
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [self drawADPaintColorButtonWithFrame:rect]; 
}

- (void)drawADPaintColorButtonWithFrame: (CGRect)frame
{
    //// Color Declarations
    UIColor* cPaintColor = _color;
    
    //// Oval 2 Drawing
    UIBezierPath* oval2Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame) + 3, CGRectGetMinY(frame) + 3, 66, 66)];
    [cPaintColor setFill];
    [oval2Path fill];
}

@end
