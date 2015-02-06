//
//  ADSharedLabel.m
//  PaintProjector
//
//  Created by 文杰 胡 on 2/6/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import "ADSharedLabel.h"

@implementation ADSharedLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initCustom];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [self initCustom];
    }
    return self;
}

- (void)initCustom{
    self.textColor = [ADSharedUIStyleKit cText];
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
