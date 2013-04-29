//
//  EyeDropper.m
//  iReporter
//
//  Created by 文杰 胡 on 12-11-4.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "EyeDropper.h"
#import <QuartzCore/QuartzCore.h>
#define indicatorLength 40
@implementation EyeDropper
@synthesize position;
@synthesize isDrawing;
@synthesize targetView;
@synthesize resultColor;
- (id)initWithView:(UIView*)view
{
    self = [super init];
    if (self !=nil) {
        targetView = view;
        isDrawing = false;
    }
    
    return self;
}

- (UIColor *)colorOfPoint:(CGPoint)point
{
    unsigned char pixel[4] = {0};
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef tempContext = CGBitmapContextCreate(pixel, 1, 1, 8, 4, colorSpace, kCGImageAlphaPremultipliedLast);

    CGContextTranslateCTM(tempContext, -point.x, -point.y);
    
    [targetView.layer renderInContext:tempContext];
    //error color blend grayColor[127,127,127] with alpha 0.37 related to CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
    float r = (pixel[0] - 0.63 * 127)/0.37;
    float g = (pixel[1] - 0.63 * 127)/0.37;
    float b = (pixel[2] - 0.63 * 127)/0.37; 

    CGContextRelease(tempContext);
    CGColorSpaceRelease(colorSpace);
    UIColor *color = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
    
    return color;
}
- (void) draw {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGContextSetLineWidth(context, 1.0);
    if (CGColorEqualToColor(self.resultColor, [UIColor blackColor].CGColor)) {
        CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    }
    else {
        CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
    }

    CGPoint pointForHand = CGPointMake(position.x, position.y -20.0f);
    CGContextMoveToPoint(context, pointForHand.x - indicatorLength/2.0, pointForHand.y);
    CGContextAddLineToPoint(context, pointForHand.x + indicatorLength/2.0, pointForHand.y);
    CGContextMoveToPoint(context, pointForHand.x, pointForHand.y - indicatorLength/2.0);    
    CGContextAddLineToPoint(context, pointForHand.x, pointForHand.y + indicatorLength/2.0);    
    CGContextStrokePath(context);         
    
    CGContextRestoreGState(context);    
}
    
@end
