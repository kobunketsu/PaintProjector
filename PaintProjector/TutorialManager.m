//
//  TutorialManager.m
//  PaintProjector
//
//  Created by 胡 文杰 on 6/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "TutorialManager.h"

@implementation TutorialManager
+ (void)initialize{
    DebugLogSystem(@"initialize");
    [super initialize];
    if (!tutorialManager) {
        tutorialManager = [[TutorialManager alloc]init];
    }
}

+ (void)destroy{
    DebugLogSystem(@"destroy");
    tutorialManager = nil;
}

+ (TutorialManager *)current{
    return tutorialManager;
}

- (void)activeTutorial:(NSString *)name{
    
    Tutorial* tutorial = (Tutorial*)[self.tutorials valueForKey:name];
    if (!tutorial) {
        DebugLogError(@"tutorial %@ not found", name);
        return;
    }
    
    self.curTutorial = tutorial;
}

- (void)deactive{
    if (!self.curTutorial) {
        return;
    }
    
    self.curTutorial = nil;
}

- (BOOL)isActive{
    
    if (!self.curTutorial) {
        return false;
    }
    return true;
}

- (id)init{
    DebugLogSystem(@"init");
    self = [super init];
    if (self) {
        _tutorials = [[NSMutableDictionary alloc]init];
    }
    return self;
}

- (void)dealloc{
    DebugLogSystem(@"dealloc");
    [self.tutorials removeAllObjects];
    self.tutorials = nil;
    self.curTutorial = nil;
}

- (Tutorial *)addTutorial:(NSString *)name{
    DebugLogFuncStart(@"addTutorial %@", name);
    
    Tutorial *tutorial = [[Tutorial alloc]init];
    tutorial.name = name;
    [self.tutorials setValue:tutorial forKey:name];
    return tutorial;
}

- (void)removeTutorial:(NSString *)name{
    DebugLogFuncStart(@"removeTutorial %@", name);
    
    [self.tutorials removeObjectForKey:name];
}
@end
