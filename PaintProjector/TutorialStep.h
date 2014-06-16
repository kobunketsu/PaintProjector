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
@property(weak, nonatomic)UIView *targetView;

@property(retain, nonatomic)TutorialIndicatorView *indicatorView;
- (void)start;
- (void)end;
- (void)targetViewFrame:(CGRect)frame;
@end

@protocol TutorialStepDelegate
//需要使用代理提供排版信息来进行当前步骤的排版
- (void)willTutorialLayoutWithStep:(TutorialStep*)step;

//需要使用代理提供当前页面禁止用户的操作
- (void)willTutorialEnableUserInteraction:(BOOL)enable withStep:(TutorialStep*)step;
@end
