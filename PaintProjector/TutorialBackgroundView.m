//
//  AnaDrawTutorialPageButtonView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 6/22/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "TutorialBackgroundView.h"

@implementation TutorialBackgroundView

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
    // Drawing code
    [self drawCanvas1WithFrame:rect];    
}

- (void)drawCanvas1WithFrame: (CGRect)frame;
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* gradientColorStart = [UIColor colorWithRed: 0.873 green: 0.873 blue: 0.873 alpha: 1];
    UIColor* gradientColorEnd = [UIColor colorWithRed: 0.931 green: 0.931 blue: 0.931 alpha: 1];
    UIColor* gradientColorMid = [UIColor colorWithRed: 0.971 green: 0.971 blue: 0.971 alpha: 1];
    
    //// Gradient Declarations
    CGFloat gradientLightGrayLocations[] = {0, 0, 0.02, 0.05, 0.1, 0.93, 0.96, 0.97, 0.99, 1};
    CGGradientRef gradientLightGray = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)gradientColorStart.CGColor, (id)[UIColor colorWithRed: 0.922 green: 0.922 blue: 0.922 alpha: 1].CGColor, (id)gradientColorMid.CGColor, (id)[UIColor colorWithRed: 0.951 green: 0.951 blue: 0.951 alpha: 1].CGColor, (id)gradientColorEnd.CGColor, (id)gradientColorEnd.CGColor, (id)[UIColor colorWithRed: 0.951 green: 0.951 blue: 0.951 alpha: 1].CGColor, (id)gradientColorMid.CGColor, (id)[UIColor colorWithRed: 0.922 green: 0.922 blue: 0.922 alpha: 1].CGColor, (id)gradientColorStart.CGColor], gradientLightGrayLocations);
    
    //// Rectangle Drawing
    CGRect rectangleRect = CGRectMake(CGRectGetMinX(frame) + 10, CGRectGetMinY(frame) + 10, CGRectGetWidth(frame) - 20, CGRectGetHeight(frame) - 20);
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRoundedRect: rectangleRect cornerRadius: 10];
    CGContextSaveGState(context);
    [rectanglePath addClip];
    CGContextDrawLinearGradient(context, gradientLightGray,
                                CGPointMake(CGRectGetMinX(rectangleRect), CGRectGetMidY(rectangleRect)),
                                CGPointMake(CGRectGetMaxX(rectangleRect), CGRectGetMidY(rectangleRect)),
                                0);
    CGContextRestoreGState(context);
    
    
    //// Cleanup
    CGGradientRelease(gradientLightGray);
    CGColorSpaceRelease(colorSpace);
}


@end
