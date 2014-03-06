//
//  SwatchManagerTableView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 3/5/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "SwatchManagerTableView.h"

@implementation SwatchManagerTableView

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

- (void)layoutSubviews{
    DebugLog(@"layoutSubviews");
    for (UIView *view in self.subviews) {
        DebugLog(@"view %@ frame %@ label %@", view, NSStringFromCGRect(view.frame), view.accessibilityLabel);
        for (UIView *subView in view.subviews) {
            DebugLog(@"subView %@ frame %@ label %@", subView, NSStringFromCGRect(subView.frame), subView.accessibilityLabel);
        }
    }

//    [self sendSubviewToBack:self.backButton];
    
// searchBar will be reposition to the lastSubView of table view
    
}
@end
