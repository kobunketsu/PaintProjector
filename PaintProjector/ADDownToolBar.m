//
//  DownToolBar.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-11.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADDownToolBar.h"
#import "ADPaintUIKitStyle.h"

@implementation ADDownToolBar

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
//        [[NSNotificationCenter defaultCenter] addObserver:self
//                                                 selector:@selector(backgroundLayerClearColorChanged)
//                                                     name:BackgroundLayerClearColorChangedNotification
//                                                   object:nil];
    }
    return self;
}
- (void)dealloc{
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:BackgroundLayerClearColorChangedNotification object:nil];
}
- (void)backgroundLayerClearColorChanged{
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [self drawCanvas1WithFrame:rect];
}

- (void)drawCanvas1WithFrame: (CGRect)frame
{
    
    
    //// Subframes
    CGRect aDDownToolBar = CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), CGRectGetWidth(frame), CGRectGetHeight(frame));
    
    
    //// ADDownToolBar
    {
        //// Rounded Rectangle 2 Drawing
        UIBezierPath* roundedRectangle2Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(CGRectGetMinX(aDDownToolBar) + floor(CGRectGetWidth(aDDownToolBar) * 0.00000 + 0.5), CGRectGetMinY(aDDownToolBar) + floor(CGRectGetHeight(aDDownToolBar) * 0.00000 + 0.5), floor(CGRectGetWidth(aDDownToolBar) * 1.00000 + 0.5) - floor(CGRectGetWidth(aDDownToolBar) * 0.00000 + 0.5), floor(CGRectGetHeight(aDDownToolBar) * 1.00000 + 0.5) - floor(CGRectGetHeight(aDDownToolBar) * 0.00000 + 0.5)) byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: CGSizeMake(8, 8)];
        [roundedRectangle2Path closePath];
        [ADSharedUIStyleKit.cToolBarBackground setFill];
        [roundedRectangle2Path fill];
        [ADSharedUIStyleKit.cToolBarBackground setStroke];
        roundedRectangle2Path.lineWidth = 1;
        [roundedRectangle2Path stroke];
    }
}



@end
