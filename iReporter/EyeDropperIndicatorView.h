//
//  EyeDropperIndicatorView.h
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-13.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EyeDropperIndicatorView : UIView
{
    UIColor *_color;
}

- (UIColor *)color;

- (void)setColor:(UIColor *)newValue;

@end
