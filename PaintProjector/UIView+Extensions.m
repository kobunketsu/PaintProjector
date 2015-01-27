//
//  UIView+Extensions.m
//  PaintProjector
//
//  Created by 胡 文杰 on 6/18/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "UIView+Extensions.h"

@implementation UIView (Extensions)
//如果超出显示边界, 自动调整到边界内
- (void)adjustInRect:(CGRect)rect{
    //首先检查是否宽度高度大于外框
    CGRect frame = self.frame;
    frame.size.width = MIN(frame.size.width, rect.size.width);
    frame.size.height = MIN(frame.size.height, rect.size.height);
    
    //检查是否超出边界,按照左上右下的顺序
    frame.origin.x = MAX(frame.origin.x, rect.origin.x);
    frame.origin.y = MAX(frame.origin.y, rect.origin.y);
    frame.origin.x = MIN(frame.origin.x + frame.size.width, rect.origin.x + rect.size.width) - frame.size.width;
    frame.origin.y = MIN(frame.origin.y + frame.size.height, rect.origin.y + rect.size.height) - frame.size.height;
    self.frame = frame;
}

- (void)setFrameLerpFromRect:(CGRect)fromRect toRect:(CGRect)toRect percentage:(CGFloat)percentage{
    CGRect frame = CGRectZero;
    frame.origin.x = fromRect.origin.x * (1.0 - percentage) + toRect.origin.x * percentage;
    frame.origin.y = fromRect.origin.y * (1.0 - percentage) + toRect.origin.y * percentage;
    frame.size.width = fromRect.size.width * (1.0 - percentage) + toRect.size.width * percentage;
    frame.size.height = fromRect.size.height * (1.0 - percentage) + toRect.size.height * percentage;
    self.frame = frame;
}

- (void)debugSubviewHierachy{
    if (self.backgroundColor) {
        const CGFloat *colors = CGColorGetComponents(self.backgroundColor.CGColor);
        DebugLog(@"view :%@ r %.1f g %.1f b %.1f", self, colors[0], colors[1], colors[2]);
    }
    
    for (UIView *view in self.subviews) {
        [view debugSubviewHierachy];
    }
}

- (void)setFrameOriginX:(CGFloat)originX{
    CGRect frame = self.frame;
    frame.origin.x = originX;
    self.frame = frame;
}

- (void)setFrameOriginY:(CGFloat)originY{
    CGRect frame = self.frame;
    frame.origin.y = originY;
    self.frame = frame;
}

- (void)setFrameSizeWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setFrameSizeHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setFrameOrigin:(CGPoint)origin{
    CGRect frame = self.frame;
    frame.origin.x = origin.x;
    frame.origin.y = origin.y;
    self.frame = frame;
}
- (void)setFrameSize:(CGSize)size{
    CGRect frame = self.frame;
    frame.size.width = size.width;
    frame.size.height = size.height;
    self.frame = frame;
}

- (void)setCenterX:(CGFloat)x{
    CGPoint center = self.center;
    center.x = x;
    self.center = center;
}

- (void)setCenterY:(CGFloat)y{
    CGPoint center = self.center;
    center.y = y;
    self.center = center;
}

//MARK: dont support angle over M_2_PI
- (void)spinViewAngle:(CGFloat)angle keyPath:(NSString *)keyPath duration:(CGFloat)duration delay:(CGFloat)delay option:(UIViewKeyframeAnimationOptions)option completion:(void (^)(BOOL finished))completion{
    
    CGFloat curAngle = ((NSNumber *)[self.layer valueForKeyPath:keyPath]).floatValue;
    CGFloat count = (angle - curAngle) / DEGREES_TO_RADIANS(120);
    CGFloat fracAngle = count - floorf(count);
    
    [UIView animateKeyframesWithDuration:duration delay:0.0
                                 options:UIViewKeyframeAnimationOptionCalculationModeLinear | UIViewAnimationOptionCurveLinear
                              animations:^{
                                  for (NSInteger i = 0; i < floorf(count); ++i) {
                                      [UIView addKeyframeWithRelativeStartTime:((CGFloat)i / count) relativeDuration:(1.0 / count) animations:^{
                                          [self.layer setValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(120) * (i + 1)] forKeyPath:keyPath];
                                      }];
                                  }
                                  
                                  [UIView addKeyframeWithRelativeStartTime:(floorf(count) / count) relativeDuration:(fracAngle / count) animations:^{
                                      [self.layer setValue:[NSNumber numberWithFloat:angle] forKeyPath:keyPath];
                                  }];
                              }
                              completion:^(BOOL finished) {}];
    
}

- (UIImage*)snapshotImageAfterScreenUpdate:(BOOL)afterScreenUpdates{
    UIGraphicsBeginImageContextWithOptions(self.frame.size, false, 0);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:afterScreenUpdates];
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();    //origin downleft
    UIGraphicsEndImageContext();
    return image;
}
@end
