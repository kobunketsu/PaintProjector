//
//  Tutorial.m
//  PaintProjector
//
//  Created by 胡 文杰 on 6/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADTutorial.h"


@implementation ADTutorial

- (ADTutorialStep *)addStep:(NSString *)name{
    ADTutorialStep *step = [[ADTutorialStep alloc]init];
    step.name = name;
    [self.steps addObject:step];
    return step;
}

- (ADTutorialStep *)addStep:(NSString *)name ofClass:(NSString *)className{
    if (className == nil) {
        return [self addStep:name];
    }
    
    Class class = NSClassFromString(className);
    if (class == nil) {
        DebugLogError(@"addStep of class, class not exist");
        return nil;
    }
    
    ADTutorialStep *step = [[class alloc]init];
    step.name = name;
    [self.steps addObject:step];
    return step;
}

- (void)removeStep:(ADTutorialStep*)step{
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
    
    if (curStepIndex < 0 || curStepIndex >= self.steps.count) {
        DebugLogError(@"startFromStepIndex out of array bound");
        self.curStep = nil;
    }
    else{
        self.curStep = self.steps[_curStepIndex];
    }
}
#pragma mark- process
- (void)startCurrentStep{
    [self startFromStepIndex:self.curStepIndex];
}
- (void)startFromStepName:(NSString *)name{
    NSInteger index = -1;
    for (NSInteger i = 0; i < self.steps.count; ++i) {
        ADTutorialStep *step = (ADTutorialStep *)self.steps[i];
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
    
    ADTutorialStep *step = (ADTutorialStep *)self.steps[index];
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

- (void)stepNextImmediate{
    [self stepNext:^{
        [self.curStep start];
    }];
}

- (void)end{
    self.curStepIndex = -1;
    
    if (self.delegate) {
        [self.delegate willTutorialEnd:self];
    }
}


#pragma mark- ADTutorialViewDelegate
- (void)willStepNextImmediate{
    [self stepNext:^{
        [self.curStep start];
    }];
}
@end
