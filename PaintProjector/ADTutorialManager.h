//
//  TutorialManager.h
//  PaintProjector
//
//  Created by 胡 文杰 on 6/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADTutorial.h"
#import "ADTutorialView.h"
#import "ADTutorialPageView.h"
#import "ADTutorialPageButtonView.h"
#import "ADTutorialPaintScreenGestureCollectionView.h"
#import "ADTutorialPaintScreenGestureCollectionViewCell.h"
#import "ADTutorialBackgroundView.h"
#import "ADTutorialBackgroundLeftEdgeView.h"
#import "ADTutorialBackgroundRightEdgeView.h"

@class ADTutorialManager;
static ADTutorialManager *tutorialManager = nil;
@interface ADTutorialManager : NSObject
<ADTutorialDelegate>
+ (void)initialize;
+ (void)destroy;
+ (ADTutorialManager *)current;

- (void)activeTutorial:(NSString *)name;
- (void)deactive;
- (BOOL)isActive;

- (ADTutorial *)addTutorial:(NSString *)name;
- (ADTutorial *)addTutorial:(NSString *)name ofClass:(NSString *)className;
- (void)removeTutorial:(NSString *)name;


@property (assign, nonatomic) id delegate;
@property (weak, nonatomic) ADTutorial *curTutorial;
@property (retain, nonatomic) NSMutableDictionary *tutorials;
@end

@protocol ADTutorialManagerDelegate
- (void)willTutorialManagerEndTutorial:(ADTutorial*)tutorial;
@end