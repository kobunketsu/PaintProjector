//
//  CustomTouchUIView.h
//  iReporter
//
//  Created by 文杰 胡 on 12-11-10.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

//名称:
//描述:
//功能:

#import <UIKit/UIKit.h>

@protocol CustomTouchUIViewDelegate

- (void) uiViewTouched:(BOOL)wasInside;

@end

@interface CustomTouchUIView : UIView 

// Properties
@property (nonatomic, assign) id delegate;

@end
