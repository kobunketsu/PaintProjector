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
//        [self addTarget:self action:@selector(nextButtonTouchUp:) forControlEvents:UIControlEventTouchDown];
    }
    return self;
}

-(void)setHighlighted:(BOOL)highlighted{
    [super setHighlighted:highlighted];
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    if (self.highlighted) {
        [self drawCanvas1WithFrameHightlighted:rect];
    }
    else{
        [self drawCanvas1WithFrame:rect];
    }

}

- (void)drawCanvas1WithFrameHightlighted: (CGRect)frame;
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* gradientColorStart = [UIColor colorWithRed: 0.658 green: 0.887 blue: 0.97 alpha: 1];
    UIColor* gradientColorEnd = [UIColor colorWithRed: 0.564 green: 0.768 blue: 0.842 alpha: 1];
    UIColor* gradientColorMid = [UIColor colorWithRed: 0.041 green: 0.679 blue: 0.911 alpha: 1];
    UIColor* colorEdge = [UIColor colorWithRed: 0.801 green: 0.947 blue: 1 alpha: 1];
    
    //// Gradient Declarations
    CGFloat gradientLightGrayPinkLocations[] = {0, 0.3, 1};
    CGGradientRef gradientLightGrayPink = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)gradientColorEnd.CGColor, (id)gradientColorMid.CGColor, (id)gradientColorStart.CGColor], gradientLightGrayPinkLocations);
    
    //// Rectangle Drawing
    CGRect rectangleRect = CGRectMake(CGRectGetMinX(frame) + 5, CGRectGetMinY(frame) + 5, floor((CGRectGetWidth(frame) - 5) * 0.97872 + 0.5), floor((CGRectGetHeight(frame) - 5) * 0.95652 + 0.5));
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRoundedRect: rectangleRect cornerRadius: 10];
    CGContextSaveGState(context);
    [rectanglePath addClip];
    CGContextDrawLinearGradient(context, gradientLightGrayPink,
                                CGPointMake(CGRectGetMidX(rectangleRect), CGRectGetMaxY(rectangleRect)),
                                CGPointMake(CGRectGetMidX(rectangleRect), CGRectGetMinY(rectangleRect)),
                                0);
    CGContextRestoreGState(context);
    [colorEdge setStroke];
    rectanglePath.lineWidth = 3;
    [rectanglePath stroke];
    
    
    //// Cleanup
    CGGradientRelease(gradientLightGrayPink);
    CGColorSpaceRelease(colorSpace);
}

- (void)drawCanvas1WithFrame: (CGRect)frame;
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* gradientColorStart = [UIColor colorWithRed: 0.57 green: 0.57 blue: 0.57 alpha: 1];
    UIColor* gradientColorEnd = [UIColor colorWithRed: 0.442 green: 0.442 blue: 0.442 alpha: 1];
    UIColor* gradientColorMid = [UIColor colorWithRed: 0.411 green: 0.411 blue: 0.411 alpha: 1];
    UIColor* colorEdge = [UIColor colorWithRed: 0.6 green: 0.6 blue: 0.6 alpha: 1];
    
    //// Gradient Declarations
    CGFloat gradientLightGrayPinkLocations[] = {0, 0.3, 1};
    CGGradientRef gradientLightGrayPink = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)gradientColorEnd.CGColor, (id)gradientColorMid.CGColor, (id)gradientColorStart.CGColor], gradientLightGrayPinkLocations);
    
    //// Rectangle Drawing
    CGRect rectangleRect = CGRectMake(CGRectGetMinX(frame) + 5, CGRectGetMinY(frame) + 5, floor((CGRectGetWidth(frame) - 5) * 0.97872 + 0.5), floor((CGRectGetHeight(frame) - 5) * 0.95652 + 0.5));
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRoundedRect: rectangleRect cornerRadius: 10];
    CGContextSaveGState(context);
    [rectanglePath addClip];
    CGContextDrawLinearGradient(context, gradientLightGrayPink,
                                CGPointMake(CGRectGetMidX(rectangleRect), CGRectGetMaxY(rectangleRect)),
                                CGPointMake(CGRectGetMidX(rectangleRect), CGRectGetMinY(rectangleRect)),
                                0);
    CGContextRestoreGState(context);
    [colorEdge setStroke];
    rectanglePath.lineWidth = 3;
    [rectanglePath stroke];
    
    
    //// Cleanup
    CGGradientRelease(gradientLightGrayPink);
    CGColorSpaceRelease(colorSpace);
}



@end
