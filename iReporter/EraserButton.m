//
//  EraserButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-8.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "EraserButton.h"

@implementation EraserButton

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
    UIColor* color = [UIColor colorWithRed: 0.262 green: 0.378 blue: 0.591 alpha: 1];
    UIColor* head = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    CGFloat headHSBA[4];
    [head getHue: &headHSBA[0] saturation: &headHSBA[1] brightness: &headHSBA[2] alpha: &headHSBA[3]];
    
    UIColor* headSide = [UIColor colorWithHue: headHSBA[0] saturation: headHSBA[1] brightness: 0.8 alpha: headHSBA[3]];
    
    //// Rounded Rectangle 6 Drawing
    UIBezierPath* roundedRectangle6Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(17, 24, 25, 59) byRoundingCorners: UIRectCornerTopLeft cornerRadii: CGSizeMake(2, 2)];
    [color setFill];
    [roundedRectangle6Path fill];
    
    
    //// Rounded Rectangle 7 Drawing
    UIBezierPath* roundedRectangle7Path = [UIBezierPath bezierPath];
    [roundedRectangle7Path moveToPoint: CGPointMake(19.5, 22.5)];
    [roundedRectangle7Path addLineToPoint: CGPointMake(41.5, 22.5)];
    [roundedRectangle7Path addLineToPoint: CGPointMake(41.5, 4.5)];
    [roundedRectangle7Path addLineToPoint: CGPointMake(29.4, 4.5)];
    [roundedRectangle7Path addCurveToPoint: CGPointMake(19.5, 13.5) controlPoint1: CGPointMake(23.93, 4.5) controlPoint2: CGPointMake(19.5, 8.53)];
    [roundedRectangle7Path addLineToPoint: CGPointMake(19.5, 22.5)];
    [roundedRectangle7Path closePath];
    [head setFill];
    [roundedRectangle7Path fill];
    
    
    //// Rounded Rectangle 8 Drawing
    UIBezierPath* roundedRectangle8Path = [UIBezierPath bezierPathWithRect: CGRectMake(42, 24, 8, 59)];
    [headSide setFill];
    [roundedRectangle8Path fill];
    
    
    //// Rounded Rectangle 9 Drawing
    UIBezierPath* roundedRectangle9Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(42, 4, 8, 18) byRoundingCorners: UIRectCornerTopRight cornerRadii: CGSizeMake(4, 4)];
    [headSide setFill];
    [roundedRectangle9Path fill];
    
    
    
}


@end
