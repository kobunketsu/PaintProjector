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
#define IndicatorSwing 20
#define IndicatorSwingTime 0.4

@interface ADTutorialIndicatorView()
@property (assign, nonatomic) CGRect srcFrame;
@end
@implementation ADTutorialIndicatorView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.opaque = false;
        _arrowDirection = UIPopoverArrowDirectionUp;
        _animated = true;

        self.srcFrame = self.frame;
        [[NSNotificationCenter defaultCenter]
         addObserver:self selector:@selector(applicationDidEnterBackground:)
         name:UIApplicationDidEnterBackgroundNotification
         object:nil];

    }
    return self;
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
}

- (void)applicationDidEnterBackground:(id)sender{
    if (self.animated) {
        self.frame = self.srcFrame;
    }
}

- (void)layoutSubviews{
    DebugLogSystem(@"layoutSubviews");
    //通过计算字长宽重新设置label位置
    //重新设置label的位置
    CGRect frame = self.bounds;
    if (self.arrowDirection == UIPopoverArrowDirectionUp) {
        self.textLabel.frame = CGRectMake(CGRectGetMinX(frame) + 8, CGRectGetMinY(frame) + 14, CGRectGetWidth(frame) - 16, CGRectGetHeight(frame) - 18);
    }
    else if (self.arrowDirection == UIPopoverArrowDirectionDown) {
        self.textLabel.frame = CGRectMake(CGRectGetMinX(frame) + 8, CGRectGetMinY(frame) + 4, CGRectGetWidth(frame) - 16, CGRectGetHeight(frame) - 18);
    }
    else if (self.arrowDirection == UIPopoverArrowDirectionLeft) {
        self.textLabel.frame = CGRectMake(CGRectGetMinX(frame) + 16, CGRectGetMinY(frame) + 11, CGRectGetWidth(frame) - 22, CGRectGetHeight(frame) - 23);
        
    }
    else if (self.arrowDirection == UIPopoverArrowDirectionRight) {
        self.textLabel.frame = CGRectMake(CGRectGetMinX(frame) + 6, CGRectGetMinY(frame) + 16, CGRectGetWidth(frame) - 22, CGRectGetHeight(frame) - 32);

    }
    
    [self.textLabel alignTextHorizonCenterWithFontSize:[UIFont labelFontSize]];

    if (self.animated) {
        //增加整体动画
        //保存源frame，在EnterBackground后退出动画时归位
        self.srcFrame = self.frame;
        CGRect destframe = self.frame;
        
        CGFloat swing = IndicatorSwing;
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
        
        [self.layer removeAllAnimations];
        [UIView animateWithDuration:IndicatorSwingTime delay:0 options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
            self.frame = destframe;
        } completion:^(BOOL finished) {
        }];
    }
    
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
    DebugLog(@"frame %@", NSStringFromCGRect(frame));
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
    CGRect frame2 = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 20) * percent + 0.5), CGRectGetMinY(frame), 20, 24);
    
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake(CGRectGetMaxX(frame) - 8.2, CGRectGetMaxY(frame) - 2.15)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 7.81, CGRectGetMaxY(frame) - 2.25)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 2.25, CGRectGetMaxY(frame) - 7.81) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 5.23, CGRectGetMaxY(frame) - 3.19) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 3.19, CGRectGetMaxY(frame) - 5.23)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 1.5, CGRectGetMaxY(frame) - 16.79) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 1.5, CGRectGetMaxY(frame) - 10.18) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 1.5, CGRectGetMaxY(frame) - 12.38)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 1.5, CGRectGetMinY(frame) + 27.79)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 2.15, CGRectGetMinY(frame) + 19.2) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 1.5, CGRectGetMinY(frame) + 23.38) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 1.5, CGRectGetMinY(frame) + 21.18)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 2.25, CGRectGetMinY(frame) + 18.81)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 7.81, CGRectGetMinY(frame) + 13.25) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 3.19, CGRectGetMinY(frame) + 16.23) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 5.23, CGRectGetMinY(frame) + 14.19)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 16.79, CGRectGetMinY(frame) + 12.5) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 10.18, CGRectGetMinY(frame) + 12.5) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 12.38, CGRectGetMinY(frame) + 12.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame2) + 19.37, CGRectGetMinY(frame2) + 12.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame2) + 10.37, CGRectGetMinY(frame2) + 3.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame2) + 1.37, CGRectGetMinY(frame2) + 12.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 16.79, CGRectGetMinY(frame) + 12.5)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 8.2, CGRectGetMinY(frame) + 13.15) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 12.38, CGRectGetMinY(frame) + 12.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 10.18, CGRectGetMinY(frame) + 12.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 7.81, CGRectGetMinY(frame) + 13.25)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 2.25, CGRectGetMinY(frame) + 18.81) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 5.23, CGRectGetMinY(frame) + 14.19) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 3.19, CGRectGetMinY(frame) + 16.23)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 1.5, CGRectGetMinY(frame) + 27.79) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 1.5, CGRectGetMinY(frame) + 21.18) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 1.5, CGRectGetMinY(frame) + 23.38)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 1.5, CGRectGetMaxY(frame) - 16.79)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 2.15, CGRectGetMaxY(frame) - 8.2) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 1.5, CGRectGetMaxY(frame) - 12.38) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 1.5, CGRectGetMaxY(frame) - 10.18)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 2.25, CGRectGetMaxY(frame) - 7.81)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 7.81, CGRectGetMaxY(frame) - 2.25) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 3.19, CGRectGetMaxY(frame) - 5.23) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 5.23, CGRectGetMaxY(frame) - 3.19)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 16.79, CGRectGetMaxY(frame) - 1.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 10.18, CGRectGetMaxY(frame) - 1.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 12.38, CGRectGetMaxY(frame) - 1.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 16.79, CGRectGetMaxY(frame) - 1.5)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 8.2, CGRectGetMaxY(frame) - 2.15) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 12.38, CGRectGetMaxY(frame) - 1.5) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 10.18, CGRectGetMaxY(frame) - 1.5)];
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
    
    
    //// Subframes
    CGRect frame2 = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 20) * percent + 0.5), CGRectGetMinY(frame) + CGRectGetHeight(frame) - 24, 20, 24);
    
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake(CGRectGetMaxX(frame) - 8.2, CGRectGetMinY(frame) + 2.15)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 7.81, CGRectGetMinY(frame) + 2.25)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 2.25, CGRectGetMinY(frame) + 7.81) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 5.23, CGRectGetMinY(frame) + 3.19) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 3.19, CGRectGetMinY(frame) + 5.23)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 1.5, CGRectGetMinY(frame) + 16.79) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 1.5, CGRectGetMinY(frame) + 10.18) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 1.5, CGRectGetMinY(frame) + 12.38)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 1.5, CGRectGetMaxY(frame) - 27.79)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 2.15, CGRectGetMaxY(frame) - 19.2) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 1.5, CGRectGetMaxY(frame) - 23.38) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 1.5, CGRectGetMaxY(frame) - 21.18)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 2.25, CGRectGetMaxY(frame) - 18.81)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 7.81, CGRectGetMaxY(frame) - 13.25) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 3.19, CGRectGetMaxY(frame) - 16.23) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 5.23, CGRectGetMaxY(frame) - 14.19)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 16.79, CGRectGetMaxY(frame) - 12.5) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 10.18, CGRectGetMaxY(frame) - 12.5) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 12.38, CGRectGetMaxY(frame) - 12.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame2) + 19.37, CGRectGetMaxY(frame2) - 12.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame2) + 10.37, CGRectGetMaxY(frame2) - 3.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame2) + 1.37, CGRectGetMaxY(frame2) - 12.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 16.79, CGRectGetMaxY(frame) - 12.5)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 8.2, CGRectGetMaxY(frame) - 13.15) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 12.38, CGRectGetMaxY(frame) - 12.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 10.18, CGRectGetMaxY(frame) - 12.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 7.81, CGRectGetMaxY(frame) - 13.25)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 2.25, CGRectGetMaxY(frame) - 18.81) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 5.23, CGRectGetMaxY(frame) - 14.19) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 3.19, CGRectGetMaxY(frame) - 16.23)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 1.5, CGRectGetMaxY(frame) - 27.79) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 1.5, CGRectGetMaxY(frame) - 21.18) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 1.5, CGRectGetMaxY(frame) - 23.38)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 1.5, CGRectGetMinY(frame) + 16.79)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 2.15, CGRectGetMinY(frame) + 8.2) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 1.5, CGRectGetMinY(frame) + 12.38) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 1.5, CGRectGetMinY(frame) + 10.18)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 2.25, CGRectGetMinY(frame) + 7.81)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 7.81, CGRectGetMinY(frame) + 2.25) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 3.19, CGRectGetMinY(frame) + 5.23) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 5.23, CGRectGetMinY(frame) + 3.19)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 16.79, CGRectGetMinY(frame) + 1.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 10.18, CGRectGetMinY(frame) + 1.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 12.38, CGRectGetMinY(frame) + 1.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 16.79, CGRectGetMinY(frame) + 1.5)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 8.2, CGRectGetMinY(frame) + 2.15) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 12.38, CGRectGetMinY(frame) + 1.5) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 10.18, CGRectGetMinY(frame) + 1.5)];
    [bezierPath closePath];
    CGContextSaveGState(context);
    [bezierPath addClip];
    CGRect bezierBounds = CGPathGetPathBoundingBox(bezierPath.CGPath);
    CGContextDrawLinearGradient(context, ADBarStyleKit.gradientLightGrayPink.CGGradient,
                                CGPointMake(CGRectGetMidX(bezierBounds), CGRectGetMinY(bezierBounds)),
                                CGPointMake(CGRectGetMidX(bezierBounds), CGRectGetMaxY(bezierBounds)),
                                0);
    CGContextRestoreGState(context);
    [ADBarStyleKit.colorEdge setStroke];
    bezierPath.lineWidth = 3;
    [bezierPath stroke];
}

