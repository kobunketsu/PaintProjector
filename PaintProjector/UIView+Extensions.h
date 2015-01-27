//
//  UIView+Extensions.h
//  PaintProjector
//
//  Created by 胡 文杰 on 6/18/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extensions)
- (void)adjustInRect:(CGRect)rect;

//混合位置
- (void)setFrameLerpFromRect:(CGRect)fromRect toRect:(CGRect)toRect percentage:(CGFloat)percentag;

- (void)debugSubviewHierachy;

- (void)setFrameOriginX:(CGFloat)originX;

- (void)setFrameOriginY:(CGFloat)originY;

- (void)setFrameOrigin:(CGPoint)origin;

- (void)setFrameSizeWidth:(CGFloat)width;

- (void)setFrameSizeHeight:(CGFloat)height;

- (void)setFrameSize:(CGSize)size;

- (void)setCenterX:(CGFloat)x;

- (void)setCenterY:(CGFloat)y;

- (void)spinViewAngle:(CGFloat)angle keyPath:(NSString *)keyPath duration:(CGFloat)duration delay:(CGFloat)delay option:(UIViewKeyframeAnimationOptions)option completion:(void (^)(BOOL finished))completion;

- (UIImage*)snapshotImageAfterScreenUpdate:(BOOL)afterScreenUpdates;
@end
