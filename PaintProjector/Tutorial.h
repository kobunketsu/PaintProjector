//
//  Tutorial.h
//  PaintProjector
//
//  Created by 胡 文杰 on 6/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TutorialStep.h"

@interface Tutorial : NSObject
- (void)startFromStepName:(NSString *)name;
- (void)startFromStepIndex:(NSInteger)index;
- (void)stepNext:(void (^)(void))block;
- (void)end;

- (TutorialStep *)addStep:(NSString *)name;
- (void)removeStep:(NSString *)name;

@property (copy, nonatomic) NSString *name;
@property (assign, nonatomic) NSInteger curStepIndex;
@property (weak, nonatomic) TutorialStep *curStep;
@property (retain, nonatomic) NSMutableArray *steps;
@end
