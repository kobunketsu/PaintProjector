//
//  BrushTypePageControl.m
//  PaintProjector
//
//  Created by 胡 文杰 on 8/16/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "BrushTypePageControl.h"

@implementation BrushTypePageControl

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
//    if (super.currentPage != currentPage) {
//        if (self.delegate) {
//            [self.delegate willBrushTypeCurrentPageChanged];
//        }
//    }
    if (self.delegate) {
        [self.delegate willBrushTypeCurrentPageChanged:currentPage];
    }
    [super setCurrentPage:currentPage];
}
@end


