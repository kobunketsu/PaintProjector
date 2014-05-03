//
//  PaintScreenPopoverBackgroundView.h
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-11.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaintScreenPopoverBackgroundView : UIPopoverBackgroundView
{
    UIImageView *_borderImageView;
//    UIImageView *_arrowView;
    UIView *_arrowView;
    CGFloat _arrowOffset;
    UIPopoverArrowDirection _arrowDirection;
}
@end
