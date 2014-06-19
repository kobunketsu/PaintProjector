//
//  TutorialNextButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 6/18/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "TutorialNextButton.h"

@implementation TutorialNextButton

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
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Rectangle Drawing
    CGRect rectangleRect = CGRectMake(CGRectGetMinX(frame) + 5, CGRectGetMinY(frame) + 5, floor((CGRectGetWidth(frame) - 5) * 0.97872 + 0.5), floor((CGRectGetHeight(frame) - 5) * 0.95652 + 0.5));
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRoundedRect: rectangleRect cornerRadius: 10];
    CGContextSaveGState(context);
    [rectanglePath addClip];
    CGContextDrawLinearGradient(context, AnaDrawStyleKit.gradientLightGrayPink.CGGradient,
                                CGPointMake(CGRectGetMidX(rectangleRect), CGRectGetMaxY(rectangleRect)),
                                CGPointMake(CGRectGetMidX(rectangleRect), CGRectGetMinY(rectangleRect)),
                                0);
    CGContextRestoreGState(context);
    [AnaDrawStyleKit.colorEdge setStroke];
    rectanglePath.lineWidth = 3;
    [rectanglePath stroke];
}

@end
