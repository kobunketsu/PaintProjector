//
//  TutorialIndicatorView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 6/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADTutorialIndicatorView.h"
#define TargetViewFrameOffset 10
#define TargetViewInsetPlusTriangleWidth 26

@implementation ADTutorialIndicatorView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.opaque = false;
        self.arrowDirection = UIPopoverArrowDirectionUp;
//        self.targetFrame = CGRectZero;
    }
    return self;
}

- (void)layoutSubviews{
    DebugLogSystem(@"layoutSubviews");
    //通过计算字长宽重新设置label位置
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
    
    [self.textLabel alignTextHorizonCenterWithFontSize:[UIFont labelFontSize]];

 
    //增加整体动画
    //保存源frame，在EnterBackgroundh后退出动画时归位
    CGRect srcframe = self.frame;
    CGRect destframe = self.frame;
    
    CGFloat swing = 20;
    if (self.arrowDirection == UIPopoverArrowDirectionUp) {
        destframe.origin.y += swing;
    }
    else if (self.arrowDirection == UIPopoverArrowDirectionDown) {
        destframe.origin.y -= swing;
    }
    else if (self.arrowDirection == UIPopoverArrowDirectionLeft) {
        destframe.origin.x += swing;
    }
    else if (self.arrowDirection == UIPopoverArrowDirectionRight) {
        destframe.origin.x -= swing;
    }

    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
        self.frame = destframe;
    } completion:^(BOOL finished) {
        self.frame = srcframe;
    }];
    
    if (self.layoutCompletionBlock) {
        self.layoutCompletionBlock();
    }
}

- (void)setArrowDirection:(UIPopoverArrowDirection)arrowDirection{
    _arrowDirection = arrowDirection;
    [self setNeedsLayout];
    
}

- (void)targetViewFrame:(CGRect)frame inRootView:(UIView*)rootView{
 
    CGRect finalFrame = self.frame;
    if (self.arrowDirection == UIPopoverArrowDirectionUp) {
        finalFrame.origin.x = frame.origin.x + frame.size.width * 0.5 - self.bounds.size.width * 0.5;
        finalFrame.origin.y = frame.origin.y + frame.size.height - TargetViewFrameOffset;
        self.targetPoint = CGPointMake(frame.origin.x + frame.size.width * 0.5, frame.origin.y + frame.size.height);
    }
    else if (self.arrowDirection == UIPopoverArrowDirectionDown) {
        finalFrame.origin.x = frame.origin.x + frame.size.width * 0.5 - self.bounds.size.width * 0.5;
        finalFrame.origin.y = frame.origin.y - self.bounds.size.height + TargetViewFrameOffset;
        self.targetPoint = CGPointMake(frame.origin.x + frame.size.width * 0.5, frame.origin.y);
    }
    else if (self.arrowDirection == UIPopoverArrowDirectionLeft) {
        finalFrame.origin.x = frame.origin.x + frame.size.width - TargetViewFrameOffset;
        finalFrame.origin.y = frame.origin.y + frame.size.height * 0.5 - self.bounds.size.height * 0.5;
        self.targetPoint = CGPointMake(frame.origin.x + frame.size.width, frame.origin.y + frame.size.height * 0.5);
    }
    else if (self.arrowDirection == UIPopoverArrowDirectionRight) {
        finalFrame.origin.x = frame.origin.x - self.bounds.size.width + TargetViewFrameOffset;
        finalFrame.origin.y = frame.origin.y + frame.size.height * 0.5 - self.bounds.size.height * 0.5;
        self.targetPoint = CGPointMake(frame.origin.x, frame.origin.y + frame.size.height * 0.5);
    }
    
    self.frame = finalFrame;
    
    [self adjustInRect:rootView.frame];
}

- (void)targetView:(UIView *)targetView inRootView:(UIView*)rootView{
    CGRect frame = [targetView convertRect:targetView.bounds toView:rootView];
    [self targetViewFrame:frame inRootView:rootView];
}

