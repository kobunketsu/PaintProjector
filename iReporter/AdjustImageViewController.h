//
//  AdjustImageViewController.h
//  iReporter
//
//  Created by 文杰 胡 on 13-2-3.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

//名称:
//描述:
//功能:

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "HandleGestureRecognizer.h"
@protocol AdjustImageDelegate
- (void) adjustImageDone:(UIImage*)image;
- (void) adjustImageViewControllerDismissed;
@end
@interface AdjustImageViewController : UIViewController
{
    float _adjustedScale;
    CGPoint _adjustedTranslate;    
}
- (IBAction)adjustDoneButtonTapped:(UIButton *)sender;
- (IBAction)handlePinchGRAdjustImageView:(id)sender;
- (IBAction)handlePanGRAdjustImageView:(UIPanGestureRecognizer *)sender;
@property (assign, nonatomic) id delegate;
@property (weak, nonatomic) IBOutlet UIButton *adjustImageDoneButton;
@end
