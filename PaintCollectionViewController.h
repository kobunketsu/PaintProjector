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
@protocol PaintScreenDelegate;

@class PaintDoc;
@protocol PaintCollectionViewControllerDelegate
- (void) willTransitionPaintDocToPreview:(PaintDoc*)paintDoc;
@end

@interface PaintCollectionViewController : UIViewController
<UICollectionViewDataSource,
UICollectionViewDelegate,
CylinderProjectViewControllerDelegate,
UIViewControllerTransitioningDelegate
>

@property (assign, nonatomic) id delegate;
@property (strong, nonatomic) IBOutlet UIView *rootView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIView *toolBar;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *editButtons;
//显示作品管理器
@property (retain, nonatomic) PaintFrameManager *paintFrameManager;
#pragma mark- Tool Bar
- (IBAction)fileButtonTouchUp:(id)sender;

- (IBAction)copyButtonTouchUp:(id)sender;

- (IBAction)deleteButtonTouchUp:(id)sender;

- (IBAction)printButtonTouchUp:(id)sender;

- (IBAction)newButtonTouchUp:(id)sender;

@end
