//
//  Pencil.m
//  iReporter
//
//  Created by 文杰 胡 on 12-11-12.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "Pencil.h"

@implementation Pencil
- (id)initWithContext:(EAGLContext*)context Canvas:(UIView *)canvas{
    self = [super initWithContext:context Canvas:canvas];
    if (self !=nil) {
        [self setBrushTextureWithImage:@"airBrushRadius16.png"];
        _iconImage = [UIImage imageNamed:@"pencil.png"];
        _typeName = @"pencil";
    }
    
    return self;
}
//- (void) draw :(CGPoint)lastPoint NewPoint:(CGPoint)newPoint{
//
//    CGPoint drawVec = CGPointMake(newPoint.x - self.lastDrawPoint.x, newPoint.y - self.lastDrawPoint.y);
//    float distSqrt = drawVec.x * drawVec.x + drawVec.y * drawVec.y;
//    if (distSqrt>0 && distSqrt < (self.radius * self.radius * 0.009)) {
//        return;
//    }
//
//    int repeatCount = MAX(1, sqrtf(distSqrt) / (self.radius)) * 4;
//    for (int i=0; i<repeatCount; ++i) {
//        CGPoint drawPoint = CGPointMake(self.lastDrawPoint.x + drawVec.x * (float)i / (float)repeatCount, self.lastDrawPoint.y + drawVec.y * (float)i / (float)repeatCount);
//
//        CGRect rect = CGRectMake(drawPoint.x - self.radius, drawPoint.y - self.radius, self.radius*2, self.radius*2);
//        
//        CGContextSetBlendMode(_context, kCGBlendModeNormal);
//        CGContextDrawImage(_context, rect, _patternImage.CGImage); 
//
//        CGContextSetBlendMode(_context, kCGBlendModeSourceIn);
//        CGContextSetFillColorWithColor(_context, self.color.CGColor);
//        CGContextFillRect(_context, rect);
//        
//    }
//    
//    self.lastDrawPoint = newPoint;
//}
@end
//

//void DrawPatternCellCallback(void *info, CGContextRef cgContext) 
//{
//    // Create a CGImage and use CGContextDrawImage() to draw it into the graphics context provided by the callback function.
//    UIImage* patternImage = [UIImage imageNamed:@"airBrushRadius16.png"];    
//    CGContextDrawImage(cgContext, CGRectMake(0, 0, kPatternWidth, kPatternHeight), patternImage.CGImage);
//}
//    CGContextBeginPath(_context);
//    const CGRect patternBounds = CGRectMake(0, 0, kPatternWidth, kPatternHeight);
//    const CGPatternCallbacks kPatternCallbacks = {0, DrawPatternCellCallback, NULL};
//    
//    CGAffineTransform patternTransform = CGAffineTransformMakeScale(self.radius * 2 / kPatternWidth, self.radius * 2 / kPatternWidth);  
//    float angle = 0;
//    if (newPoint.x != lastPoint.x) {
//        angle = atan((newPoint.y - lastPoint.y)/(newPoint.x - lastPoint.x));    
//    }
//    CGPoint srcCenter = CGPointMake(self.radius, self.radius);
//    CGPoint center;
//    center.x = srcCenter.x * cosf(angle) - srcCenter.y * sinf(angle);
//    center.y = srcCenter.y * cosf(angle) + srcCenter.x * sinf(angle);
//    
//    patternTransform = CGAffineTransformRotate(patternTransform, angle);        
//
//    patternTransform.tx = lastPoint.x - center.x;
//    patternTransform.ty = lastPoint.y - center.y;
//    
//    CGPatternRef strokePattern = CGPatternCreate(
//                                                 NULL,
//                                                 patternBounds,
//                                                 patternTransform,
//                                                 kPatternWidth/1.0, // horizontal spacing
//                                                 kPatternHeight/1.0, // vertical spacing
//                                                 kCGPatternTilingConstantSpacing,
//                                                 true,
//                                                 &kPatternCallbacks);
//    CGFloat color1[] = {1.0, 0.0, 0.0, 1.0};
//    
//    CGColorSpaceRef patternSpace = CGColorSpaceCreatePattern(NULL);
//    CGContextSetStrokeColorSpace(_context, patternSpace);
//    CGContextSetStrokePattern(_context, strokePattern, color1);
//    CGContextSetLineWidth(_context, self.radius*2);
//    CGContextSetLineCap(_context, kCGLineCapRound);
//    CGContextMoveToPoint(_context, lastPoint.x, lastPoint.y);
//    CGContextAddLineToPoint(_context, newPoint.x, newPoint.y);
//    CGContextStrokePath(_context);
// If you aren't using ARC:
//    CGPatternRelease(strokePattern);
//    strokePattern = NULL;
//    CGColorSpaceRelease(patternSpace);
//    patternSpace = NULL;