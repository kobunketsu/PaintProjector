//
//  FuzzyTransparentView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-25.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "FuzzyTransparentView.h"
#import "UIImage+ImageEffects.h"
#import "Ultility.h"
@implementation FuzzyTransparentView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect
//{
//
//}

-(void)_updateFuzzyTransparent{
    DebugLog(@"_updateFuzzyTransparent");
    //TODO:增加如果sourceView没有发出过已经截取过图像的通知，则截取新的图像，并发出通知，保证其他FuzzyTransparentView不用再次截取图像,
    
    UIGraphicsBeginImageContextWithOptions(self.frame.size, false, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGPoint pointInView = [self convertPoint:self.bounds.origin toView:self.sourceView];
	CGContextTranslateCTM(context, -pointInView.x, -pointInView.y);
    [self.sourceView drawViewHierarchyInRect:self.sourceView.bounds afterScreenUpdates:false];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();    //origin downleft

//	CGContextTranslateCTM(context, pointInView.x, pointInView.y);
    UIGraphicsEndImageContext();

    UIImage *flippedImage = [newImage flipVertically];
    
    [self.delegate willSnapshotUIImageEnd:flippedImage];
    
    //暂时取消半透明
//    UIImage *blurredImage = [flippedImage applyLightEffect];

//    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
//        self.layer.backgroundColor = [UIColor colorWithPatternImage:blurredImage].CGColor;
//    } completion:nil];
    
    //取消白色，采用drawRect
//    self.layer.backgroundColor = [UIColor whiteColor].CGColor;
}

- (void)updateFuzzyTransparentFromView:(UIView*)view{
//    [self removeFuzzyTransparent];
//    [self setFuzzyTransparentSourceView:view];
}

- (void)removeFuzzyTransparent{
    //暂时取消半透明
//    self.layer.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0].CGColor;
    
//    self.layer.backgroundColor = [UIColor whiteColor].CGColor;
    
//    [self.delegate willRemoveFuzzyTransparentEnd];
}

- (void)setFuzzyTransparentSourceView:(UIView*)view{
    self.sourceView = view;
    [self _updateFuzzyTransparent];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    if (self.sourceView != nil) {
        [self _updateFuzzyTransparent];
    }
    
}
@end
