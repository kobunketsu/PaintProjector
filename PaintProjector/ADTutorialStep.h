//
//  TutorialStep.h
//  PaintProjector
//
//  Created by 胡 文杰 on 6/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADTutorialView.h"
#import "ADTutorialIndicatorView.h"

typedef void(^TutorialStepAnimationBlock)(void);

@interface ADTutorialStep : NSObject
@property(copy, nonatomic)NSString *name;
@property(copy, nonatomic)NSString *tutorialName;
@property(assign, nonatomic) id delegate;
@property(retain, nonatomic)ADTutorialView *contentView;
@property(retain, nonatomic)ADTutorialIndicatorView *indicatorView;//主指示器
@property(retain, nonatomic)NSMutableArray *indicatorViews;
@property (nonatomic, copy) TutorialStepAnimationBlock fadeInAnimationBlock;
- (void)start;
- (void)end;
//加入到教程内容的根UIView下
- (void)addToRootView:(UIView *)rootView;
- (void)removeFromRootView;
//加入指示器
- (void)addIndicatorView:(ADTutorialIndicatorView*)view;
- (void)removeIndicatorView:(ADTutorialIndicatorView*)view;
- (void)removeAllIndicatorViews;
@end

@protocol ADTutorialStepDelegate
//需要使用代理提供排版信息来进行当前步骤的排版
- (void)willTutorialLayoutWithStep:(ADTutorialStep*)step;

//需要使用代理提供当前页面禁止用户的操作
- (void)willTutorialEnableUserInteraction:(BOOL)enable withStep:(ADTutorialStep*)step;

//需要使用代理处理结束
- (void)willTutorialEndWithStep:(ADTutorialStep*)step;
@end
