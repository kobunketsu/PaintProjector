//
//  PaintCollectionViewController.h
//  PaintProjector
//
//  Created by 胡 文杰 on 1/22/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADCylinderProjectViewController.h"
#import "ADPaintFrameManager.h"
#import "ADPaintFrameTransitionManager.h"
#import "ADTutorialStep.h"
#import "ADRootCanvasView.h"
#import "ADRootCanvasBackgroundView.h"

#define PaintFrameFadeOutScale 0.9

@protocol ADPaintScreenDelegate;

@class ADPaintDoc;
@protocol ADPaintCollectionViewControllerDelegate
- (void) willTransitionPaintDocToPreview:(ADPaintDoc*)paintDoc;
@end

@interface ADPaintCollectionViewController : UIViewController
<UICollectionViewDataSource,
UICollectionViewDelegate,
UIViewControllerTransitioningDelegate,
ADCylinderProjectViewControllerDelegate,
ADPaintFrameTransitionManagerDelegate,
ADTutorialStepDelegate
>

@property (assign, nonatomic) id delegate;
@property (strong, nonatomic) IBOutlet ADCylinderProjectRootView *rootView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet ADDownToolBar *downToolBar;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *editButtons;
@property (weak, nonatomic) IBOutlet UIButton *editNewButton;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (assign, nonatomic) NSInteger numberOfPaintPerPage;
//是否启动自动转换
@property (assign, nonatomic) BOOL isLaunchTransitioned;
@property (retain, nonatomic) UIImageView *launchImageView;
-(void)launchTransitionToCylinderProjectCompleted;
    
//显示作品管理器
@property (weak, nonatomic) ADPaintFrameView *curPaintFrameView;

- (IBAction)pageControlValueChanged:(UIPageControl *)sender;
#pragma mark- Tool Bar
- (IBAction)fileButtonTouchUp:(id)sender;

- (IBAction)copyButtonTouchUp:(id)sender;

- (IBAction)deleteButtonTouchUp:(id)sender;

- (IBAction)newButtonTouchUp:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *fileButton;

@end
