//
//  RadiusSlider.h
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-4.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADRadiusIndicatorView.h"
@interface ADRadiusSlider : UISlider
{
    ADRadiusIndicatorView *_indicatorView;
}
- (void)setValueByRadius:(CGFloat)radius;
- (CGFloat)radiusByValue;
@end
