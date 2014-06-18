//
//  TutorialIndicatorView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 6/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "TutorialIndicatorView.h"

@implementation TutorialIndicatorView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.opaque = false;
        self.arrowDirection = UIPopoverArrowDirectionUp;
        
    }
    return self;
}

- (void)layoutSubviews{
    DebugLogSystem(@"layoutSubviews");
    //重新设置label的位置
    CGRect frame = self.bounds;
    if (self.arrowDirection == UIPopoverArrowDirectionUp) {
        self.textLabel.frame = CGRectMake(CGRectGetMinX(frame) + 19, CGRectGetMinY(frame) + 29, CGRectGetWidth(frame) - 38, CGRectGetHeight(frame) - 42);
    }
    else if (self.arrowDirection == UIPopoverArrowDirectionDown) {
        self.textLabel.frame = CGRectMake(CGRectGetMinX(frame) + 19, CGRectGetMinY(frame) + 15, CGRectGetWidth(frame) - 38, CGRectGetHeight(frame) - 42);
        
    }
    else if (self.arrowDirection == UIPopoverArrowDirectionLeft) {
        self.textLabel.frame = CGRectMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 13, CGRectGetWidth(frame) - 52, CGRectGetHeight(frame) - 23);    }
    else if (self.arrowDirection == UIPopoverArrowDirectionRight) {
        self.textLabel.frame = CGRectMake(CGRectGetMinX(frame) + 19, CGRectGetMinY(frame) + 13, CGRectGetWidth(frame) - 52, CGRectGetHeight(frame) - 23);
    }

   
    //增加整体动画
    CGFloat swing = 20;
    frame = self.frame;
    if (self.arrowDirection == UIPopoverArrowDirectionUp) {
        frame.origin.y += swing;
    }
    else if (self.arrowDirection == UIPopoverArrowDirectionDown) {
        frame.origin.y -= swing;
    }
    else if (self.arrowDirection == UIPopoverArrowDirectionLeft) {
        frame.origin.x += swing;
    }
    else if (self.arrowDirection == UIPopoverArrowDirectionRight) {
        frame.origin.x -= swing;
    }

    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
        self.frame = frame;
    } completion:nil];
}

- (void)setArrowDirection:(UIPopoverArrowDirection)arrowDirection{
    _arrowDirection = arrowDirection;
    [self setNeedsLayout];
    
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    switch (self.arrowDirection) {
        case UIPopoverArrowDirectionUp:
            [self drawBubbleButtonWithFrameUp:self.bounds];
            break;
        case UIPopoverArrowDirectionDown:
            [self drawBubbleButtonWithFrameDown:self.bounds];
            break;
        case UIPopoverArrowDirectionLeft:
            [self drawBubbleButtonWithFrameLeft:self.bounds];
            break;
        case UIPopoverArrowDirectionRight:
            [self drawBubbleButtonWithFrameRight:self.bounds];
            break;
        default:
            break;
    }

}

