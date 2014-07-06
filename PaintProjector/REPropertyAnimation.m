//
//  TPPropertyAnimation.m
//  Property Animation http://atastypixel.com/blog/key-path-based-property-animation
//
//  Created by Michael Tyson on 13/08/2010.
//  Copyright 2010 A Tasty Pixel. All rights reserved.
//

#import "REPropertyAnimation.h"
#import <QuartzCore/QuartzCore.h>
#import <GLKit/GLKit.h>

#define kRefreshRate 1.0/30.0

// Storage for singleton manager
@class REPropertyAnimationManager;
static REPropertyAnimationManager *__manager = nil;

// Manager declaration
@class REPropertyAnimation;
@interface REPropertyAnimationManager : NSObject {
    id timer;
    NSMutableArray *animations;
}
+ (REPropertyAnimationManager*)manager;
- (NSArray*)allPropertyAnimationsForTarget:(id)target;
- (void)update:(id)sender;
- (void)addAnimation:(REPropertyAnimation*)animation;
- (void)removeAnimation:(REPropertyAnimation*)animation;
@end

@interface REPropertyAnimation ()
@property (nonatomic, readonly) NSTimeInterval startTime;
@end

// Main class
@implementation REPropertyAnimation
@synthesize target, delegate, keyPath, duration, timing, fromValue, toValue, chainedAnimation, startTime, startDelay;

- (id)initWithKeyPath:(NSString*)theKeyPath {
    if ( !(self = [super init]) ) return nil;
    keyPath = theKeyPath;
    timing = REPropertyAnimationTimingEaseInEaseOut;
    duration = 0.5;
    startDelay = 0.0;
    return self;
}

+ (REPropertyAnimation*)propertyAnimationWithKeyPath:(NSString*)keyPath {
    return [[REPropertyAnimation alloc] initWithKeyPath:keyPath];
}

+ (NSArray*)allPropertyAnimationsForTarget:(id)target {
    return [[REPropertyAnimationManager manager] allPropertyAnimationsForTarget:target];
}

- (void)begin {
    [self.delegate willBeginPropertyAnimation:self];
    
    startTime = [NSDate timeIntervalSinceReferenceDate];
    
    if ( !fromValue ) {
        self.fromValue = [target valueForKeyPath:keyPath];
    }
    
    [[REPropertyAnimationManager manager] addAnimation:self];
}

- (void)beginWithTarget:(id)theTarget {
    self.target = theTarget;
    [self begin];
}

- (void)cancel {
    [[REPropertyAnimationManager manager] removeAnimation:self];
}

- (void)dealloc {
    self.target = nil;
    self.delegate = nil;
    self.chainedAnimation = nil;
    self.fromValue = nil;
    self.toValue = nil;
}

@end


#pragma mark -
#pragma mark Timing


static inline CGFloat funcLinear(CGFloat ft, CGFloat f0, CGFloat f1) {
	return f0 + (f1 - f0) * ft;	
}

static inline CGFloat funcQuad(CGFloat ft, CGFloat f0, CGFloat f1) {
	return f0 + (f1 - f0) * ft * ft;
}

static inline CGFloat funcQuadInOut(CGFloat ft, CGFloat f0, CGFloat f1) {
    CGFloat a = ((f1 - f0)/2.0);
    if ( ft < 0.5 ) {
        return f0 + a * (2*ft)*(2*ft);
    } else {
        CGFloat b = ((2*ft) - 2);
        return f0 + a + ( a * (1 - (b*b)) );
    }
}

static inline CGFloat funcQuadOut(CGFloat ft, CGFloat f0, CGFloat f1) {
	return f0 + (f1 - f0) * (1.0 - (ft-1.0)*(ft-1.0));
}


#pragma mark -
#pragma mark Manager


@implementation REPropertyAnimationManager

+ (REPropertyAnimationManager*)manager {
    if ( !__manager ) {
        __manager = [[REPropertyAnimationManager alloc] init];
    }
    return __manager;
}

- (NSArray*)allPropertyAnimationsForTarget:(id)target {
    NSMutableArray *result = [NSMutableArray array];
    if ( animations ) {
        for ( REPropertyAnimation* animation in animations ) {
            if ( animation.target == target ) [result addObject:animation];
        }
    }
    return result;
}

- (void)addAnimation:(REPropertyAnimation *)animation {
    
    if ( !animations ) {
        animations = [[NSMutableArray alloc] init];
    }
    
    [animations addObject:animation];
    
    if ( !timer ) {
        if ( NSClassFromString(@"CADisplayLink") != NULL ) {
            timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(update:)];
            [timer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        } else {
            timer = [NSTimer scheduledTimerWithTimeInterval:kRefreshRate target:self selector:@selector(update:) userInfo:nil repeats:YES];
        }
    }
}

- (void)removeAnimation:(REPropertyAnimation *)animation {
    [animations removeObject:animation];
    
    if ( [animations count] == 0 ) {
        [timer invalidate]; timer = nil;
        __manager = nil;
    }
}

- (void)dealloc {
    if ( timer ) [timer invalidate];
}

- (void)update:(id)sender {
    NSTimeInterval now = [NSDate timeIntervalSinceReferenceDate];
    for ( REPropertyAnimation *animation in [animations copy] ) {
        
        if ( now < animation.startTime + animation.startDelay ) continue; // Animation hasn't started yet
        
        // Calculate proportion of time through animation, and the corresponding position given the timing function
        CGFloat time = (now - (animation.startTime+animation.startDelay)) / animation.duration;
        if ((animation.timing & TPPropertyAnimationOptionRepeat) == TPPropertyAnimationOptionRepeat) {
            time = fmodf(now - (animation.startTime+animation.startDelay), animation.duration);
            time /= animation.duration;
        }
        else{
            if ( time > 1.0 ) time = 1.0;
        }
        
        CGFloat position = time;
        if ((animation.timing & REPropertyAnimationTimingEaseIn) == REPropertyAnimationTimingEaseIn) {
            position = funcQuad(time, 0.0, 1.0);
        }
        else if ((animation.timing & REPropertyAnimationTimingEaseOut) == REPropertyAnimationTimingEaseOut) {
            position = funcQuadOut(time, 0.0, 1.0);
        }
        else if ((animation.timing & REPropertyAnimationTimingEaseInEaseOut) == REPropertyAnimationTimingEaseInEaseOut) {
            position = funcQuadInOut(time, 0.0, 1.0);
        }
        else if ((animation.timing & REPropertyAnimationTimingLinear) == REPropertyAnimationTimingLinear) {
        }
        
        // Determine interpolation between values given position
        id value = nil;
        if ( [animation.fromValue isKindOfClass:[NSNumber class]] ) {
            value = [NSNumber numberWithDouble:[animation.fromValue doubleValue] + (position*([animation.toValue doubleValue] - [animation.fromValue doubleValue]))];
        }
        else {
            NSLog(@"Unsupported property type %@", NSStringFromClass([animation.fromValue class]));
        }
        
        // Apply new value
        if ( value ) {
            [animation.target setValue:value forKeyPath:animation.keyPath];
        }
        
        if ( time >= 1.0 ) {
            // Animation has finished. Notify delegate, fire chained animation if there is one, and remove
            if (animation.completionBlock) {
                animation.completionBlock();
            }
            if ( animation.delegate ) {
                [animation.delegate propertyAnimationDidFinish:animation];
            }
            if ( animation.chainedAnimation ) {
                [animation.chainedAnimation begin];
            }
            [self removeAnimation:animation];
        }
    }
}
@end