#pragma mark- Draw
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGFloat offsetPercent = 0;
    // Drawing code
    switch (self.arrowDirection) {
        case UIPopoverArrowDirectionUp:
            offsetPercent = (self.targetPoint.x - (self.frame.origin.x + TargetViewInsetPlusTriangleWidth)) / (self.frame.size.width - TargetViewInsetPlusTriangleWidth * 2);
            [self drawBubbleButtonWithFrameUp:self.bounds offsetPercent:offsetPercent];
            break;
        case UIPopoverArrowDirectionDown:
            offsetPercent = (self.targetPoint.x - (self.frame.origin.x + TargetViewInsetPlusTriangleWidth)) / (self.frame.size.width - TargetViewInsetPlusTriangleWidth * 2);
            [self drawBubbleButtonWithFrameDown:self.bounds offsetPercent:offsetPercent];
            break;
        case UIPopoverArrowDirectionLeft:
            offsetPercent = (self.targetPoint.y - (self.frame.origin.y + TargetViewInsetPlusTriangleWidth)) / (self.frame.size.height - TargetViewInsetPlusTriangleWidth * 2);
            [self drawBubbleButtonWithFrameLeft:self.bounds offsetPercent:offsetPercent];
            break;
        case UIPopoverArrowDirectionRight:
            offsetPercent = (self.targetPoint.y - (self.frame.origin.y + TargetViewInsetPlusTriangleWidth)) / (self.frame.size.height - TargetViewInsetPlusTriangleWidth * 2);
            [self drawBubbleButtonWithFrameRight:self.bounds offsetPercent:offsetPercent];
            break;
        default:
            break;
    }

}

- (void)drawBubbleButtonWithFrameUp: (CGRect)frame offsetPercent:(CGFloat)percent;
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    //// Subframes
    CGRect frame2 = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 53) * percent + 0.5), CGRectGetMinY(frame), 53, 38);
    
    
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
    CGContextSaveGState(context);
    [bezierPath addClip];
    CGRect bezierBounds = CGPathGetPathBoundingBox(bezierPath.CGPath);
    CGContextDrawLinearGradient(context, ADBarStyleKit.gradientLightGrayPink.CGGradient,
                                CGPointMake(CGRectGetMidX(bezierBounds), CGRectGetMaxY(bezierBounds)),
                                CGPointMake(CGRectGetMidX(bezierBounds), CGRectGetMinY(bezierBounds)),
                                0);
    CGContextRestoreGState(context);
    [ADBarStyleKit.colorEdge setStroke];
    bezierPath.lineWidth = 3;
    [bezierPath stroke];
}


- (void)drawBubbleButtonWithFrameDown:(CGRect)frame offsetPercent:(CGFloat)percent
{

    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 1 green: 0.943 blue: 0.961 alpha: 1];
    
    
    //// Subframes
    CGRect frame2 = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 53) * percent + 0.5), CGRectGetMinY(frame) + CGRectGetHeight(frame) - 38, 53, 38);
    
    
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
    CGContextSaveGState(context);
    [bezierPath addClip];
    CGRect bezierBounds = CGPathGetPathBoundingBox(bezierPath.CGPath);
    CGContextDrawLinearGradient(context, ADBarStyleKit.gradientLightGrayPink.CGGradient,
                                CGPointMake(CGRectGetMidX(bezierBounds), CGRectGetMinY(bezierBounds)),
                                CGPointMake(CGRectGetMidX(bezierBounds), CGRectGetMaxY(bezierBounds)),
                                0);
    CGContextRestoreGState(context);
    [color setStroke];
    bezierPath.lineWidth = 3;
    [bezierPath stroke];
}


