//
//  TutorialNextButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 6/18/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADTutorialStepButton.h"
#import "ADPaintUIKitStyle.h"

@implementation ADTutorialStepButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initCustom];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initCustom];
    }
    return self;
}

- (void)initCustom{
    self.titleLabel.font = [UIFont fontWithDescriptor:self.titleLabel.font.fontDescriptor size:[ADPaintUIKitStyle fontCustomSize]];
    [self setTitleColor:[UIColor selectableColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
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
    CGGradientRef gradientLightGrayPink = [ADPaintUIKitStyle crystalGradientHighlighted];
    
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
    [[ADBarStyleKit colorEdgeHighlighted] setStroke];
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
    
    //// Gradient Declarations
    CGGradientRef gradientLightGrayPink = [ADPaintUIKitStyle crystalGradientNormal];
    
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
    [[ADBarStyleKit colorEdge] setStroke];
    rectanglePath.lineWidth = 3;
    [rectanglePath stroke];
    
    
    //// Cleanup
    CGGradientRelease(gradientLightGrayPink);
    CGColorSpaceRelease(colorSpace);
}



@end
