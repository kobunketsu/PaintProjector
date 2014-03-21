//
//  OpacitySlider.h
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-1.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuartzCore/QuartzCore.h"
@interface OpacitySlider : UISlider
{
    UIColor* _color;
}
- (UIColor *)color;

- (void)setColor:(UIColor *)newValue;

@end
