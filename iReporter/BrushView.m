//
//  BrushView.m
//  iReporter
//
//  Created by 文杰 胡 on 12-10-29.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "BrushView.h"

@implementation BrushView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void)awakeFromNib{
    [self setUserInteractionEnabled:false];
    [self setHidden:true];
    self.color = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGContextSetLineWidth(context, 1.0);
//    if (self.brush.type == BrushType_Eraser) {
//        CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
//    }
//    else {
//        CGContextSetFillColorWithColor(context, self.color.CGColor);
//    }
//    CGContextSetAlpha(context, brush.opacity);
//    CGRect rectangle = CGRectMake(self.bounds.size.width * 0.5 - brush.radius, self.bounds.size.height * 0.5 - brush.radius, brush.radius*2, brush.radius*2);
//    CGContextAddEllipseInRect(context, rectangle);
//    CGContextFillPath(context);    
    
    CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
    CGContextSetAlpha(context, 1);    
    CGRect rectangle1 = CGRectMake(self.bounds.size.width * 0.5 - self.brush.brushState.radius, self.bounds.size.height * 0.5 - self.brush.brushState.radius, self.brush.brushState.radius*2, self.brush.brushState.radius*2);
//    CGContextAddEllipseInRect(context, rectangle1);    
    CGContextAddRect(context, rectangle1);
    CGContextStrokePath(context);
    
    CGContextRestoreGState(context);
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self setNeedsDisplay];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
}
       
@end
