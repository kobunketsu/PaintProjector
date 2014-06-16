//
//  Tutorial.m
//  PaintProjector
//
//  Created by 胡 文杰 on 6/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "Tutorial.h"


@implementation Tutorial

- (TutorialStep *)addStep:(NSString *)name{
    TutorialStep *step = [[TutorialStep alloc]init];
    step.name = name;
    [self.steps addObject:step];
    return step;
}
- (void)removeStep:(TutorialStep*)step{
    [self.steps removeObject:step];
}
- (id)init{
    self = [super init];
    if (self) {
        _steps = [[NSMutableArray alloc]init];
        _curStepIndex = -1;
    }
    return self;
}
- (void)dealloc{
    [self.steps removeAllObjects];
    self.steps = nil;
    self.curStep = nil;
    self.curStepIndex = -1;
}
-(void)setCurStepIndex:(NSInteger)curStepIndex{
    _curStepIndex = curStepIndex;
    self.curStep = self.steps[_curStepIndex];
}
#pragma mark- process
- (void)startFromStepName:(NSString *)name{
    NSInteger index = -1;
    for (NSInteger i = 0; i < self.steps.count; ++i) {
        TutorialStep *step = (TutorialStep *)self.steps[i];
        if ([step.name isEqualToString:name]) {
            index = i;
            break;
        }
    }
    
    [self startFromStepIndex:index];
}
- (void)startFromStepIndex:(NSInteger)index{
    if (index < 0 || index >= self.steps.count) {
        DebugLogError(@"startFromStepIndex out of array bound");
        return;
    }
    
    TutorialStep *step = (TutorialStep *)self.steps[index];
    self.curStepIndex = index;
    [step start];
}
- (void)stepNext:(void (^)(void))block{
    [self.curStep end];
    NSInteger index = self.curStepIndex;
    index ++;
    if (index >= self.steps.count) {
        [self end];
        return;
    }
    self.curStepIndex = index;

    if (block) {
        block();
    }
}

- (void)end{
    self.curStepIndex = -1;
}


#pragma mark- TutorialViewDelegate
- (void)willStepNextImmediate{
    [self stepNext:^{
        [self.curStep start];
    }];
}
@end