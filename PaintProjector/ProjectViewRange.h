//
//  ProjectViewRange.h
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-7-13.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProjectViewRange : UIView
@property (assign, nonatomic) CGPoint viewHeightPoint;
@property (assign, nonatomic) CGPoint projectNearPoint;
@property (assign, nonatomic) CGPoint projectFarPoint;
@property (assign, nonatomic) CGPoint virtualTopPoint;
@end
