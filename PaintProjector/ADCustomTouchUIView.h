//
//  CustomTouchUIView.h
//  PaintProjector
//
//  Created by 文杰 胡 on 12-11-10.
//  Copyright (c) 2012年 Hu Wenjie. All rights reserved.
//

//名称:
//描述:
//功能:

#import <UIKit/UIKit.h>

@protocol ADCustomTouchUIViewDelegate

- (void) uiViewTouched:(BOOL)wasInside;

@end

@interface ADCustomTouchUIView : UIView 

// Properties
@property (assign, nonatomic) id delegate;

@end
