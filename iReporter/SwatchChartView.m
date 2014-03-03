//
//  SwatchChartView.m
//  PaintProjector
//
//  Created by kobunketsu on 14-3-1.
//  Copyright (c) 2014年 WenjiHu. All rights reserved.
//

#import "SwatchChartView.h"
#import "UIColor+String.h"

@implementation SwatchChartView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSwatchColors:(NSArray *)swatchColors{
    _swatchColors = swatchColors;
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{

    CGFloat startAngle = 0;
    CGRect ovalRect = self.bounds;
    // Drawing code
    for (NSString *colorStr in self.swatchColors) {
        CGFloat percent = [[[colorStr componentsSeparatedByString:@"%"]lastObject]floatValue];
        //// Color Declarations
        UIColor* fillColor = [UIColor colorWithString:colorStr];
        
        //// Abstracted Attributes
        CGFloat ovalStartAngle = startAngle;
        CGFloat ovalEndAngle = startAngle + percent / 100.0 * 360.0;
        startAngle = ovalEndAngle;
        
        
        //// Oval Drawing
        UIBezierPath* ovalPath = [UIBezierPath bezierPath];
        [ovalPath addArcWithCenter: CGPointMake(CGRectGetMidX(ovalRect), CGRectGetMidY(ovalRect)) radius: CGRectGetWidth(ovalRect) / 2 startAngle: ovalStartAngle * M_PI/180 endAngle: ovalEndAngle * M_PI/180 clockwise: YES];
        [ovalPath addLineToPoint: CGPointMake(CGRectGetMidX(ovalRect), CGRectGetMidY(ovalRect))];
        [ovalPath closePath];
        
        [fillColor setFill];
        [ovalPath fill];
    }
    
}


@end