- (void)drawBubbleButtonWithFrameUp: (CGRect)frame;
{
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 1 green: 0.642 blue: 0.099 alpha: 1];
    UIColor* backgroundColor = [UIColor colorWithRed: 1 green: 0.941 blue: 0.859 alpha: 1];
    
    
    //// Subframes
    CGRect frame2 = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 53) * 0.50246 + 0.5), CGRectGetMinY(frame), 53, 38);
    
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake(CGRectGetMaxX(frame) - 18.2, CGRectGetMaxY(frame) - 12.15)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 17.81, CGRectGetMaxY(frame) - 12.25)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 12.25, CGRectGetMaxY(frame) - 17.81) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 15.23, CGRectGetMaxY(frame) - 13.19) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 13.19, CGRectGetMaxY(frame) - 15.23)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 11.5, CGRectGetMaxY(frame) - 26.79) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 11.5, CGRectGetMaxY(frame) - 20.18) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 11.5, CGRectGetMaxY(frame) - 22.38)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 11.5, CGRectGetMinY(frame) + 41.79)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 12.15, CGRectGetMinY(frame) + 33.2) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 11.5, CGRectGetMinY(frame) + 37.38) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 11.5, CGRectGetMinY(frame) + 35.18)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 12.25, CGRectGetMinY(frame) + 32.81)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 17.81, CGRectGetMinY(frame) + 27.25) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 13.19, CGRectGetMinY(frame) + 30.23) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 15.23, CGRectGetMinY(frame) + 28.19)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 26.79, CGRectGetMinY(frame) + 26.5) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 20.18, CGRectGetMinY(frame) + 26.5) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 22.38, CGRectGetMinY(frame) + 26.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame2) + 40.37, CGRectGetMinY(frame2) + 26.5)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame2) + 26.37, CGRectGetMinY(frame2) + 12.5) controlPoint1: CGPointMake(CGRectGetMinX(frame2) + 33.47, CGRectGetMinY(frame2) + 19.6) controlPoint2: CGPointMake(CGRectGetMinX(frame2) + 26.37, CGRectGetMinY(frame2) + 12.5)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame2) + 12.37, CGRectGetMinY(frame2) + 26.5) controlPoint1: CGPointMake(CGRectGetMinX(frame2) + 26.37, CGRectGetMinY(frame2) + 12.5) controlPoint2: CGPointMake(CGRectGetMinX(frame2) + 19.27, CGRectGetMinY(frame2) + 19.6)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26.79, CGRectGetMinY(frame) + 26.5)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 18.2, CGRectGetMinY(frame) + 27.15) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 22.38, CGRectGetMinY(frame) + 26.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 20.18, CGRectGetMinY(frame) + 26.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17.81, CGRectGetMinY(frame) + 27.25)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 12.25, CGRectGetMinY(frame) + 32.81) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 15.23, CGRectGetMinY(frame) + 28.19) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 13.19, CGRectGetMinY(frame) + 30.23)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 11.5, CGRectGetMinY(frame) + 41.79) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 11.5, CGRectGetMinY(frame) + 35.18) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 11.5, CGRectGetMinY(frame) + 37.38)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 11.5, CGRectGetMaxY(frame) - 26.79)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 12.15, CGRectGetMaxY(frame) - 18.2) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 11.5, CGRectGetMaxY(frame) - 22.38) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 11.5, CGRectGetMaxY(frame) - 20.18)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 12.25, CGRectGetMaxY(frame) - 17.81)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 17.81, CGRectGetMaxY(frame) - 12.25) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 13.19, CGRectGetMaxY(frame) - 15.23) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 15.23, CGRectGetMaxY(frame) - 13.19)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 26.79, CGRectGetMaxY(frame) - 11.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 20.18, CGRectGetMaxY(frame) - 11.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 22.38, CGRectGetMaxY(frame) - 11.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 26.79, CGRectGetMaxY(frame) - 11.5)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 18.2, CGRectGetMaxY(frame) - 12.15) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 22.38, CGRectGetMaxY(frame) - 11.5) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 20.18, CGRectGetMaxY(frame) - 11.5)];
    [bezierPath closePath];
    [backgroundColor setFill];
    [bezierPath fill];
    [color setStroke];
    bezierPath.lineWidth = 3;
    [bezierPath stroke];
}