- (void)drawBubbleButtonWithFrameLeft: (CGRect)frame offsetPercent:(CGFloat)percent;
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    //// Subframes
    CGRect frame2 = CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 38) * percent + 0.5), 27, 38);
    
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake(CGRectGetMaxX(frame) - 11.15, CGRectGetMinY(frame) + 17.2)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 11.25, CGRectGetMinY(frame) + 16.81)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 16.81, CGRectGetMinY(frame) + 11.25) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 12.19, CGRectGetMinY(frame) + 14.23) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 14.23, CGRectGetMinY(frame) + 12.19)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 25.79, CGRectGetMinY(frame) + 10.5) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 19.18, CGRectGetMinY(frame) + 10.5) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 21.38, CGRectGetMinY(frame) + 10.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 40.79, CGRectGetMinY(frame) + 10.5)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 32.2, CGRectGetMinY(frame) + 11.15) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 36.38, CGRectGetMinY(frame) + 10.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 34.18, CGRectGetMinY(frame) + 10.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 31.81, CGRectGetMinY(frame) + 11.25)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 26.25, CGRectGetMinY(frame) + 16.81) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 29.23, CGRectGetMinY(frame) + 12.19) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 27.19, CGRectGetMinY(frame) + 14.23)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 25.5, CGRectGetMinY(frame) + 25.79) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 25.5, CGRectGetMinY(frame) + 19.18) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 25.5, CGRectGetMinY(frame) + 21.38)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame2) + 25.5, CGRectGetMinY(frame2) + 4.63)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame2) + 11.5, CGRectGetMinY(frame2) + 18.63) controlPoint1: CGPointMake(CGRectGetMinX(frame2) + 18.6, CGRectGetMinY(frame2) + 11.53) controlPoint2: CGPointMake(CGRectGetMinX(frame2) + 11.5, CGRectGetMinY(frame2) + 18.63)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame2) + 25.5, CGRectGetMinY(frame2) + 32.63) controlPoint1: CGPointMake(CGRectGetMinX(frame2) + 11.5, CGRectGetMinY(frame2) + 18.63) controlPoint2: CGPointMake(CGRectGetMinX(frame2) + 18.6, CGRectGetMinY(frame2) + 25.73)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 25.5, CGRectGetMaxY(frame) - 23.79)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 26.15, CGRectGetMaxY(frame) - 15.2) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 25.5, CGRectGetMaxY(frame) - 19.38) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 25.5, CGRectGetMaxY(frame) - 17.18)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26.25, CGRectGetMaxY(frame) - 14.81)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 31.81, CGRectGetMaxY(frame) - 9.25) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 27.19, CGRectGetMaxY(frame) - 12.23) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 29.23, CGRectGetMaxY(frame) - 10.19)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 40.79, CGRectGetMaxY(frame) - 8.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 34.18, CGRectGetMaxY(frame) - 8.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 36.38, CGRectGetMaxY(frame) - 8.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 25.79, CGRectGetMaxY(frame) - 8.5)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 17.2, CGRectGetMaxY(frame) - 9.15) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 21.38, CGRectGetMaxY(frame) - 8.5) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 19.18, CGRectGetMaxY(frame) - 8.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 16.81, CGRectGetMaxY(frame) - 9.25)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 11.25, CGRectGetMaxY(frame) - 14.81) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 14.23, CGRectGetMaxY(frame) - 10.19) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 12.19, CGRectGetMaxY(frame) - 12.23)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 10.5, CGRectGetMaxY(frame) - 23.79) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 10.5, CGRectGetMaxY(frame) - 17.18) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 10.5, CGRectGetMaxY(frame) - 19.38)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 10.5, CGRectGetMinY(frame) + 25.79)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 11.15, CGRectGetMinY(frame) + 17.2) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 10.5, CGRectGetMinY(frame) + 21.38) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 10.5, CGRectGetMinY(frame) + 19.18)];
    [bezierPath closePath];
    CGContextSaveGState(context);
    [bezierPath addClip];
    CGRect bezierBounds = CGPathGetPathBoundingBox(bezierPath.CGPath);
    CGContextDrawLinearGradient(context, ADBarStyleKit.gradientLightGrayPink.CGGradient,
                                CGPointMake(CGRectGetMidX(bezierBounds), CGRectGetMaxY(bezierBounds)),
                                CGPointMake(CGRectGetMidX(bezierBounds), CGRectGetMinY(bezierBounds)),
                                0);
    CGContextRestoreGState(context);
    [ADBarStyleKit.colorEdge setStroke];
    bezierPath.lineWidth = 3;
    [bezierPath stroke];
}



