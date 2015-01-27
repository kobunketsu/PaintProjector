//
//  PaintCollectionViewCellFrame.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADPaintCollectionViewCellFrame.h"

@implementation ADPaintCollectionViewCellFrame

- (id)initWithCoder:(NSCoder *)aDecoder{
    //    DebugLog(@"[initWithCoder]");
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initApperance];
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    //    DebugLog(@"[initWithFrame]");
    self = [super initWithFrame:frame];
    if (self) {
        [self initApperance];
    }
    return self;
}

-(void)initApperance{
    self.clipsToBounds = NO;
    self.backgroundColor = [UIColor clearColor];
    
    //设置边框阴影
    //clipsToBounds will clip layer.shadow, should set shadow via drawLayer method
    CGPathRef path = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
    [self.layer setShadowPath:path];
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowRadius = 5;
    self.layer.shadowOffset = CGSizeMake(0, 5);
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.cornerRadius = 5;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = ctx;
    
    //// Color Declarations
    UIColor* gradientColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* gradientColor2 = [UIColor colorWithRed: 0.804 green: 0.804 blue: 0.804 alpha: 1];
    UIColor* gradientColor3 = [UIColor colorWithRed: 0.737 green: 0.737 blue: 0.737 alpha: 1];
    UIColor* gradientColor4 = [UIColor colorWithRed: 0.787 green: 0.787 blue: 0.787 alpha: 1];
    
    //// Gradient Declarations
    CGFloat gradientLocations[] = {0.07, 0.12, 0.83, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)gradientColor.CGColor, (id)gradientColor2.CGColor, (id)gradientColor3.CGColor, (id)gradientColor4.CGColor], gradientLocations);
    
    //// frameBottom Drawing
    UIBezierPath* frameBottomPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0, 279, 210, 16) byRoundingCorners: UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii: CGSizeMake(8, 8)];
    [frameBottomPath closePath];
    CGContextSaveGState(context);
    [frameBottomPath addClip];
    CGContextDrawLinearGradient(context, gradient, CGPointMake(105, 279), CGPointMake(105, 295), 0);
    CGContextRestoreGState(context);
    
    
    //// Cleanup
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
}
//- (void)drawRect:(CGRect)rect
//{
//    // Drawing code
//    //// General Declarations
//    
//}



@end
