//
//  ADLaunchLogoCharacterView.m
//  PaintProjector
//
//  Created by kobunketsu on 9/18/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADLaunchLogoCharacterView.h"

@implementation ADLaunchLogoCharacterView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initCustom];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [self initCustom];
    }
    return self;
}

- (void)initCustom{
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 8);
    self.layer.shadowRadius = 8;
    self.layer.shadowOpacity  = 0.3;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
