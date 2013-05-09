//
//  PencilButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-8.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "PencilButton.h"

@implementation PencilButton

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
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 0.285 green: 0.652 blue: 0.243 alpha: 1];
    CGFloat colorRGBA[4];
    [color getRed: &colorRGBA[0] green: &colorRGBA[1] blue: &colorRGBA[2] alpha: &colorRGBA[3]];
    
    UIColor* color4 = [UIColor colorWithRed: (colorRGBA[0] * 0.8 + 0.2) green: (colorRGBA[1] * 0.8 + 0.2) blue: (colorRGBA[2] * 0.8 + 0.2) alpha: (colorRGBA[3] * 0.8 + 0.2)];
    UIColor* color5 = [UIColor colorWithRed: (colorRGBA[0] * 0.4) green: (colorRGBA[1] * 0.4) blue: (colorRGBA[2] * 0.4) alpha: (colorRGBA[3] * 0.4 + 0.6)];
    UIColor* color6 = [UIColor colorWithRed: (colorRGBA[0] * 0.2 + 0.8) green: (colorRGBA[1] * 0.2 + 0.8) blue: (colorRGBA[2] * 0.2 + 0.8) alpha: (colorRGBA[3] * 0.2 + 0.8)];
    
    //// Rounded Rectangle Drawing
    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(26, 39.5, 11, 53) byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: CGSizeMake(4, 4)];
    [color setFill];
    [roundedRectanglePath fill];
    
    
    //// Rounded Rectangle 2 Drawing
    UIBezierPath* roundedRectangle2Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(37, 39.5, 7, 53) byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: CGSizeMake(3.5, 3.5)];
    [color4 setFill];
    [roundedRectangle2Path fill];
    
    
    //// Rounded Rectangle 3 Drawing
    UIBezierPath* roundedRectangle3Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(19, 39, 7, 53) byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: CGSizeMake(3.5, 3.5)];
    [color4 setFill];
    [roundedRectangle3Path fill];
    
    
    //// Bezier 5 Drawing
    UIBezierPath* bezier5Path = [UIBezierPath bezierPath];
    [bezier5Path moveToPoint: CGPointMake(42.94, 38.49)];
    [bezier5Path addCurveToPoint: CGPointMake(40.5, 37.5) controlPoint1: CGPointMake(42.31, 37.88) controlPoint2: CGPointMake(41.45, 37.5)];
    [bezier5Path addCurveToPoint: CGPointMake(37.44, 39.3) controlPoint1: CGPointMake(39.18, 37.5) controlPoint2: CGPointMake(38.04, 38.23)];
    [bezier5Path addCurveToPoint: CGPointMake(33, 37) controlPoint1: CGPointMake(36.48, 37.93) controlPoint2: CGPointMake(34.59, 37)];
    [bezier5Path addLineToPoint: CGPointMake(30, 37)];
    [bezier5Path addCurveToPoint: CGPointMake(25.71, 39.1) controlPoint1: CGPointMake(28.48, 37) controlPoint2: CGPointMake(26.68, 37.85)];
    [bezier5Path addCurveToPoint: CGPointMake(22.5, 37) controlPoint1: CGPointMake(25.17, 37.86) controlPoint2: CGPointMake(23.94, 37)];
    [bezier5Path addCurveToPoint: CGPointMake(19.08, 39.75) controlPoint1: CGPointMake(20.82, 37) controlPoint2: CGPointMake(19.42, 38.18)];
    [bezier5Path addLineToPoint: CGPointMake(19, 39.75)];
    [bezier5Path addLineToPoint: CGPointMake(26, 16.5)];
    [bezier5Path addLineToPoint: CGPointMake(35.65, 16.5)];
    [bezier5Path addLineToPoint: CGPointMake(42.94, 38.49)];
    [bezier5Path closePath];
    [color6 setFill];
    [bezier5Path fill];
    
    
    //// Bezier 2 Drawing
    UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
    [bezier2Path moveToPoint: CGPointMake(34.32, 14.5)];
    [bezier2Path addLineToPoint: CGPointMake(27, 14.5)];
    [bezier2Path addLineToPoint: CGPointMake(30.66, 3)];
    [bezier2Path addLineToPoint: CGPointMake(34.32, 14.5)];
    [bezier2Path closePath];
    [color5 setFill];
    [bezier2Path fill];    
}


@end
