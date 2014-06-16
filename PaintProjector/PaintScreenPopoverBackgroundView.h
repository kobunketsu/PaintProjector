//
//  PaintScreenPopoverBackgroundView.h
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-11.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

// 使用额外的arrowView来组装成一个带有尖头的UIView,如果碰到剪头和本体需要很好融合的情况，则无法实现效果

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
