//
//  CustomPercentDrivenInteractiveTransition.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/11/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomPercentDrivenInteractiveTransition : NSObject
@property(assign, nonatomic)NSString *name;
@property(assign, nonatomic)id delegate;
@property(assign, nonatomic)CGFloat duration;
@property(assign, nonatomic)CGFloat percentComplete;
@property(assign, nonatomic)CGFloat completionSpeed;
@property(assign, nonatomic)CGFloat completeThresold;
@property(assign, nonatomic)BOOL interactionEnable;
- (void)updateInteractiveTransition:(CGFloat)percentComplete;
- (void)cancelInteractiveTransition;
- (void)finishInteractiveTransition;

@end

@protocol CustomPercentDrivenInteractiveTransition

- (void)willUpdatingInteractiveTransition:(CustomPercentDrivenInteractiveTransition*)transition;
- (void)willFinishInteractiveTransition:(CustomPercentDrivenInteractiveTransition*)transition completion: (void (^)(void))completion;
- (void)willCancelInteractiveTransition:(CustomPercentDrivenInteractiveTransition*)transition completion: (void (^)(void))completion;
@end