//- (void)drawBubbleButtonWithFrameDown:(CGRect)frame offsetPercent:(CGFloat)percent
//{
//
//    //// General Declarations
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    //// Subframes
//    CGRect frame2 = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 53) * percent + 0.5), CGRectGetMinY(frame) + CGRectGetHeight(frame) - 38, 53, 38);
//    
//    
//    //// Bezier Drawing
//    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
//    [bezierPath moveToPoint: CGPointMake(CGRectGetMaxX(frame) - 18.2, CGRectGetMinY(frame) + 13.15)];
//    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 17.81, CGRectGetMinY(frame) + 13.25)];
//    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 12.25, CGRectGetMinY(frame) + 18.81) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 15.23, CGRectGetMinY(frame) + 14.19) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 13.19, CGRectGetMinY(frame) + 16.23)];
//    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 11.5, CGRectGetMinY(frame) + 27.79) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 11.5, CGRectGetMinY(frame) + 21.18) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 11.5, CGRectGetMinY(frame) + 23.38)];
//    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 11.5, CGRectGetMaxY(frame) - 40.79)];
//    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 12.15, CGRectGetMaxY(frame) - 32.2) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 11.5, CGRectGetMaxY(frame) - 36.38) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 11.5, CGRectGetMaxY(frame) - 34.18)];
//    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 12.25, CGRectGetMaxY(frame) - 31.81)];
//    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 17.81, CGRectGetMaxY(frame) - 26.25) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 13.19, CGRectGetMaxY(frame) - 29.23) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 15.23, CGRectGetMaxY(frame) - 27.19)];
//    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 26.79, CGRectGetMaxY(frame) - 25.5) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 20.18, CGRectGetMaxY(frame) - 25.5) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 22.38, CGRectGetMaxY(frame) - 25.5)];
//    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame2) + 40.37, CGRectGetMaxY(frame2) - 25.5)];
//    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame2) + 26.37, CGRectGetMaxY(frame2) - 11.5) controlPoint1: CGPointMake(CGRectGetMinX(frame2) + 33.47, CGRectGetMaxY(frame2) - 18.6) controlPoint2: CGPointMake(CGRectGetMinX(frame2) + 26.37, CGRectGetMaxY(frame2) - 11.5)];
//    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame2) + 12.37, CGRectGetMaxY(frame2) - 25.5) controlPoint1: CGPointMake(CGRectGetMinX(frame2) + 26.37, CGRectGetMaxY(frame2) - 11.5) controlPoint2: CGPointMake(CGRectGetMinX(frame2) + 19.27, CGRectGetMaxY(frame2) - 18.6)];
//    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26.79, CGRectGetMaxY(frame) - 25.5)];
//    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 18.2, CGRectGetMaxY(frame) - 26.15) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 22.38, CGRectGetMaxY(frame) - 25.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 20.18, CGRectGetMaxY(frame) - 25.5)];
//    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17.81, CGRectGetMaxY(frame) - 26.25)];
//    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 12.25, CGRectGetMaxY(frame) - 31.81) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 15.23, CGRectGetMaxY(frame) - 27.19) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 13.19, CGRectGetMaxY(frame) - 29.23)];
//    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 11.5, CGRectGetMaxY(frame) - 40.79) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 11.5, CGRectGetMaxY(frame) - 34.18) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 11.5, CGRectGetMaxY(frame) - 36.38)];
//    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 11.5, CGRectGetMinY(frame) + 27.79)];
//    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 12.15, CGRectGetMinY(frame) + 19.2) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 11.5, CGRectGetMinY(frame) + 23.38) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 11.5, CGRectGetMinY(frame) + 21.18)];
//    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 12.25, CGRectGetMinY(frame) + 18.81)];
//    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 17.81, CGRectGetMinY(frame) + 13.25) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 13.19, CGRectGetMinY(frame) + 16.23) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 15.23, CGRectGetMinY(frame) + 14.19)];
//    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 26.79, CGRectGetMinY(frame) + 12.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 20.18, CGRectGetMinY(frame) + 12.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 22.38, CGRectGetMinY(frame) + 12.5)];
//    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 26.79, CGRectGetMinY(frame) + 12.5)];
//    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 18.2, CGRectGetMinY(frame) + 13.15) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 22.38, CGRectGetMinY(frame) + 12.5) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 20.18, CGRectGetMinY(frame) + 12.5)];
//    [bezierPath closePath];
//    CGContextSaveGState(context);
//    [bezierPath addClip];
//    CGRect bezierBounds = CGPathGetPathBoundingBox(bezierPath.CGPath);
//    CGContextDrawLinearGradient(context, ADBarStyleKit.gradientLightGrayPink.CGGradient,
//                                CGPointMake(CGRectGetMidX(bezierBounds), CGRectGetMinY(bezierBounds)),
//                                CGPointMake(CGRectGetMidX(bezierBounds), CGRectGetMaxY(bezierBounds)),
//                                0);
//    CGContextRestoreGState(context);
//    [ADBarStyleKit.colorEdge setStroke];
//    bezierPath.lineWidth = 3;
//    [bezierPath stroke];
//}


