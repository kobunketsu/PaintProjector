//
//  PaintUIKitAnimation.h
//  PaintProjector
//
//  Created by 胡 文杰 on 1/22/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface PaintUIKitAnimation : NSObject

+ (void)view:(UIView*)view switchDownToolBarFromView:(UIView*)fromView completion: (void (^) (void))block1 toView:(UIView*)toView completion: (void (^) (void)) block2;

+ (void)view:(UIView*)view switchTopToolBarFromView:(UIView*)fromView completion: (void (^) (void))block1 to:(UIView*)toView completion: (void (^) (void)) block2;
@end
