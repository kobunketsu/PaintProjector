//
//  TutorialBackgroundRightEdgeView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 6/23/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADTutorialBackgroundRightEdgeView.h"

@implementation ADTutorialBackgroundRightEdgeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.opaque = false;        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [self drawCanvas1WithFrame:rect];
}

- (void)drawCanvas1WithFrame: (CGRect)frame;
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* gradientColorStart = [UIColor colorWithRed: 0.606 green: 0.606 blue: 0.606 alpha: 1];
    UIColor* gradientColorEnd = [UIColor colorWithRed: 0.505 green: 0.505 blue: 0.505 alpha: 0];
    
    //// Gradient Declarations
    CGFloat gradientLightGrayLocations[] = {0, 0.21, 1};
    CGGradientRef gradientLightGray = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)gradientColorStart.CGColor, (id)[UIColor colorWithRed: 0.556 green: 0.556 blue: 0.556 alpha: 0.5].CGColor, (id)gradientColorEnd.CGColor], gradientLightGrayLocations);
    
    
    //// Subframes
    CGRect group = CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + 10, 20, CGRectGetHeight(frame) - 20);
    
    
    //// Group
    {
        //// Rectangle Drawing
        CGRect rectangleRect = CGRectMake(CGRectGetMinX(group), CGRectGetMinY(group) + floor(CGRectGetHeight(group) * 0.00000 + 0.5), 20, floor(CGRectGetHeight(group) * 1.00000 + 0.5) - floor(CGRectGetHeight(group) * 0.00000 + 0.5));
        UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRoundedRect: rectangleRect byRoundingCorners: UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii: CGSizeMake(10, 10)];
        [rectanglePath closePath];
        CGContextSaveGState(context);
        [rectanglePath addClip];
        CGContextDrawLinearGradient(context, gradientLightGray,
                                    CGPointMake(CGRectGetMaxX(rectangleRect), CGRectGetMidY(rectangleRect)),
                                    CGPointMake(CGRectGetMinX(rectangleRect), CGRectGetMidY(rectangleRect)),
                                    0);
        CGContextRestoreGState(context);
    }
    
    
    //// Cleanup
    CGGradientRelease(gradientLightGray);
    CGColorSpaceRelease(colorSpace);
}



@end