- (void)drawBubbleButtonWithFrameDown: (CGRect)frame;
{
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 1 green: 0.642 blue: 0.099 alpha: 1];
    UIColor* backgroundColor = [UIColor colorWithRed: 1 green: 0.941 blue: 0.859 alpha: 1];
    
    
    //// Subframes
    CGRect frame3 = CGRectMake(CGRectGetMinX(frame) + 19, CGRectGetMinY(frame) + 21, CGRectGetWidth(frame) - 38, CGRectGetHeight(frame) - 54);
    CGRect frame2 = CGRectMake(CGRectGetMinX(frame3) + floor((CGRectGetWidth(frame3) - 53) * 0.50303 + 0.5), CGRectGetMinY(frame3) + CGRectGetHeight(frame3) - 5, 53, 38);
    
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake(CGRectGetMaxX(frame) - 18.2, CGRectGetMinY(frame) + 13.15)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 17.81, CGRectGetMinY(frame) + 13.25)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 12.25, CGRectGetMinY(frame) + 18.81) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 15.23, CGRectGetMinY(frame) + 14.19) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 13.19, CGRectGetMinY(frame) + 16.23)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 11.5, CGRectGetMinY(frame) + 27.79) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 11.5, CGRectGetMinY(frame) + 21.18) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 11.5, CGRectGetMinY(frame) + 23.38)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 11.5, CGRectGetMaxY(frame) - 40.79)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 12.15, CGRectGetMaxY(frame) - 32.2) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 11.5, CGRectGetMaxY(frame) - 36.38) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 11.5, CGRectGetMaxY(frame) - 34.18)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 12.25, CGRectGetMaxY(frame) - 31.81)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 17.81, CGRectGetMaxY(frame) - 26.25) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 13.19, CGRectGetMaxY(frame) - 29.23) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 15.23, CGRectGetMaxY(frame) - 27.19)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 26.79, CGRectGetMaxY(frame) - 25.5) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 20.18, CGRectGetMaxY(frame) - 25.5) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 22.38, CGRectGetMaxY(frame) - 25.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame2) + 40.37, CGRectGetMaxY(frame2) - 25.5)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame2) + 26.37, CGRectGetMaxY(frame2) - 11.5) controlPoint1: CGPointMake(CGRectGetMinX(frame2) + 33.47, CGRectGetMaxY(frame2) - 18.6) controlPoint2: CGPointMake(CGRectGetMinX(frame2) + 26.37, CGRectGetMaxY(frame2) - 11.5)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame2) + 12.37, CGRectGetMaxY(frame2) - 25.5) controlPoint1: CGPointMake(CGRectGetMinX(frame2) + 26.37, CGRectGetMaxY(frame2) - 11.5) controlPoint2: CGPointMake(CGRectGetMinX(frame2) + 19.27, CGRectGetMaxY(frame2) - 18.6)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26.79, CGRectGetMaxY(frame) - 25.5)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 18.2, CGRectGetMaxY(frame) - 26.15) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 22.38, CGRectGetMaxY(frame) - 25.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 20.18, CGRectGetMaxY(frame) - 25.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17.81, CGRectGetMaxY(frame) - 26.25)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 12.25, CGRectGetMaxY(frame) - 31.81) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 15.23, CGRectGetMaxY(frame) - 27.19) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 13.19, CGRectGetMaxY(frame) - 29.23)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 11.5, CGRectGetMaxY(frame) - 40.79) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 11.5, CGRectGetMaxY(frame) - 34.18) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 11.5, CGRectGetMaxY(frame) - 36.38)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 11.5, CGRectGetMinY(frame) + 27.79)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 12.15, CGRectGetMinY(frame) + 19.2) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 11.5, CGRectGetMinY(frame) + 23.38) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 11.5, CGRectGetMinY(frame) + 21.18)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 12.25, CGRectGetMinY(frame) + 18.81)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 17.81, CGRectGetMinY(frame) + 13.25) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 13.19, CGRectGetMinY(frame) + 16.23) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 15.23, CGRectGetMinY(frame) + 14.19)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 26.79, CGRectGetMinY(frame) + 12.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 20.18, CGRectGetMinY(frame) + 12.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 22.38, CGRectGetMinY(frame) + 12.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 26.79, CGRectGetMinY(frame) + 12.5)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 18.2, CGRectGetMinY(frame) + 13.15) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 22.38, CGRectGetMinY(frame) + 12.5) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 20.18, CGRectGetMinY(frame) + 12.5)];
    [bezierPath closePath];
    [backgroundColor setFill];
    [bezierPath fill];
    [color setStroke];
    bezierPath.lineWidth = 3;
    [bezierPath stroke];
}

