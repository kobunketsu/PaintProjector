//
//  TutorialManager.h
//  PaintProjector
//
//  Created by 胡 文杰 on 6/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tutorial.h"
#import "TutorialView.h"
#import "TutorialPageView.h"
#import "TutorialPageButtonView.h"
#import "TutorialPaintScreenGestureCollectionView.h"
#import "TutorialPaintScreenGestureCollectionViewCell.h"
#import "TutorialBackgroundView.h"
#import "TutorialBackgroundLeftEdgeView.h"
#import "TutorialBackgroundRightEdgeView.h"

@class TutorialManager;
static TutorialManager *tutorialManager = nil;
@interface TutorialManager : NSObject
<TutorialDelegate>
+ (void)initialize;
+ (void)destroy;
+ (TutorialManager *)current;

- (void)activeTutorial:(NSString *)name;
- (void)deactive;
- (BOOL)isActive;

- (Tutorial *)addTutorial:(NSString *)name;
- (Tutorial *)addTutorial:(NSString *)name ofClass:(NSString *)className;
- (void)removeTutorial:(NSString *)name;

@property (assign, nonatomic) id delegate;
@property (weak, nonatomic) Tutorial *curTutorial;
@property (retain, nonatomic) NSMutableDictionary *tutorials;

@end

@protocol TutorialManagerDelegate
- (void)willTutorialEnd:(Tutorial *)tutorial;
@end