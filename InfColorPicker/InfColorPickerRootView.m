//
//  InfColorPickerRootView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-26.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "InfColorPickerRootView.h"
#import "ADPaintUIKitStyle.h"

@implementation InfColorPickerRootView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        [[NSNotificationCenter defaultCenter] addObserver:self
//                                                 selector:@selector(backgroundLayerClearColorChanged)
//                                                     name:BackgroundLayerClearColorChangedNotification
//                                                   object:nil];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
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
     //罩一层白色在上面
     // Drawing code
//     UIColor* color = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: FuzzyTransparentAlpha];
//     
//     UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: self.bounds];
//     [color setFill];
//     [rectanglePath fill];
     
     [ADSharedUIStyleKit drawPanelBackgourndWithFrame:rect];
 }

@end
