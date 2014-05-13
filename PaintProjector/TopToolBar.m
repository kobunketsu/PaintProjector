//
//  TopToolBar.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-5.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "TopToolBar.h"
#import "PaintUIKitStyle.h"

@implementation TopToolBar

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
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOffset = CGSizeMake(0, 0);
        self.layer.shadowOpacity = 0.3;
        self.layer.shadowRadius = 8.0;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(backgroundLayerClearColorChanged)
                                                     name:BackgroundLayerClearColorChangedNotification
                                                   object:nil];
    }
    return self;
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:BackgroundLayerClearColorChangedNotification object:nil];
}
- (void)backgroundLayerClearColorChanged{
    [self setNeedsDisplay];
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* gradientColor = [UIColor colorWithRed: 0.902 green: 0.894 blue: 0.894 alpha: 1];
    UIColor* shadowColor2 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.05];
    UIColor* gradientColor4 = [UIColor colorWithRed: 0.84 green: 0.821 blue: 0.821 alpha: 1];
    UIColor* gradientColor5 = [UIColor colorWithRed: 0.746 green: 0.773 blue: 0.782 alpha: 1];
    UIColor* color = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Gradient Declarations
    UIColor *reflectColor = [PaintUIKitStyle globalRefelectColor];
    NSArray* gradientPinkColors = [NSArray arrayWithObjects:
//                                   (id)gradientColor4.CGColor,
                                   (id)reflectColor.CGColor,
                                   (id)gradientColor5.CGColor,
                                   (id)reflectColor.CGColor, nil];
//                                   (id)gradientColor.CGColor, nil];
    CGFloat gradientPinkLocations[] = {0, 0.3, 1};
    CGGradientRef gradientPink = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientPinkColors, gradientPinkLocations);
    
    //// Shadow Declarations
    UIColor* shadow = shadowColor2;
    CGSize shadowOffset = CGSizeMake(0.1, -6.1);
    CGFloat shadowBlurRadius = 6;
    
    //// Abstracted Attributes
    CGFloat groupAlpha = 0.95;
    
    
    //// Group
    {
        CGContextSaveGState(context);
        CGContextSetAlpha(context, groupAlpha);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Rounded Rectangle Drawing
        UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0, 0, 768, 88) byRoundingCorners: UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii: CGSizeMake(8, 8)];
        [roundedRectanglePath closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        [roundedRectanglePath addClip];
        CGContextDrawLinearGradient(context, gradientPink, CGPointMake(384, 88), CGPointMake(384, -0), 0);
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
        
        [color setStroke];
        roundedRectanglePath.lineWidth = 1;
        [roundedRectanglePath stroke];
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
    //// Cleanup
    CGGradientRelease(gradientPink);
    CGColorSpaceRelease(colorSpace);
    

}


@end
