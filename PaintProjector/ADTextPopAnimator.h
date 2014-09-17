//
//  ADTextPopAnimator.h
//  PaintProjector
//
//  Created by kobunketsu on 9/14/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADTextSplitter.h"

@interface ADTextPopAnimator : NSObject
@property(retain, nonatomic) NSMutableArray *textSplitters;
- (id)initWithTextView:(NSArray *)textViews;
- (void)popTextByPercentage:(CGFloat)percentage;
@end
