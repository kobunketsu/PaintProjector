//
//  TutorialStep.h
//  PaintProjector
//
//  Created by 胡 文杰 on 6/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TutorialView.h"
#import "TutorialIndicatorView.h"

@interface TutorialStep : NSObject
@property(copy, nonatomic)NSString *name;
@property(assign, nonatomic) id delegate;
@property(retain, nonatomic)TutorialView *contentView;
@property(retain, nonatomic)TutorialIndicatorView *indicatorView;//主指示器
@property(retain, nonatomic)NSMutableArray *indicatorViews;
- (void)start;
- (void)end;
//指示器指向一个区域
- (void)indicatorView:(TutorialIndicatorView*)indicatorView targetViewFrame:(CGRect)frame;
//指示器指向一个UIView
- (void)indicatorView:(TutorialIndicatorView*)indicatorView targetView:(UIView *)targetView inRootView:(UIView*)rootView;
//加入到教程内容的根UIView下
- (void)addToRootView:(UIView *)rootView;
- (void)removeFromRootView;
//加入指示器
- (void)addIndicatorView:(TutorialIndicatorView*)view;
- (void)removeIndicatorView:(TutorialIndicatorView*)view;
- (void)removeAllIndicatorViews;
@end

@protocol TutorialStepDelegate
//需要使用代理提供排版信息来进行当前步骤的排版
- (void)willTutorialLayoutWithStep:(TutorialStep*)step;

//需要使用代理提供当前页面禁止用户的操作
- (void)willTutorialEnableUserInteraction:(BOOL)enable withStep:(TutorialStep*)step;
@end