- (void)drawBubbleButtonWithFrameLeft: (CGRect)frame;
{
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 1 green: 0.642 blue: 0.099 alpha: 1];
    UIColor* backgroundColor = [UIColor colorWithRed: 1 green: 0.941 blue: 0.859 alpha: 1];
    
    
    //// Subframes
    CGRect frame3 = CGRectMake(CGRectGetMinX(frame) + floor(CGRectGetWidth(frame) * 0.09375 + 0.5), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.07031 + 0.5), floor(CGRectGetWidth(frame) * 0.96484 + 0.5) - floor(CGRectGetWidth(frame) * 0.09375 + 0.5), floor(CGRectGetHeight(frame) * 0.94531 + 0.5) - floor(CGRectGetHeight(frame) * 0.07031 + 0.5));
    CGRect frame2 = CGRectMake(CGRectGetMinX(frame3) - 24, CGRectGetMinY(frame3) + floor((CGRectGetHeight(frame3) - 38) * 0.50000 + 0.5), 27, 38);
    
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake(CGRectGetMaxX(frame3) - 2.15, CGRectGetMinY(frame3) + 8.2)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame3) - 2.25, CGRectGetMinY(frame3) + 7.81)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame3) - 7.81, CGRectGetMinY(frame3) + 2.25) controlPoint1: CGPointMake(CGRectGetMaxX(frame3) - 3.19, CGRectGetMinY(frame3) + 5.23) controlPoint2: CGPointMake(CGRectGetMaxX(frame3) - 5.23, CGRectGetMinY(frame3) + 3.19)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame3) - 16.79, CGRectGetMinY(frame3) + 1.5) controlPoint1: CGPointMake(CGRectGetMaxX(frame3) - 10.18, CGRectGetMinY(frame3) + 1.5) controlPoint2: CGPointMake(CGRectGetMaxX(frame3) - 12.38, CGRectGetMinY(frame3) + 1.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame3) + 16.79, CGRectGetMinY(frame3) + 1.5)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame3) + 8.2, CGRectGetMinY(frame3) + 2.15) controlPoint1: CGPointMake(CGRectGetMinX(frame3) + 12.38, CGRectGetMinY(frame3) + 1.5) controlPoint2: CGPointMake(CGRectGetMinX(frame3) + 10.18, CGRectGetMinY(frame3) + 1.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame3) + 7.81, CGRectGetMinY(frame3) + 2.25)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame3) + 2.25, CGRectGetMinY(frame3) + 7.81) controlPoint1: CGPointMake(CGRectGetMinX(frame3) + 5.23, CGRectGetMinY(frame3) + 3.19) controlPoint2: CGPointMake(CGRectGetMinX(frame3) + 3.19, CGRectGetMinY(frame3) + 5.23)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame3) + 1.5, CGRectGetMinY(frame3) + 16.79) controlPoint1: CGPointMake(CGRectGetMinX(frame3) + 1.5, CGRectGetMinY(frame3) + 10.18) controlPoint2: CGPointMake(CGRectGetMinX(frame3) + 1.5, CGRectGetMinY(frame3) + 12.38)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame2) + 25.5, CGRectGetMinY(frame2) + 4.63)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame2) + 11.5, CGRectGetMinY(frame2) + 18.63) controlPoint1: CGPointMake(CGRectGetMinX(frame2) + 18.6, CGRectGetMinY(frame2) + 11.53) controlPoint2: CGPointMake(CGRectGetMinX(frame2) + 11.5, CGRectGetMinY(frame2) + 18.63)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame2) + 25.5, CGRectGetMinY(frame2) + 32.63) controlPoint1: CGPointMake(CGRectGetMinX(frame2) + 11.5, CGRectGetMinY(frame2) + 18.63) controlPoint2: CGPointMake(CGRectGetMinX(frame2) + 18.6, CGRectGetMinY(frame2) + 25.73)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame3) + 1.5, CGRectGetMaxY(frame3) - 16.79)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame3) + 2.15, CGRectGetMaxY(frame3) - 8.2) controlPoint1: CGPointMake(CGRectGetMinX(frame3) + 1.5, CGRectGetMaxY(frame3) - 12.38) controlPoint2: CGPointMake(CGRectGetMinX(frame3) + 1.5, CGRectGetMaxY(frame3) - 10.18)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame3) + 2.25, CGRectGetMaxY(frame3) - 7.81)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame3) + 7.81, CGRectGetMaxY(frame3) - 2.25) controlPoint1: CGPointMake(CGRectGetMinX(frame3) + 3.19, CGRectGetMaxY(frame3) - 5.23) controlPoint2: CGPointMake(CGRectGetMinX(frame3) + 5.23, CGRectGetMaxY(frame3) - 3.19)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame3) + 16.79, CGRectGetMaxY(frame3) - 1.5) controlPoint1: CGPointMake(CGRectGetMinX(frame3) + 10.18, CGRectGetMaxY(frame3) - 1.5) controlPoint2: CGPointMake(CGRectGetMinX(frame3) + 12.38, CGRectGetMaxY(frame3) - 1.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame3) - 16.79, CGRectGetMaxY(frame3) - 1.5)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame3) - 8.2, CGRectGetMaxY(frame3) - 2.15) controlPoint1: CGPointMake(CGRectGetMaxX(frame3) - 12.38, CGRectGetMaxY(frame3) - 1.5) controlPoint2: CGPointMake(CGRectGetMaxX(frame3) - 10.18, CGRectGetMaxY(frame3) - 1.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame3) - 7.81, CGRectGetMaxY(frame3) - 2.25)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame3) - 2.25, CGRectGetMaxY(frame3) - 7.81) controlPoint1: CGPointMake(CGRectGetMaxX(frame3) - 5.23, CGRectGetMaxY(frame3) - 3.19) controlPoint2: CGPointMake(CGRectGetMaxX(frame3) - 3.19, CGRectGetMaxY(frame3) - 5.23)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame3) - 1.5, CGRectGetMaxY(frame3) - 16.79) controlPoint1: CGPointMake(CGRectGetMaxX(frame3) - 1.5, CGRectGetMaxY(frame3) - 10.18) controlPoint2: CGPointMake(CGRectGetMaxX(frame3) - 1.5, CGRectGetMaxY(frame3) - 12.38)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame3) - 1.5, CGRectGetMinY(frame3) + 16.79)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame3) - 2.15, CGRectGetMinY(frame3) + 8.2) controlPoint1: CGPointMake(CGRectGetMaxX(frame3) - 1.5, CGRectGetMinY(frame3) + 12.38) controlPoint2: CGPointMake(CGRectGetMaxX(frame3) - 1.5, CGRectGetMinY(frame3) + 10.18)];
    [bezierPath closePath];
    [backgroundColor setFill];
    [bezierPath fill];
    [color setStroke];
    bezierPath.lineWidth = 3;
    [bezierPath stroke];
}

