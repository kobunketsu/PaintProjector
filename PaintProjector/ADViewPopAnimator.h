//
//  ADViewPopAnimator.h
//  PaintProjector
//
//  Created by kobunketsu on 10/10/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADViewPopAnimator : NSObject
- (id)initWithView:(NSArray *)views;
@property(retain, nonatomic) NSArray *views;
- (void)popByPercentage:(CGFloat)percentage;
- (void)fadeOutByPercentage:(CGFloat)percentage;
@end
