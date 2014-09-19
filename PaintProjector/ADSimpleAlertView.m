//
//  ADAutoAlertView.m
//  PaintProjector
//
//  Created by kobunketsu on 9/19/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADSimpleAlertView.h"

@implementation ADSimpleAlertView

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
        [self initCustom];
    }
    return self;
}

- (void)initCustom{
    self.delegate = self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


#pragma mark- UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    BOOL confirm = buttonIndex == 0 ? false : true;
    if (self.clickHandler) {
        self.clickHandler(confirm);
        self.clickHandler = nil;
    }
}

@end
