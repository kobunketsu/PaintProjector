//
//  TutorialView.h
//  PaintProjector
//
//  Created by 胡 文杰 on 6/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Tutorial;

@interface TutorialView : UIView
@property (assign, nonatomic) id delegate;
@property (retain, nonatomic) UIImageView *imageView;
- (void)initWithTutorial:(Tutorial*)tutorial bgImage:(UIImage*)image;
@end

@protocol TutorialViewDelegate
- (void)willStepNextImmediate;
@end