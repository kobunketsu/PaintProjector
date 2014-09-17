//
//  AnaDrawTutorialManager.h
//  PaintProjector
//
//  Created by 胡 文杰 on 6/28/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADTutorialManager.h"
#import "ADSimpleTutorial.h"
#import "ADSimpleTutorialViewController.h"

#define TutorialFadeInOutDuration 0.50
@interface ADSimpleTutorialManager : ADTutorialManager
+ (void)initialize;
+ (void)destroy;
+ (ADSimpleTutorialManager *)current;
@property (retain, nonatomic) ADSimpleTutorialViewController *simpleTutorialVC;
@end