- (void)drawBubbleButtonWithFrameLeft: (CGRect)frame offsetPercent:(CGFloat)percent;
{
        //// General Declarations
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        
        //// Subframes
        CGRect frame3 = CGRectMake(CGRectGetMinX(frame) + 16, CGRectGetMinY(frame) + 11, CGRectGetWidth(frame) - 22, CGRectGetHeight(frame) - 23);
        CGRect frame2 = CGRectMake(CGRectGetMinX(frame3) - 16, CGRectGetMinY(frame3) + floor((CGRectGetHeight(frame3) - 20) * 0.49180 + 0.5), 24, 20);
        
        
        //// Bezier Drawing
        UIBezierPath* bezierPath = UIBezierPath.bezierPath;
        [bezierPath moveToPoint: CGPointMake(CGRectGetMaxX(frame) - 2.15, CGRectGetMinY(frame) + 11.84)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 2.25, CGRectGetMinY(frame) + 11.48)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 7.79, CGRectGetMinY(frame) + 6.21) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 3.18, CGRectGetMinY(frame) + 9.03) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 5.21, CGRectGetMinY(frame) + 7.1)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 16.72, CGRectGetMinY(frame) + 5.5) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 10.15, CGRectGetMinY(frame) + 5.5) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 12.34, CGRectGetMinY(frame) + 5.5)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26.68, CGRectGetMinY(frame) + 5.5)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 18.13, CGRectGetMinY(frame) + 6.12) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 22.3, CGRectGetMinY(frame) + 5.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 20.11, CGRectGetMinY(frame) + 5.5)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17.75, CGRectGetMinY(frame) + 6.21)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 12.21, CGRectGetMinY(frame) + 11.48) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 15.17, CGRectGetMinY(frame) + 7.1) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 13.14, CGRectGetMinY(frame) + 9.03)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 11.46, CGRectGetMinY(frame) + 19.98) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 11.46, CGRectGetMinY(frame) + 13.72) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 11.46, CGRectGetMinY(frame) + 15.81)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame2) + 11.46, CGRectGetMinY(frame2) + 1.06)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame2) + 2.5, CGRectGetMinY(frame2) + 9.59)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame2) + 11.46, CGRectGetMinY(frame2) + 18.11)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 11.46, CGRectGetMaxY(frame) - 20.98)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 12.11, CGRectGetMaxY(frame) - 12.84) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 11.46, CGRectGetMaxY(frame) - 16.81) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 11.46, CGRectGetMaxY(frame) - 14.72)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 12.21, CGRectGetMaxY(frame) - 12.48)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 17.75, CGRectGetMaxY(frame) - 7.21) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 13.14, CGRectGetMaxY(frame) - 10.03) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 15.17, CGRectGetMaxY(frame) - 8.1)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 26.68, CGRectGetMaxY(frame) - 6.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 20.11, CGRectGetMaxY(frame) - 6.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 22.3, CGRectGetMaxY(frame) - 6.5)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 16.72, CGRectGetMaxY(frame) - 6.5)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 8.17, CGRectGetMaxY(frame) - 7.12) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 12.34, CGRectGetMaxY(frame) - 6.5) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 10.15, CGRectGetMaxY(frame) - 6.5)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 7.79, CGRectGetMaxY(frame) - 7.21)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 2.25, CGRectGetMaxY(frame) - 12.48) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 5.21, CGRectGetMaxY(frame) - 8.1) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 3.18, CGRectGetMaxY(frame) - 10.03)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 1.5, CGRectGetMaxY(frame) - 20.98) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 1.5, CGRectGetMaxY(frame) - 14.72) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 1.5, CGRectGetMaxY(frame) - 16.81)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 1.5, CGRectGetMinY(frame) + 19.98)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 2.15, CGRectGetMinY(frame) + 11.84) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 1.5, CGRectGetMinY(frame) + 15.81) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 1.5, CGRectGetMinY(frame) + 13.72)];
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
        CGRect frame2 = CGRectMake(CGRectGetMinX(frame) + CGRectGetWidth(frame) - 24, CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 20) * 0.50000 + 0.5), 24, 20);
        
        
        //// Bezier Drawing
        UIBezierPath* bezierPath = UIBezierPath.bezierPath;
        [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 2.15, CGRectGetMinY(frame) + 15.6)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 2.25, CGRectGetMinY(frame) + 15.25)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 7.81, CGRectGetMinY(frame) + 10.18) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 3.19, CGRectGetMinY(frame) + 12.9) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 5.23, CGRectGetMinY(frame) + 11.04)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 16.79, CGRectGetMinY(frame) + 9.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 10.18, CGRectGetMinY(frame) + 9.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 12.38, CGRectGetMinY(frame) + 9.5)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 26.79, CGRectGetMinY(frame) + 9.5)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 18.2, CGRectGetMinY(frame) + 10.1) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 22.38, CGRectGetMinY(frame) + 9.5) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 20.18, CGRectGetMinY(frame) + 9.5)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 17.81, CGRectGetMinY(frame) + 10.18)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 12.25, CGRectGetMinY(frame) + 15.25) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 15.23, CGRectGetMinY(frame) + 11.04) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 13.19, CGRectGetMinY(frame) + 12.9)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 11.5, CGRectGetMinY(frame) + 23.42) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 11.5, CGRectGetMinY(frame) + 17.41) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 11.5, CGRectGetMinY(frame) + 19.41)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame2) - 11.5, CGRectGetMinY(frame2) + 0.96)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame2) - 2.5, CGRectGetMinY(frame2) + 9.16)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame2) - 11.5, CGRectGetMinY(frame2) + 17.36)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 11.5, CGRectGetMaxY(frame) - 24.42)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 12.15, CGRectGetMaxY(frame) - 16.6) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 11.5, CGRectGetMaxY(frame) - 20.41) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 11.5, CGRectGetMaxY(frame) - 18.41)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 12.25, CGRectGetMaxY(frame) - 16.25)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 17.81, CGRectGetMaxY(frame) - 11.18) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 13.19, CGRectGetMaxY(frame) - 13.9) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 15.23, CGRectGetMaxY(frame) - 12.04)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 26.79, CGRectGetMaxY(frame) - 10.5) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 20.18, CGRectGetMaxY(frame) - 10.5) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 22.38, CGRectGetMaxY(frame) - 10.5)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 16.79, CGRectGetMaxY(frame) - 10.5)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 8.2, CGRectGetMaxY(frame) - 11.1) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 12.38, CGRectGetMaxY(frame) - 10.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 10.18, CGRectGetMaxY(frame) - 10.5)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 7.81, CGRectGetMaxY(frame) - 11.18)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 2.25, CGRectGetMaxY(frame) - 16.25) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 5.23, CGRectGetMaxY(frame) - 12.04) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 3.19, CGRectGetMaxY(frame) - 13.9)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 1.5, CGRectGetMaxY(frame) - 24.42) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 1.5, CGRectGetMaxY(frame) - 18.41) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 1.5, CGRectGetMaxY(frame) - 20.41)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 1.5, CGRectGetMinY(frame) + 23.42)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 2.15, CGRectGetMinY(frame) + 15.6) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 1.5, CGRectGetMinY(frame) + 19.41) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 1.5, CGRectGetMinY(frame) + 17.41)];
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
