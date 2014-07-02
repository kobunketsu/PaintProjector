//
//  LayerTableViewCell.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-18.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "LayerTableViewCell.h"
#import "PaintUIKitStyle.h"
const float LayerTableViewWidth = 256;

@implementation LayerTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelectedState:(BOOL)selected{
    if (selected) {
        CustomLayer* layer = (CustomLayer*)self.visibleButton.layer;
        CGFloat r = ((CustomLayer*)layer).baseColorR * 0.675;
        CGFloat g = ((CustomLayer*)layer).baseColorG * 0.675;
        CGFloat b = ((CustomLayer*)layer).baseColorB * 0.675;
        self.layerImageViewFrame.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
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
 
    //修正IOS7 AutoLayout下deleteButton 和reorder button消失问题
    for (UIView *subview in self.subviews) {
        for (UIView *subview2 in subview.subviews) {
            if ([NSStringFromClass([subview2 class]) isEqualToString:@"UITableViewCellDeleteConfirmationView"]){ // move delete confirmation view
                CGRect frame = subview2.frame;
                frame.origin.x = LayerTableViewWidth;
                subview2.frame = frame;
                [subview bringSubviewToFront:subview2];
                
            }
            else if ([NSStringFromClass([subview2 class]) isEqualToString:@"UITableViewCellReorderControl"]){
                CGRect frame = subview2.frame;
                frame.origin.x = LayerTableViewWidth - subview2.bounds.size.width;
                subview2.frame = frame;
                [subview bringSubviewToFront:subview2];
            }
        }
    }
    
    
    //substitude subview
//    for (int i = 0; i< self.subviews.count; ++i) {
//        UIView *subview = [self.subviews objectAtIndex:i];
////        DebugLog(@"SubView Class %@", NSStringFromClass([subview class]));
////        DebugLog(@"SubView frame origin x:%.2f y:%.2f", subview.frame.origin.x, subview.frame.origin.y);
//        if ([NSStringFromClass([subview class]) isEqualToString:@"UITableViewCellContentView"]) {
////            DebugLog(@"UITableViewCellContentView index %d", i);
//            CGRect newFrame = subview.frame;
//            newFrame.origin.x = 0;
//            subview.frame = newFrame;
//        }
//        else if ([NSStringFromClass([subview class]) isEqualToString:@"UITableViewCellDeleteConfirmationControl"]) {
////            DebugLog(@"UITableViewCellDeleteConfirmationControl index %d", i);
//            subview.frame = CGRectMake(130, 5, 44, 44);
//        }
//        else if ([NSStringFromClass([subview class]) isEqualToString:@"UITableViewCellEditControl"]) {
////            DebugLog(@"UITableViewCellEditControl index %d", i);
//            subview.frame = CGRectMake(130, 5, 44, 44);
//        }
////        else if ([NSStringFromClass([subview class]) isEqualToString:@"UITableViewCellReorderControl"]){
////            DebugLog(@"UITableViewCellReorderControl index %d", i);
////            CGRect newFrame = subview.frame;
////            newFrame.origin.x = 200;
////            subview.frame = newFrame;
////        }
//    }
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
