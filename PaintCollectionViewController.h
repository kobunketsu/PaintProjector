//
//  PaintCollectionViewController.h
//  PaintProjector
//
//  Created by 胡 文杰 on 1/22/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CylinderProjectViewController.h"
#import "PaintFrameManager.h"
#import "PaintFrameTransitionManager.h"
@protocol PaintScreenDelegate;

@class PaintDoc;
@protocol PaintCollectionViewControllerDelegate
- (void) willTransitionPaintDocToPreview:(PaintDoc*)paintDoc;
@end

@interface PaintCollectionViewController : UIViewController
<UICollectionViewDataSource,
UICollectionViewDelegate,
UIViewControllerTransitioningDelegate,
CylinderProjectViewControllerDelegate,
PaintFrameTransitionManagerDelegate
>

@property (assign, nonatomic) id delegate;
@property (strong, nonatomic) IBOutlet UIView *rootView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIView *toolBar;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *editButtons;
@property (weak, nonatomic) IBOutlet UIButton *editNewButton;

//是否启动自动转换
@property (assign, nonatomic) BOOL isLaunchTransitioned;
@property (retain, nonatomic) UIImageView *launchImageView;
-(void)launchTransitionToCylinderProjectCompleted;
    
//显示作品管理器
@property (retain, nonatomic) PaintFrameManager *paintFrameManager;
#pragma mark- Tool Bar
- (IBAction)fileButtonTouchUp:(id)sender;

- (IBAction)copyButtonTouchUp:(id)sender;

- (IBAction)deleteButtonTouchUp:(id)sender;

- (IBAction)newButtonTouchUp:(id)sender;

@end
