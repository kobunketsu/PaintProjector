//
//  LayerTableViewCell.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-18.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADLayerTableViewCell.h"
#import "ADPaintUIKitStyle.h"
#import "ADLayerDeleteDoneButton.h"

const float LayerTableViewCellWidth = 256;

@implementation ADLayerTableViewCell

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
        self.layerImageViewFrame.backgroundColor = [ADSharedUIStyleKit cNormal];
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

- (ADLayerDeleteButton*)deleteButton{
    ADLayerDeleteButton *deleteButton = nil;
    UIView *rootView = nil;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        //iOS 8.0 no UITableViewCellScrollView
        rootView = self;
    }
    else{
        //iOS 7.0 contain UITableViewCellScrollView
        rootView = self.subviews[0];
    }
    for (UIView *view in rootView.subviews) {
        if ([NSStringFromClass([view class ]) isEqualToString:@"UITableViewCellEditControl"] && view.subviews.count > 0) {
            if([view.subviews[0] isKindOfClass:[ADLayerDeleteButton class]]){
                deleteButton = view.subviews[0];
            }
        }
    }
    return deleteButton;
}

- (void)layoutSubviews
{
    DebugLogSystem(@"layoutSubviews");
    [super layoutSubviews];
 

    CGFloat r = ((ADCustomLayer*)self.visibleButton.layer).baseColorR;
    CGFloat g = ((ADCustomLayer*)self.visibleButton.layer).baseColorG;
    CGFloat b = ((ADCustomLayer*)self.visibleButton.layer).baseColorB;
    
    //修正IOS7 AutoLayout下deleteButton 和reorder button消失问题
    UIView *rootView = nil;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        //iOS 8.0 no UITableViewCellScrollView
        rootView = self;
    }
    else{
        //iOS 7.0 contain UITableViewCellScrollView
        rootView = self.subviews[0];
    }
    for (UIView *view in rootView.subviews) {
            if ([NSStringFromClass([view class]) isEqualToString:@"UITableViewCellDeleteConfirmationView"]){ // move
                [view setFrameOriginX:LayerTableViewCellWidth];
                
                //添加自定义DeleteConfirmButton
                view.backgroundColor = [UIColor whiteColor];
                UIView *actionButton = view.subviews.firstObject;
                if (actionButton) {
                    actionButton.backgroundColor = [UIColor whiteColor];
                    ADLayerDeleteDoneButton *deleteButton = [[ADLayerDeleteDoneButton alloc]initWithFrame:CGRectMake(4, 56, 44, 44)];
                    deleteButton.userInteractionEnabled = false;
                    ((ADCustomLayer*)deleteButton.layer).baseColorR = r;
                    ((ADCustomLayer*)deleteButton.layer).baseColorG = g;
                    ((ADCustomLayer*)deleteButton.layer).baseColorB = b;
                    [deleteButton.layer setNeedsDisplay];
                    for (UIView *subView in actionButton.subviews) {
                        [subView removeFromSuperview];
                    }
                    [actionButton addSubview:deleteButton];
                }
               
                [self bringSubviewToFront:view];
            }
//            else if ([NSStringFromClass([subview class]) isEqualToString:@"UITableViewCellReorderControl"]){
//                [subview setFrameOriginX:LayerTableViewWidth - self.bounds.size.width];
//                [self bringSubviewToFront:subview];
//            }
        
        if ([NSStringFromClass([view class ]) isEqualToString:@"UITableViewCellEditControl"] && view.subviews.count > 0) {
            for (UIView *subView in view.subviews) {
                [subView removeFromSuperview];
            }
            ADLayerDeleteButton *deleteButton = [[ADLayerDeleteButton alloc]initWithFrame:CGRectMake(0, 0, self.visibleButton.bounds.size.width, self.visibleButton.bounds.size.height)];
            deleteButton.userInteractionEnabled = false;
            deleteButton.center = CGPointMake(view.bounds.size.width * 0.5, view.bounds.size.height * 0.5);
            [deleteButton setFrameOriginX:0];
            //assign color
            ((ADCustomLayer*)deleteButton.layer).baseColorR = r;
            ((ADCustomLayer*)deleteButton.layer).baseColorG = g;
            ((ADCustomLayer*)deleteButton.layer).baseColorB = b;
            [deleteButton.layer setNeedsDisplay];
            [view addSubview:deleteButton];
            
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

- (void)drawRect:(CGRect)rect
{
    //    DebugLogWarn(@"drawRect");
    // Drawing code
    [ADSharedUIStyleKit drawPanelBackgourndWithFrame:rect];
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
