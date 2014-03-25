//
//  BackgroundLayerTableViewCell.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-11-23.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "BackgroundLayerTableViewCell.h"
#import "PaintUIKitStyle.h"

@implementation BackgroundLayerTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [PaintUIKitStyle drawCrystalGradientInView:self];
}

- (void)setSelectedState:(BOOL)selected{
    if (selected) {
        self.layerImageViewFrame.backgroundColor = [UIColor colorWithRed:0 green:0.5 blue:1.0 alpha:1.0];
    }
    else{
        self.layerImageViewFrame.backgroundColor = [UIColor clearColor];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
    [self setSelectedState:selected];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //substitude subview
    
    for (int i = 0; i< self.subviews.count; ++i) {
        UIView *subview = [self.subviews objectAtIndex:i];
        //        DebugLog(@"SubView Class %@", NSStringFromClass([subview class]));
        //        DebugLog(@"SubView frame origin %@", NSStringFromCGPoint(subview.frame.origin));
        if ([NSStringFromClass([subview class]) isEqualToString:@"UITableViewCellContentView"]) {
            //            DebugLog(@"UITableViewCellContentView index %d", i);
            CGRect newFrame = subview.frame;
            newFrame.origin.x = 0;
            subview.frame = newFrame;
        }
        else if ([NSStringFromClass([subview class]) isEqualToString:@"UITableViewCellDeleteConfirmationControl"]) {
            //            DebugLog(@"UITableViewCellDeleteConfirmationControl index %d", i);
            subview.frame = CGRectMake(130, 5, 44, 44);
        }
        else if ([NSStringFromClass([subview class]) isEqualToString:@"UITableViewCellEditControl"]) {
            //            DebugLog(@"UITableViewCellEditControl index %d", i);
            subview.frame = CGRectMake(130, 5, 44, 44);
        }
        //        else if ([NSStringFromClass([subview class]) isEqualToString:@"UITableViewCellReorderControl"]){
        //            DebugLog(@"UITableViewCellReorderControl index %d", i);
        //            CGRect newFrame = subview.frame;
        //            newFrame.origin.x = 200;
        //            subview.frame = newFrame;
        //        }
    }
}

- (void)willTransitionToState:(UITableViewCellStateMask)state {
    
    [super willTransitionToState:state];
    
    if ((state & UITableViewCellStateShowingDeleteConfirmationMask) == UITableViewCellStateShowingDeleteConfirmationMask) {
        [UIView setAnimationsEnabled:false];
        //        for (UIView *subview in self.subviews) {
        //
        //            if ([NSStringFromClass([subview class]) isEqualToString:@"UITableViewCellDeleteConfirmationControl"]) {
        //
        //                subview.hidden = YES;
        //                subview.alpha = 0.0;
        //            }
        //        }
    }
}
- (void)didTransitionToState:(UITableViewCellStateMask)state {
    [super didTransitionToState:state];
    
    if ((state & UITableViewCellStateShowingDeleteConfirmationMask) == UITableViewCellStateShowingDeleteConfirmationMask) {
        [UIView setAnimationsEnabled:true];
    }
}


@end
