//
//  PaintCollectionViewController.h
//  PaintProjector
//
//  Created by 胡 文杰 on 1/22/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaintCollectionViewController : UIViewController
<UICollectionViewDataSource, UICollectionViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *rootView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIView *categoryBar;
@property (weak, nonatomic) IBOutlet UIView *toolBar;

#pragma mark- Category Bar
- (IBAction)myArtworkButtonTouchUp:(id)sender;

#pragma mark- Tool Bar
- (IBAction)backButtonTouchUp:(id)sender;

- (IBAction)newButtonTouchUp:(id)sender;

- (IBAction)copyButtonTouchUp:(id)sender;

- (IBAction)deleteButtonTouchUp:(id)sender;

- (IBAction)printButtonTouchUp:(id)sender;

- (IBAction)paintButtonTouchUp:(id)sender;

@end
