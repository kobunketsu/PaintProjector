//
//  TPPropertyAnimation.h
//  Property Animation http://atastypixel.com/blog/key-path-based-property-animation
//
//  Created by Michael Tyson on 13/08/2010.
//  Copyright 2010 A Tasty Pixel. All rights reserved.
//
//  Licensed under the terms of the BSD License, as specified below.
//

/*
 Copyright (c) 2010, Michael Tyson
 
 All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 * Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
 
 * Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
 
 * Neither the name of A Tasty Pixel nor the names of its
   contributors may be used to endorse or promote products derived from
   this software without specific prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
 TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import <UIKit/UIKit.h>
#import "REObject.h"

// Animation timing types
//typedef enum {
//    REPropertyAnimationTimingLinear,
//    REPropertyAnimationTimingEaseIn,
//    REPropertyAnimationTimingEaseOut,
//    REPropertyAnimationTimingEaseInEaseOut
//} REPropertyAnimationTiming;

typedef NS_ENUM(NSUInteger, REPropertyAnimationTiming) {
    REPropertyAnimationTimingLinear        = 1 <<  0,
    REPropertyAnimationTimingEaseIn        = 1 <<  1,
    REPropertyAnimationTimingEaseOut       = 1 <<  2,
    REPropertyAnimationTimingEaseInEaseOut = 1 <<  3,
    TPPropertyAnimationOptionRepeat         = 1 << 4,
};

typedef void(^MyCompletionBlock)(void);

@interface REPropertyAnimation : REObject {
    NSString *keyPath;
    id target;
    id delegate;
    CGFloat duration;
    CGFloat startDelay;
    REPropertyAnimationTiming timing;
    REPropertyAnimation *chainedAnimation;
    id fromValue;
    id toValue;
    
    @private
    NSTimeInterval startTime;
}

// Create a new animation
+ (REPropertyAnimation*)propertyAnimationWithKeyPath:(NSString*)keyPath;

// Get all animations for the given target object (if there are no animations, will return an empty array)
// You can then cancel all animations for a target by calling [[TPPropertyAnimation allPropertyAnimationsForTarget:object] makeObjectsPerformSelector:@selector(cancel)]
+ (NSArray*)allPropertyAnimationsForTarget:(id)target;

- (void (^)(void))completionBlock;
- (void)setCompletionBlock:(void (^)(void))block;

// Start the animation
- (void)beginWithTarget:(id)target;

// Cancel the animation
- (void)cancel;

@property (nonatomic, retain) id delegate;
@property (nonatomic, retain) id target;
@property (nonatomic, readonly) NSString *keyPath;
@property (nonatomic, assign) CGFloat duration;
@property (nonatomic, assign) CGFloat startDelay;
@property (nonatomic, retain) id fromValue;
@property (nonatomic, retain) id toValue;
@property (nonatomic, assign) REPropertyAnimationTiming timing;
@property (nonatomic, retain) REPropertyAnimation *chainedAnimation;
@property (nonatomic, copy) MyCompletionBlock completionBlock;
@end

// Implement this to act as a delegate
@protocol REPropertyAnimationDelegate
//@interface NSObject (TPPropertyAnimationDelegate)
- (void)willBeginPropertyAnimation:(REPropertyAnimation*)propertyAnimation;
- (void)propertyAnimationDidFinish:(REPropertyAnimation*)propertyAnimation;
@end