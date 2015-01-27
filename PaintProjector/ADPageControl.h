//
//  ADPageControl.h
//  PaintProjector
//
//  Created by kobunketsu on 9/27/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADPageControl : NSObject
@property (retain, nonatomic) UIButton *nextButton;
@property (retain, nonatomic) UIButton *previousButton;
- (id)initWithScrollView:(UIScrollView*)scrollView size:(CGSize)size;
- (void)initCustom;
- (void)nextButtonTouchUp:(id)sender;
- (void)previousButtonTouchUp:(id)sender;
@end
