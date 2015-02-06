//
//  BackButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-1.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADBackButton.h"

@implementation ADBackButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
//- (void)setUserInteractionEnabled:(BOOL)userInteractionEnabled{
//    DebugLog(@"setUserInteractionEnabled %i", userInteractionEnabled);
//    super.userInteractionEnabled = userInteractionEnabled;
//}
- (void)setIsReversePaint:(BOOL)isReversePaint{
    _isReversePaint = isReversePaint;
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawCanvas1WithFrame: (CGRect)frame isSelected: (BOOL)isSelected
{
    
    //// Variable Declarations
    BOOL isNormal = !isSelected;
    
    
    //// Subframes
    CGRect aDBackButton = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 44) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.44444 + 0.5), 44, 44);
    
    
    //// ADBackButton
    {
        if (isNormal)
        {
            //// Normal 26
            {
                //// Bezier 46 Drawing
                UIBezierPath* bezier46Path = UIBezierPath.bezierPath;
                [bezier46Path moveToPoint: CGPointMake(CGRectGetMinX(aDBackButton) + 25.05, CGRectGetMinY(aDBackButton) + 2.82)];
                [bezier46Path addLineToPoint: CGPointMake(CGRectGetMinX(aDBackButton) + 8.54, CGRectGetMinY(aDBackButton) + 19.18)];
                [bezier46Path addLineToPoint: CGPointMake(CGRectGetMinX(aDBackButton) + 44, CGRectGetMinY(aDBackButton) + 19.18)];
                [bezier46Path addLineToPoint: CGPointMake(CGRectGetMinX(aDBackButton) + 44, CGRectGetMinY(aDBackButton) + 23.55)];
                [bezier46Path addLineToPoint: CGPointMake(CGRectGetMinX(aDBackButton) + 8.72, CGRectGetMinY(aDBackButton) + 23.99)];
                [bezier46Path addLineToPoint: CGPointMake(CGRectGetMinX(aDBackButton) + 25.18, CGRectGetMinY(aDBackButton) + 41.33)];
                [bezier46Path addLineToPoint: CGPointMake(CGRectGetMinX(aDBackButton) + 22.31, CGRectGetMinY(aDBackButton) + 44)];
                [bezier46Path addLineToPoint: CGPointMake(CGRectGetMinX(aDBackButton), CGRectGetMinY(aDBackButton) + 21.1)];
                [bezier46Path addLineToPoint: CGPointMake(CGRectGetMinX(aDBackButton) + 22.31, CGRectGetMinY(aDBackButton))];
                [bezier46Path addLineToPoint: CGPointMake(CGRectGetMinX(aDBackButton) + 25.05, CGRectGetMinY(aDBackButton) + 2.82)];
                [bezier46Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier46Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 26
            {
                //// Bezier 48 Drawing
                UIBezierPath* bezier48Path = UIBezierPath.bezierPath;
                [bezier48Path moveToPoint: CGPointMake(CGRectGetMinX(aDBackButton) + 25.05, CGRectGetMinY(aDBackButton) + 2.82)];
                [bezier48Path addLineToPoint: CGPointMake(CGRectGetMinX(aDBackButton) + 8.54, CGRectGetMinY(aDBackButton) + 19.18)];
                [bezier48Path addLineToPoint: CGPointMake(CGRectGetMinX(aDBackButton) + 44, CGRectGetMinY(aDBackButton) + 19.18)];
                [bezier48Path addLineToPoint: CGPointMake(CGRectGetMinX(aDBackButton) + 44, CGRectGetMinY(aDBackButton) + 23.55)];
                [bezier48Path addLineToPoint: CGPointMake(CGRectGetMinX(aDBackButton) + 8.72, CGRectGetMinY(aDBackButton) + 23.99)];
                [bezier48Path addLineToPoint: CGPointMake(CGRectGetMinX(aDBackButton) + 25.18, CGRectGetMinY(aDBackButton) + 41.33)];
                [bezier48Path addLineToPoint: CGPointMake(CGRectGetMinX(aDBackButton) + 22.31, CGRectGetMinY(aDBackButton) + 44)];
                [bezier48Path addLineToPoint: CGPointMake(CGRectGetMinX(aDBackButton), CGRectGetMinY(aDBackButton) + 21.1)];
                [bezier48Path addLineToPoint: CGPointMake(CGRectGetMinX(aDBackButton) + 22.31, CGRectGetMinY(aDBackButton))];
                [bezier48Path addLineToPoint: CGPointMake(CGRectGetMinX(aDBackButton) + 25.05, CGRectGetMinY(aDBackButton) + 2.82)];
                [bezier48Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier48Path fill];
            }
        }
    }
}


@end
