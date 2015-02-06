//
//  AutoRotateButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-7-6.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADAutoRotateButton.h"

@implementation ADAutoRotateButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
//        _baseColor = [UIColor whiteColor].CGColor;
    }
    return self;
}

+ (Class)layerClass
{
	return [ADCustomLayer class];
}

- (void)setOrientation:(UIDeviceOrientation)orientation{
    _orientation = orientation;
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        switch (self.orientation) {
            case UIDeviceOrientationLandscapeLeft:
                self.transform = CGAffineTransformMakeRotation((self.isInterfacePortraitUpsideDown? -1:1) * M_PI / 2.0);
                break;
            case UIDeviceOrientationLandscapeRight:
                self.transform = CGAffineTransformMakeRotation((self.isInterfacePortraitUpsideDown? 1:-1) * M_PI / 2.0);
                break;
            case UIDeviceOrientationPortrait:
                self.transform = CGAffineTransformMakeRotation(0);
                break;
            case UIDeviceOrientationPortraitUpsideDown:
                //使用app autoRotate
                self.transform = CGAffineTransformMakeRotation(0);
//                self.transform = CGAffineTransformMakeRotation(M_PI);
                break;
            default:
                //keep orientation
                break;
        }
    } completion:nil];

}

-(void)setHighlighted:(BOOL)highlighted{
    [super setHighlighted:highlighted];
    [self.layer setNeedsDisplay];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.titleLabel.textColor = [ADSharedUIStyleKit cText];
    self.titleEdgeInsets = UIEdgeInsetsMake(68, 0, 0, 0);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
