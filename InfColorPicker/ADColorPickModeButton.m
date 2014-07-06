//
//  ColorPickMode.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-11-28.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADColorPickModeButton.h"

@implementation ADColorPickModeButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _color = [UIColor redColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //// Color Declarations
    UIColor* color = self.color;
    CGFloat colorRGBA[4];
    [color getRed: &colorRGBA[0] green: &colorRGBA[1] blue: &colorRGBA[2] alpha: &colorRGBA[3]];
    
    CGFloat colorHSBA[4];
    [color getHue: &colorHSBA[0] saturation: &colorHSBA[1] brightness: &colorHSBA[2] alpha: &colorHSBA[3]];
    
    UIColor* color2 = [UIColor colorWithHue: colorHSBA[0] saturation: 0.5 brightness: colorHSBA[2] alpha: colorHSBA[3]];
    UIColor* color3 = [UIColor colorWithHue: colorHSBA[0] saturation: 0 brightness: colorHSBA[2] alpha: colorHSBA[3]];
    UIColor* color4 = [UIColor colorWithRed: (colorRGBA[0] * 0.5) green: (colorRGBA[1] * 0.5) blue: (colorRGBA[2] * 0.5) alpha: (colorRGBA[3] * 0.5 + 0.5)];
    CGFloat color4HSBA[4];
    [color4 getHue: &color4HSBA[0] saturation: &color4HSBA[1] brightness: &color4HSBA[2] alpha: &color4HSBA[3]];
    
    UIColor* color5 = [UIColor colorWithHue: color4HSBA[0] saturation: 0.5 brightness: color4HSBA[2] alpha: color4HSBA[3]];
    UIColor* color6 = [UIColor colorWithHue: color4HSBA[0] saturation: 0 brightness: color4HSBA[2] alpha: color4HSBA[3]];
    UIColor* color7 = [UIColor colorWithRed: (colorRGBA[0] * 0.2) green: (colorRGBA[1] * 0.2) blue: (colorRGBA[2] * 0.2) alpha: (colorRGBA[3] * 0.2 + 0.8)];
    CGFloat color7HSBA[4];
    [color7 getHue: &color7HSBA[0] saturation: &color7HSBA[1] brightness: &color7HSBA[2] alpha: &color7HSBA[3]];
    
    UIColor* color8 = [UIColor colorWithHue: color7HSBA[0] saturation: 0.5 brightness: color7HSBA[2] alpha: color7HSBA[3]];
    UIColor* color9 = [UIColor colorWithHue: color7HSBA[0] saturation: 0 brightness: color7HSBA[2] alpha: color7HSBA[3]];
    
    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(26, 0, 13, 13)];
    [color setFill];
    [rectanglePath fill];
    
    
    //// Rectangle 2 Drawing
    UIBezierPath* rectangle2Path = [UIBezierPath bezierPathWithRect: CGRectMake(13, 0, 13, 13)];
    [color2 setFill];
    [rectangle2Path fill];
    
    
    //// Rectangle 3 Drawing
    UIBezierPath* rectangle3Path = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 13, 13)];
    [color3 setFill];
    [rectangle3Path fill];
    
    
    //// Rectangle 4 Drawing
    UIBezierPath* rectangle4Path = [UIBezierPath bezierPathWithRect: CGRectMake(26, 13, 13, 13)];
    [color4 setFill];
    [rectangle4Path fill];
    
    
    //// Rectangle 5 Drawing
    UIBezierPath* rectangle5Path = [UIBezierPath bezierPathWithRect: CGRectMake(13, 13, 13, 13)];
    [color5 setFill];
    [rectangle5Path fill];
    
    
    //// Rectangle 6 Drawing
    UIBezierPath* rectangle6Path = [UIBezierPath bezierPathWithRect: CGRectMake(0, 13, 13, 13)];
    [color6 setFill];
    [rectangle6Path fill];
    
    
    //// Rectangle 7 Drawing
    UIBezierPath* rectangle7Path = [UIBezierPath bezierPathWithRect: CGRectMake(26, 26, 13, 13)];
    [color7 setFill];
    [rectangle7Path fill];
    
    
    //// Rectangle 8 Drawing
    UIBezierPath* rectangle8Path = [UIBezierPath bezierPathWithRect: CGRectMake(13, 26, 13, 13)];
    [color8 setFill];
    [rectangle8Path fill];
    
    
    //// Rectangle 9 Drawing
    UIBezierPath* rectangle9Path = [UIBezierPath bezierPathWithRect: CGRectMake(0, 26, 13, 13)];
    [color9 setFill];
    [rectangle9Path fill];
    
    

    
}


@end
