//
//  LayerTableViewCellBackgroundView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 3/26/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "LayerTableViewCellBackgroundView.h"
#import "PaintUIKitStyle.h"
@implementation LayerTableViewCellBackgroundView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
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
    // Drawing code
    [PaintUIKitStyle drawCrystalGradientInView:self];    
}


//- (void)setFrame:(CGRect)frame
//{
//    if ([[[UIDevice currentDevice] systemVersion] compare:@"7.0" options:NSNumericSearch] != NSOrderedAscending) {
//        // background view covers delete button on iOS 7 !?!
//        [super setFrame:CGRectMake(0, frame.origin.y, frame.size.width, frame.size.height)];
//    } else {
//        [super setFrame:frame];
//    }
//}
@end
