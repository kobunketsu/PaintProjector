//
//  ADLaunchLogoView_pencil.m
//  PaintProjector
//
//  Created by kobunketsu on 9/19/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADLaunchLogoView_pencil.h"

@implementation ADLaunchLogoView_pencil

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
       [self initCustom];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [self initCustom];
    }
    return self;
}

- (void)initCustom{
    self.layer.shadowColor = [UIColor whiteColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 0);
    self.layer.shadowRadius = 100;
    self.layer.shadowOpacity  = 0.3;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [self drawCanvas1WithFrame_pencil:rect];
}


- (void)drawCanvas1WithFrame_pencil: (CGRect)frame_pencil;
{
    //// Color Declarations
    UIColor* pink = [UIColor colorWithRed: 1 green: 0.376 blue: 0.541 alpha: 1];
    UIColor* color3Bg = [UIColor colorWithRed: 0.78 green: 0.78 blue: 0.78 alpha: 1];
    UIColor* color4Bg = [UIColor colorWithRed: 1 green: 0.82 blue: 0 alpha: 1];
    UIColor* color5Bg = [UIColor colorWithRed: 1 green: 0.882 blue: 0.588 alpha: 1];
    UIColor* color6Bg = [UIColor colorWithRed: 0.247 green: 0.243 blue: 0.243 alpha: 1];
    
    //// Group
    {
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
        [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 114.83, CGRectGetMinY(frame_pencil) + 0.22)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 132.41, CGRectGetMinY(frame_pencil) + 6.86) controlPoint1: CGPointMake(CGRectGetMinX(frame_pencil) + 120.53, CGRectGetMinY(frame_pencil) + 1.17) controlPoint2: CGPointMake(CGRectGetMinX(frame_pencil) + 126.39, CGRectGetMinY(frame_pencil) + 3.39)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 145.02, CGRectGetMinY(frame_pencil) + 16.52) controlPoint1: CGPointMake(CGRectGetMinX(frame_pencil) + 137.54, CGRectGetMinY(frame_pencil) + 9.82) controlPoint2: CGPointMake(CGRectGetMinX(frame_pencil) + 141.74, CGRectGetMinY(frame_pencil) + 13.04)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 152.21, CGRectGetMinY(frame_pencil) + 26.77) controlPoint1: CGPointMake(CGRectGetMinX(frame_pencil) + 148.29, CGRectGetMinY(frame_pencil) + 20) controlPoint2: CGPointMake(CGRectGetMinX(frame_pencil) + 150.69, CGRectGetMinY(frame_pencil) + 23.41)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 154.82, CGRectGetMinY(frame_pencil) + 36.42) controlPoint1: CGPointMake(CGRectGetMinX(frame_pencil) + 153.74, CGRectGetMinY(frame_pencil) + 30.13) controlPoint2: CGPointMake(CGRectGetMinX(frame_pencil) + 154.6, CGRectGetMinY(frame_pencil) + 33.35)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 153.58, CGRectGetMinY(frame_pencil) + 46.37) controlPoint1: CGPointMake(CGRectGetMinX(frame_pencil) + 155.03, CGRectGetMinY(frame_pencil) + 39.49) controlPoint2: CGPointMake(CGRectGetMinX(frame_pencil) + 154.62, CGRectGetMinY(frame_pencil) + 42.81)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 148.52, CGRectGetMinY(frame_pencil) + 57.81) controlPoint1: CGPointMake(CGRectGetMinX(frame_pencil) + 152.55, CGRectGetMinY(frame_pencil) + 49.94) controlPoint2: CGPointMake(CGRectGetMinX(frame_pencil) + 150.86, CGRectGetMinY(frame_pencil) + 53.75)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 135, CGRectGetMinY(frame_pencil) + 82)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 67, CGRectGetMinY(frame_pencil) + 43)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 80.33, CGRectGetMinY(frame_pencil) + 19.91)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 88.19, CGRectGetMinY(frame_pencil) + 8.53) controlPoint1: CGPointMake(CGRectGetMinX(frame_pencil) + 83.34, CGRectGetMinY(frame_pencil) + 14.69) controlPoint2: CGPointMake(CGRectGetMinX(frame_pencil) + 85.96, CGRectGetMinY(frame_pencil) + 10.9)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 98.71, CGRectGetMinY(frame_pencil) + 1.49) controlPoint1: CGPointMake(CGRectGetMinX(frame_pencil) + 91.3, CGRectGetMinY(frame_pencil) + 5.2) controlPoint2: CGPointMake(CGRectGetMinX(frame_pencil) + 94.81, CGRectGetMinY(frame_pencil) + 2.86)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 114.83, CGRectGetMinY(frame_pencil) + 0.22) controlPoint1: CGPointMake(CGRectGetMinX(frame_pencil) + 103.76, CGRectGetMinY(frame_pencil) - 0.31) controlPoint2: CGPointMake(CGRectGetMinX(frame_pencil) + 109.13, CGRectGetMinY(frame_pencil) - 0.73)];
        [bezier2Path closePath];
        [pink setFill];
        [bezier2Path fill];
        
        
        //// Bezier Drawing
        UIBezierPath* bezierPath = UIBezierPath.bezierPath;
        [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 68, CGRectGetMinY(frame_pencil) + 42)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 48, CGRectGetMinY(frame_pencil) + 78)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 114, CGRectGetMinY(frame_pencil) + 117)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 135, CGRectGetMinY(frame_pencil) + 81)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 68, CGRectGetMinY(frame_pencil) + 42)];
        [bezierPath closePath];
        [color3Bg setFill];
        [bezierPath fill];
        
        
        //// Bezier 3 Drawing
        UIBezierPath* bezier3Path = UIBezierPath.bezierPath;
        [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 48, CGRectGetMinY(frame_pencil) + 77)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 115, CGRectGetMinY(frame_pencil) + 116)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 87, CGRectGetMinY(frame_pencil) + 164)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 42, CGRectGetMinY(frame_pencil) + 205)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 34, CGRectGetMinY(frame_pencil) + 201)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 47, CGRectGetMinY(frame_pencil) + 156)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 14, CGRectGetMinY(frame_pencil) + 189)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 7, CGRectGetMinY(frame_pencil) + 185)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 20, CGRectGetMinY(frame_pencil) + 126)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 48, CGRectGetMinY(frame_pencil) + 77)];
        [bezier3Path closePath];
        [color4Bg setFill];
        [bezier3Path fill];
        
        
        //// Bezier 4 Drawing
        UIBezierPath* bezier4Path = UIBezierPath.bezierPath;
        [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 3, CGRectGetMinY(frame_pencil) + 204)];
        [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 28, CGRectGetMinY(frame_pencil) + 218)];
        [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 42, CGRectGetMinY(frame_pencil) + 205)];
        [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 56, CGRectGetMinY(frame_pencil) + 149)];
        [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 49, CGRectGetMinY(frame_pencil) + 145)];
        [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 7, CGRectGetMinY(frame_pencil) + 185)];
        [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 3, CGRectGetMinY(frame_pencil) + 204)];
        [bezier4Path closePath];
        [color5Bg setFill];
        [bezier4Path fill];
        
        
        //// Bezier 5 Drawing
        UIBezierPath* bezier5Path = UIBezierPath.bezierPath;
        [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 3, CGRectGetMinY(frame_pencil) + 202)];
        [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_pencil) - 0.5, CGRectGetMinY(frame_pencil) + 233.5)];
        [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 4.5, CGRectGetMinY(frame_pencil) + 236.5)];
        [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 29, CGRectGetMinY(frame_pencil) + 217)];
        [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_pencil) + 3, CGRectGetMinY(frame_pencil) + 202)];
        [bezier5Path closePath];
        [color6Bg setFill];
        [bezier5Path fill];
    }
}


@end
