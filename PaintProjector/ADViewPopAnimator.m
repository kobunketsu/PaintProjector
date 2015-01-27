//
//  ADViewPopAnimator.m
//  PaintProjector
//
//  Created by kobunketsu on 10/10/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADViewPopAnimator.h"

@implementation ADViewPopAnimator
- (id)initWithView:(NSArray *)views{
    self = [super init];
    if (self) {
        _views = views;
    }
    return self;
}
- (void)popByPercentage:(CGFloat)percentage{
    //subclass implement
}
- (void)fadeOutByPercentage:(CGFloat)percentage{
    //subclass implement    
}
@end
