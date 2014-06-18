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

@class TutorialManager;
static TutorialManager *tutorialManager = nil;
@interface TutorialManager : NSObject
+ (void)initialize;
+ (void)destroy;
+ (TutorialManager *)current;

- (void)activeTutorial:(NSString *)name;
- (void)deactive;
- (BOOL)isActive;

- (Tutorial *)addTutorial:(NSString *)name;
- (Tutorial *)addTutorial:(NSString *)name ofClass:(NSString *)className;
- (void)removeTutorial:(NSString *)name;

@property (weak, nonatomic) Tutorial *curTutorial;
@property (retain, nonatomic) NSMutableDictionary *tutorials;


@end
