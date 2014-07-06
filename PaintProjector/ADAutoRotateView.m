//
//  AutoRotateView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 5/2/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADAutoRotateView.h"

@implementation ADAutoRotateView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
