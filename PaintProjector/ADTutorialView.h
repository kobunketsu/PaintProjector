//
//  TutorialView.h
//  PaintProjector
//
//  Created by 胡 文杰 on 6/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ADTutorial;
typedef void(^TutorialLayoutCompletionBlock)(void);

@interface ADTutorialView : UIView
@property (assign, nonatomic) id delegate;
//显示教程信息
@property(retain, nonatomic) UILabel *textLabel;
@property (nonatomic, copy) TutorialLayoutCompletionBlock layoutCompletionBlock;
//显示教程背景图片
@property (retain, nonatomic) UIImageView *imageView;
- (void)initWithTutorial:(ADTutorial*)tutorial description:(NSString *)desc bgImage:(UIImage*)image;
@end

@protocol ADTutorialViewDelegate
- (void)willStepNextImmediate;
@end