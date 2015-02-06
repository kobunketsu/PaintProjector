//
//  RadiusSlider.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-4.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADRadiusSlider.h"

@implementation ADRadiusSlider

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
        NSString *path = [[NSBundle mainBundle]pathForResource:@"radiusSliderTracker" ofType:@"png"];
        UIImage *trackImage = [[UIImage imageWithContentsOfFile:path] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];

        [self setMinimumTrackImage:trackImage forState:UIControlStateNormal];
        [self setMaximumTrackImage:trackImage forState:UIControlStateNormal];
        
    }
    return self;
}

- (void)setValueByRadius:(CGFloat)radius{
    CGFloat valueRange = self.maximumValue - self.minimumValue;
    self.value = self.minimumValue + sqrtf(((radius - self.minimumValue) / valueRange)) * valueRange;
}

- (CGFloat)radiusByValue{
    CGFloat valueRange = self.maximumValue - self.minimumValue;
    CGFloat radius = self.minimumValue + powf(((self.value - self.minimumValue) / valueRange), 2) * valueRange;
    return radius;
}

//- (void)setValue:(float)value{
////    DebugLog(@"setValue %.1f", super.value);
//    
//    super.value = sqrtf((value / self.maximumValue)) * self.maximumValue;
//}

//- (CGFloat)value{
////    DebugLog(@"value %.1f", super.value);
//    return powf((super.value / self.maximumValue), 2) * self.maximumValue;
//}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect
{
    [self drawADRadiusSliderWithFrame:rect];
}
- (void)drawADRadiusSliderWithFrame: (CGRect)frame
{
    //// Color Declarations
    UIColor* cRadiusSliderBg = [UIColor colorWithRed: 0.129 green: 0.129 blue: 0.129 alpha: 1];
    UIColor* cRadiusSliderFg = [UIColor colorWithRed: 0.613 green: 0.613 blue: 0.613 alpha: 1];
    
    //// Group
    {
        //// Rounded Rectangle Drawing
        UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(CGRectGetMinX(frame) + 1, CGRectGetMinY(frame) + 5, 248, 20) cornerRadius: 10];
        [cRadiusSliderBg setFill];
        [roundedRectanglePath fill];
        
        
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
        [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 242.59, CGRectGetMinY(frame) + 5.68)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 242.87, CGRectGetMinY(frame) + 5.75) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 242.68, CGRectGetMinY(frame) + 5.7) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 242.87, CGRectGetMinY(frame) + 5.75)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 249, CGRectGetMinY(frame) + 14.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 246.55, CGRectGetMinY(frame) + 7.09) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 249, CGRectGetMinY(frame) + 10.59)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 249, CGRectGetMinY(frame) + 15) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 249, CGRectGetMinY(frame) + 15) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 249, CGRectGetMinY(frame) + 15)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 249, CGRectGetMinY(frame) + 15.5)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 242.87, CGRectGetMinY(frame) + 24.25) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 249, CGRectGetMinY(frame) + 19.41) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 246.55, CGRectGetMinY(frame) + 22.91)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 233.9, CGRectGetMinY(frame) + 25) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 240.5, CGRectGetMinY(frame) + 25) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 238.3, CGRectGetMinY(frame) + 25)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17.82, CGRectGetMinY(frame) + 25)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 7.86, CGRectGetMinY(frame) + 24.45) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 12.05, CGRectGetMinY(frame) + 25) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 9.76, CGRectGetMinY(frame) + 25)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 242.57, CGRectGetMinY(frame) + 5.67) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 43.11, CGRectGetMinY(frame) + 21.63) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 203.81, CGRectGetMinY(frame) + 8.78)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 242.59, CGRectGetMinY(frame) + 5.68)];
        [bezier2Path closePath];
        [cRadiusSliderFg setFill];
        [bezier2Path fill];
    }
}


@end
