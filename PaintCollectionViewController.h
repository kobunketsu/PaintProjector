//
//  PaintCollectionViewController.h
//  PaintProjector
//
//  Created by 胡 文杰 on 1/22/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CylinderProjectViewController.h"

@class PaintScreen;
@protocol PaintScreenDelegate;

@class PaintDoc;
@protocol PaintCollectionViewControllerDelegate
- (void) willTransitionPaintDocToPreview:(PaintDoc*)paintDoc;
@end

@interface PaintCollectionViewController : UIViewController
<UICollectionViewDataSource,
UICollectionViewDelegate,
UIViewControllerTransitioningDelegate,
CylinderProjectViewControllerDelegate
>

@property (nonatomic, assign) id delegate;
@property (strong, nonatomic) IBOutlet UIView *rootView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIView *toolBar;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *editButtons;

#pragma mark- Tool Bar
- (IBAction)fileButtonTouchUp:(id)sender;

- (IBAction)copyButtonTouchUp:(id)sender;

- (IBAction)deleteButtonTouchUp:(id)sender;

- (IBAction)printButtonTouchUp:(id)sender;

- (IBAction)newButtonTouchUp:(id)sender;

- (IBAction)paintFrameViewTouchUp:(id)sender;
@end
