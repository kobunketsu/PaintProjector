//
//  BrushTypePageControl.m
//  PaintProjector
//
//  Created by 胡 文杰 on 8/16/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADBrushTypePageControl.h"

@implementation ADBrushTypePageControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (void)setCurrentPage:(NSInteger)currentPage{
    if (super.currentPage != currentPage) {
        [super setCurrentPage:currentPage];
        [Flurry endTimedEvent:@"PS_inBrushTypePage" withParameters:nil];
        NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInteger:currentPage], @"PageIndex",nil];
        [Flurry logEvent:@"PS_inBrushTypePage" withParameters:params timed:true];
    }
    if (self.delegate) {
        [self.delegate willBrushTypeCurrentPageChanged:currentPage];
    }

}
@end


