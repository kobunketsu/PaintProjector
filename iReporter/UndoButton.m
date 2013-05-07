//
//  UndoButton.m
//  iReporter
//
//  Created by 文杰 胡 on 12-11-6.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "UndoButton.h"

@implementation UndoButton
@synthesize touchPoint;
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
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* iconHighlightColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* iconColor = [UIColor colorWithRed: 0.795 green: 0.795 blue: 0.795 alpha: 1];
    CGFloat iconColorHSBA[4];
    [iconColor getHue: &iconColorHSBA[0] saturation: &iconColorHSBA[1] brightness: &iconColorHSBA[2] alpha: &iconColorHSBA[3]];
    
    UIColor* iconShadowColorColor = [UIColor colorWithHue: iconColorHSBA[0] saturation: iconColorHSBA[1] brightness: 0.325 alpha: iconColorHSBA[3]];
    UIColor* labelHightlightColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Shadow Declarations
    UIColor* iconHighlight = iconHighlightColor;
    CGSize iconHighlightOffset = CGSizeMake(0.1, 1.1);
    CGFloat iconHighlightBlurRadius = 0;
    UIColor* iconShadow = iconShadowColorColor;
    CGSize iconShadowOffset = CGSizeMake(0.1, 1.1);
    CGFloat iconShadowBlurRadius = 0;
    UIColor* labelHightlight = labelHightlightColor;
    CGSize labelHightlightOffset = CGSizeMake(0.1, 1.1);
    CGFloat labelHightlightBlurRadius = 0;
    
    //// Abstracted Attributes
    NSString* textContent = @"Undo";
    
    
    //// Text Drawing
    CGRect textRect = CGRectMake(0, 42, 60, 18);
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, labelHightlightOffset, labelHightlightBlurRadius, labelHightlight.CGColor);
    [iconColor setFill];
    [textContent drawInRect: textRect withFont: [UIFont fontWithName: @"Helvetica-Bold" size: 12] lineBreakMode: UILineBreakModeWordWrap alignment: UITextAlignmentCenter];
    CGContextRestoreGState(context);
    
    
    
    //// Main Drawing
    UIBezierPath* mainPath = [UIBezierPath bezierPath];
    [mainPath moveToPoint: CGPointMake(23.07, 3.57)];
    [mainPath addLineToPoint: CGPointMake(15.83, 10.96)];
    [mainPath addLineToPoint: CGPointMake(37.08, 10.96)];
    [mainPath addCurveToPoint: CGPointMake(47.03, 15.16) controlPoint1: CGPointMake(40.68, 10.96) controlPoint2: CGPointMake(44.28, 12.36)];
    [mainPath addCurveToPoint: CGPointMake(47.03, 35.46) controlPoint1: CGPointMake(52.52, 20.77) controlPoint2: CGPointMake(52.52, 29.85)];
    [mainPath addCurveToPoint: CGPointMake(37.08, 39.66) controlPoint1: CGPointMake(44.28, 38.26) controlPoint2: CGPointMake(40.68, 39.66)];
    [mainPath addLineToPoint: CGPointMake(37.08, 34.14)];
    [mainPath addCurveToPoint: CGPointMake(43.2, 31.55) controlPoint1: CGPointMake(39.3, 34.14) controlPoint2: CGPointMake(41.51, 33.28)];
    [mainPath addCurveToPoint: CGPointMake(43.2, 19.06) controlPoint1: CGPointMake(46.58, 28.11) controlPoint2: CGPointMake(46.58, 22.51)];
    [mainPath addCurveToPoint: CGPointMake(37.08, 16.48) controlPoint1: CGPointMake(41.51, 17.34) controlPoint2: CGPointMake(39.3, 16.48)];
    [mainPath addLineToPoint: CGPointMake(15.83, 16.48)];
    [mainPath addLineToPoint: CGPointMake(23.07, 23.87)];
    [mainPath addLineToPoint: CGPointMake(20.53, 26.47)];
    [mainPath addLineToPoint: CGPointMake(7.82, 13.93)];
    [mainPath addLineToPoint: CGPointMake(20.53, 0.97)];
    [mainPath addLineToPoint: CGPointMake(23.07, 3.57)];
    [mainPath closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
    [iconColor setFill];
    [mainPath fill];
    
    ////// Main Inner Shadow
    CGRect mainBorderRect = CGRectInset([mainPath bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
    mainBorderRect = CGRectOffset(mainBorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
    mainBorderRect = CGRectInset(CGRectUnion(mainBorderRect, [mainPath bounds]), -1, -1);
    
    UIBezierPath* mainNegativePath = [UIBezierPath bezierPathWithRect: mainBorderRect];
    [mainNegativePath appendPath: mainPath];
    mainNegativePath.usesEvenOddFillRule = YES;
    
    CGContextSaveGState(context);
    {
        CGFloat xOffset = iconShadowOffset.width + round(mainBorderRect.size.width);
        CGFloat yOffset = iconShadowOffset.height;
        CGContextSetShadowWithColor(context,
                                    CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                    iconShadowBlurRadius,
                                    iconShadow.CGColor);
        
        [mainPath addClip];
        CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(mainBorderRect.size.width), 0);
        [mainNegativePath applyTransform: transform];
        [[UIColor grayColor] setFill];
        [mainNegativePath fill];
    }
    CGContextRestoreGState(context);
    
    CGContextRestoreGState(context);

}

//override touchesBegan will ignore touch up inside function
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    UITouch* touch = [touches anyObject];
//    touchPoint = [touch locationInView:self];
//}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch* touch = [touches anyObject];
    touchPoint = [touch locationInView:self];    
}
//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
//    touchPoint = CGPointMake(0, 0);
//}

@end
