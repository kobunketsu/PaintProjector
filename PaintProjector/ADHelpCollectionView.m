//
//  ADHelpCollectionView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 9/10/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADHelpCollectionView.h"
#import "ADPaintUIKitStyle.h"

@implementation ADHelpCollectionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initCustom];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initCustom];
    }
    return self;
}

- (void)initCustom{
    //self.delaysContentTouches = NO;
}
- (BOOL)touchesShouldCancelInContentView:(UIView *)view
{    
    if ([view isKindOfClass:UISwitch.class]) {
        return YES;
    }
    
    return [super touchesShouldCancelInContentView:view];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [ADSharedUIStyleKit drawPanelBackgourndWithFrame:rect];
}

@end
