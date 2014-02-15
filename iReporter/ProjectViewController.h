//
//  ProjectViewController.h
//  iReporter
//
//  Created by 胡 文杰 on 13-3-16.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

//名称: 投影绘图控制器
//描述: 将图片按照角度投影到Quad上，并从顶部正交显示转换后的图片
//功能: 动态调节角度

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "ProjectGLKViewController.h"



@interface ProjectViewController : UIViewController
<
MFMailComposeViewControllerDelegate
>
{
    ProjectGLKViewController *_glkViewController;
    

}
- (IBAction)close:(UIButton *)sender;

@property (nonatomic, retain) ProjectGLKViewController *glkViewController;

@property (strong, nonatomic) IBOutlet UISlider *projectSlider;
@property (strong, nonatomic) IBOutlet UISlider *farDistanceSlider;
@property (strong, nonatomic) IBOutlet UISlider *heightSlider;
@property (strong, nonatomic) IBOutlet UILabel *farDistanceLabel;
@property (strong, nonatomic) IBOutlet UILabel *heightLabel;

- (IBAction)adjustEyeSliderSlide:(UISlider *)sender;
- (IBAction)farDistanceSliderSlide:(UISlider *)sender;
- (IBAction)heightSliderSlide:(UISlider *)sender;
- (IBAction)showBackgroundButtonTapped:(UIButton *)sender;
- (IBAction)showGridButtonTapped:(UIButton *)sender;
- (IBAction)exportButtonTapped:(UIButton *)sender;
- (IBAction)handleTapPaintProjectViewGesture:(UITapGestureRecognizer *)sender;


@end