- (void)drawBubbleButtonWithFrameRight: (CGRect)frame;
{
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 1 green: 0.642 blue: 0.099 alpha: 1];
    UIColor* backgroundColor = [UIColor colorWithRed: 1 green: 0.941 blue: 0.859 alpha: 1];
    
    
    //// Subframes
    CGRect frame3 = CGRectMake(CGRectGetMinX(frame) + floor(CGRectGetWidth(frame) * 0.03906 + 0.5), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.07031 + 0.5), floor(CGRectGetWidth(frame) * 0.91016 + 0.5) - floor(CGRectGetWidth(frame) * 0.03906 + 0.5), floor(CGRectGetHeight(frame) * 0.94531 + 0.5) - floor(CGRectGetHeight(frame) * 0.07031 + 0.5));
    CGRect frame2 = CGRectMake(CGRectGetMinX(frame3) + CGRectGetWidth(frame3) - 4, CGRectGetMinY(frame3) + floor((CGRectGetHeight(frame3) - 38) * 0.50000 + 0.5), 27, 38);
    
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame3) + 2.15, CGRectGetMinY(frame3) + 8.2)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame3) + 2.25, CGRectGetMinY(frame3) + 7.81)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame3) + 7.81, CGRectGetMinY(frame3) + 2.25) controlPoint1: CGPointMake(CGRectGetMinX(frame3) + 3.19, CGRectGetMinY(frame3) + 5.23) controlPoint2: CGPointMake(CGRectGetMinX(frame3) + 5.23, CGRectGetMinY(frame3) + 3.19)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame3) + 16.79, CGRectGetMinY(frame3) + 1.5) controlPoint1: CGPointMake(CGRectGetMinX(frame3) + 10.18, CGRectGetMinY(frame3) + 1.5) controlPoint2: CGPointMake(CGRectGetMinX(frame3) + 12.38, CGRectGetMinY(frame3) + 1.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame3) - 16.79, CGRectGetMinY(frame3) + 1.5)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame3) - 8.2, CGRectGetMinY(frame3) + 2.15) controlPoint1: CGPointMake(CGRectGetMaxX(frame3) - 12.38, CGRectGetMinY(frame3) + 1.5) controlPoint2: CGPointMake(CGRectGetMaxX(frame3) - 10.18, CGRectGetMinY(frame3) + 1.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame3) - 7.81, CGRectGetMinY(frame3) + 2.25)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame3) - 2.25, CGRectGetMinY(frame3) + 7.81) controlPoint1: CGPointMake(CGRectGetMaxX(frame3) - 5.23, CGRectGetMinY(frame3) + 3.19) controlPoint2: CGPointMake(CGRectGetMaxX(frame3) - 3.19, CGRectGetMinY(frame3) + 5.23)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame3) - 1.5, CGRectGetMinY(frame3) + 16.79) controlPoint1: CGPointMake(CGRectGetMaxX(frame3) - 1.5, CGRectGetMinY(frame3) + 10.18) controlPoint2: CGPointMake(CGRectGetMaxX(frame3) - 1.5, CGRectGetMinY(frame3) + 12.38)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame2) - 24.5, CGRectGetMinY(frame2) + 4.63)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame2) - 10.5, CGRectGetMinY(frame2) + 18.63) controlPoint1: CGPointMake(CGRectGetMaxX(frame2) - 17.6, CGRectGetMinY(frame2) + 11.53) controlPoint2: CGPointMake(CGRectGetMaxX(frame2) - 10.5, CGRectGetMinY(frame2) + 18.63)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame2) - 24.5, CGRectGetMinY(frame2) + 32.63) controlPoint1: CGPointMake(CGRectGetMaxX(frame2) - 10.5, CGRectGetMinY(frame2) + 18.63) controlPoint2: CGPointMake(CGRectGetMaxX(frame2) - 17.6, CGRectGetMinY(frame2) + 25.73)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame3) - 1.5, CGRectGetMaxY(frame3) - 16.79)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame3) - 2.15, CGRectGetMaxY(frame3) - 8.2) controlPoint1: CGPointMake(CGRectGetMaxX(frame3) - 1.5, CGRectGetMaxY(frame3) - 12.38) controlPoint2: CGPointMake(CGRectGetMaxX(frame3) - 1.5, CGRectGetMaxY(frame3) - 10.18)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame3) - 2.25, CGRectGetMaxY(frame3) - 7.81)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame3) - 7.81, CGRectGetMaxY(frame3) - 2.25) controlPoint1: CGPointMake(CGRectGetMaxX(frame3) - 3.19, CGRectGetMaxY(frame3) - 5.23) controlPoint2: CGPointMake(CGRectGetMaxX(frame3) - 5.23, CGRectGetMaxY(frame3) - 3.19)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame3) - 16.79, CGRectGetMaxY(frame3) - 1.5) controlPoint1: CGPointMake(CGRectGetMaxX(frame3) - 10.18, CGRectGetMaxY(frame3) - 1.5) controlPoint2: CGPointMake(CGRectGetMaxX(frame3) - 12.38, CGRectGetMaxY(frame3) - 1.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame3) + 16.79, CGRectGetMaxY(frame3) - 1.5)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame3) + 8.2, CGRectGetMaxY(frame3) - 2.15) controlPoint1: CGPointMake(CGRectGetMinX(frame3) + 12.38, CGRectGetMaxY(frame3) - 1.5) controlPoint2: CGPointMake(CGRectGetMinX(frame3) + 10.18, CGRectGetMaxY(frame3) - 1.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame3) + 7.81, CGRectGetMaxY(frame3) - 2.25)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame3) + 2.25, CGRectGetMaxY(frame3) - 7.81) controlPoint1: CGPointMake(CGRectGetMinX(frame3) + 5.23, CGRectGetMaxY(frame3) - 3.19) controlPoint2: CGPointMake(CGRectGetMinX(frame3) + 3.19, CGRectGetMaxY(frame3) - 5.23)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame3) + 1.5, CGRectGetMaxY(frame3) - 16.79) controlPoint1: CGPointMake(CGRectGetMinX(frame3) + 1.5, CGRectGetMaxY(frame3) - 10.18) controlPoint2: CGPointMake(CGRectGetMinX(frame3) + 1.5, CGRectGetMaxY(frame3) - 12.38)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame3) + 1.5, CGRectGetMinY(frame3) + 16.79)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame3) + 2.15, CGRectGetMinY(frame3) + 8.2) controlPoint1: CGPointMake(CGRectGetMinX(frame3) + 1.5, CGRectGetMinY(frame3) + 12.38) controlPoint2: CGPointMake(CGRectGetMinX(frame3) + 1.5, CGRectGetMinY(frame3) + 10.18)];
    [bezierPath closePath];
    [backgroundColor setFill];
    [bezierPath fill];
    [color setStroke];
    bezierPath.lineWidth = 3;
    [bezierPath stroke];
}

@end
