//
//  ShowPaintOnPlaneViewController.h
//  PaintProjector
//
//  Created by 文杰 胡 on 12-12-16.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

//名称:展示转换图控制器
//描述:从顶部显示转换图，支持手势缩放移动画面
//功能:

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ShowPaintOnPlane.h"
@interface ShowPaintOnPlaneViewController : UIViewController
{
    CGFloat currentTranslateX;
    CGFloat currentTranslateY;    
    CGFloat currentScale;    
}

@property (weak, nonatomic) IBOutlet UIView *btnScene;
@property (weak, nonatomic) IBOutlet UILabel *lbLength;
@property (weak, nonatomic) IBOutlet UILabel *lbWidth;
@property (weak, nonatomic) IBOutlet ShowPaintOnPlane *showPaintOnPlane;
@property (retain, nonatomic) UIImage* paintImage;
- (IBAction)hanlePanGRShowPaintOnPlane:(UIPanGestureRecognizer *)sender;
- (IBAction)handlePinchGRShowPaintOnPlane:(UIPinchGestureRecognizer *)sender;
- (IBAction)handleSceneButtonTapped:(UIButton *)sender;
@end
