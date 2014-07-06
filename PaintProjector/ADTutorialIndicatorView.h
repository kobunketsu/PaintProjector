//
//  TutorialIndicatorView.h
//  PaintProjector
//
//  Created by 胡 文杰 on 6/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADTutorialView.h"

@interface ADTutorialIndicatorView : ADTutorialView
@property(assign, nonatomic)UIPopoverArrowDirection arrowDirection;
@property(assign, nonatomic)CGPoint targetPoint;
//@property(assign, nonatomic)CGRect targetFrame;//记录框来保证在从后台返回后动画的正确播放
//指示器指向一个区域
- (void)targetViewFrame:(CGRect)frame inRootView:(UIView*)rootView;
//指示器指向一个UIView
- (void)targetView:(UIView *)targetView inRootView:(UIView*)rootView;
@end