- (void)drawBubbleButtonWithFrameRight: (CGRect)frame offsetPercent:(CGFloat)percent;
{

    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    //// Subframes
    CGRect frame2 = CGRectMake(CGRectGetMinX(frame) + CGRectGetWidth(frame) - 27, CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 38) * percent + 0.5), 27, 38);
    
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 12.15, CGRectGetMinY(frame) + 17.2)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 12.25, CGRectGetMinY(frame) + 16.81)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 17.81, CGRectGetMinY(frame) + 11.25) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 13.19, CGRectGetMinY(frame) + 14.23) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 15.23, CGRectGetMinY(frame) + 12.19)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 26.79, CGRectGetMinY(frame) + 10.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 20.18, CGRectGetMinY(frame) + 10.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 22.38, CGRectGetMinY(frame) + 10.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 39.79, CGRectGetMinY(frame) + 10.5)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 31.2, CGRectGetMinY(frame) + 11.15) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 35.38, CGRectGetMinY(frame) + 10.5) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 33.18, CGRectGetMinY(frame) + 10.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 30.81, CGRectGetMinY(frame) + 11.25)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 25.25, CGRectGetMinY(frame) + 16.81) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 28.23, CGRectGetMinY(frame) + 12.19) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 26.19, CGRectGetMinY(frame) + 14.23)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 24.5, CGRectGetMinY(frame) + 25.79) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 24.5, CGRectGetMinY(frame) + 19.18) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 24.5, CGRectGetMinY(frame) + 21.38)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame2) - 24.5, CGRectGetMinY(frame2) + 4.63)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame2) - 10.5, CGRectGetMinY(frame2) + 18.63) controlPoint1: CGPointMake(CGRectGetMaxX(frame2) - 17.6, CGRectGetMinY(frame2) + 11.53) controlPoint2: CGPointMake(CGRectGetMaxX(frame2) - 10.5, CGRectGetMinY(frame2) + 18.63)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame2) - 24.5, CGRectGetMinY(frame2) + 32.63) controlPoint1: CGPointMake(CGRectGetMaxX(frame2) - 10.5, CGRectGetMinY(frame2) + 18.63) controlPoint2: CGPointMake(CGRectGetMaxX(frame2) - 17.6, CGRectGetMinY(frame2) + 25.73)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 24.5, CGRectGetMaxY(frame) - 23.79)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 25.15, CGRectGetMaxY(frame) - 15.2) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 24.5, CGRectGetMaxY(frame) - 19.38) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 24.5, CGRectGetMaxY(frame) - 17.18)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 25.25, CGRectGetMaxY(frame) - 14.81)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 30.81, CGRectGetMaxY(frame) - 9.25) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 26.19, CGRectGetMaxY(frame) - 12.23) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 28.23, CGRectGetMaxY(frame) - 10.19)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 39.79, CGRectGetMaxY(frame) - 8.5) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 33.18, CGRectGetMaxY(frame) - 8.5) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 35.38, CGRectGetMaxY(frame) - 8.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26.79, CGRectGetMaxY(frame) - 8.5)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 18.2, CGRectGetMaxY(frame) - 9.15) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 22.38, CGRectGetMaxY(frame) - 8.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 20.18, CGRectGetMaxY(frame) - 8.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17.81, CGRectGetMaxY(frame) - 9.25)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 12.25, CGRectGetMaxY(frame) - 14.81) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 15.23, CGRectGetMaxY(frame) - 10.19) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 13.19, CGRectGetMaxY(frame) - 12.23)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 11.5, CGRectGetMaxY(frame) - 23.79) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 11.5, CGRectGetMaxY(frame) - 17.18) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 11.5, CGRectGetMaxY(frame) - 19.38)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 11.5, CGRectGetMinY(frame) + 25.79)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 12.15, CGRectGetMinY(frame) + 17.2) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 11.5, CGRectGetMinY(frame) + 21.38) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 11.5, CGRectGetMinY(frame) + 19.18)];
    [bezierPath closePath];
    CGContextSaveGState(context);
    [bezierPath addClip];
    CGRect bezierBounds = CGPathGetPathBoundingBox(bezierPath.CGPath);
    CGContextDrawLinearGradient(context, ADBarStyleKit.gradientLightGrayPink.CGGradient,
                                CGPointMake(CGRectGetMidX(bezierBounds), CGRectGetMaxY(bezierBounds)),
                                CGPointMake(CGRectGetMidX(bezierBounds), CGRectGetMinY(bezierBounds)),
                                0);
    CGContextRestoreGState(context);
    [ADBarStyleKit.colorEdge setStroke];
    bezierPath.lineWidth = 3;
    [bezierPath stroke];
}



@end
