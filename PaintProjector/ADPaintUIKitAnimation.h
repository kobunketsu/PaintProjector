//
//  PaintUIKitAnimation.h
//  PaintProjector
//
//  Created by 胡 文杰 on 1/22/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class ADDownToolBar;
@class ADTopToolBar;

@interface ADPaintUIKitAnimation : NSObject

+ (void)view:(UIView*)view switchDownToolBarFromView:(ADDownToolBar*)fromView completion: (void (^) (void))block1 toView:(ADDownToolBar*)toView completion: (void (^) (void)) block2;

+ (void)view:(UIView*)view switchTopToolBarFromView:(ADTopToolBar*)fromView completion: (void (^) (void))block1 toView:(ADTopToolBar*)toView completion: (void (^) (void)) block2;

+ (void)view:(UIView*)view slideToolBarRightDirection:(BOOL)right outView:(UIView*)outView inView:(UIView*)inView completion: (void (^) (void)) block1;
@end
