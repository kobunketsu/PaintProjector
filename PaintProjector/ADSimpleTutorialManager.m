//
//  AnaDrawTutorialManager.m
//  PaintProjector
//
//  Created by 胡 文杰 on 6/28/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADSimpleTutorialManager.h"

@implementation ADSimpleTutorialManager
+ (void)initialize{
    DebugLogSystem(@"initialize");
//    [super initialize];
    if (!tutorialManager) {
        tutorialManager = [[ADSimpleTutorialManager alloc]init];
    }
}

+ (void)destroy{
    DebugLogSystem(@"destroy");
    tutorialManager = nil;
}

+ (ADSimpleTutorialManager *)current{
    return (ADSimpleTutorialManager *)tutorialManager;
}


@end
