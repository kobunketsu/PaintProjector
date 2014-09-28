//
//  ADHelpViewController.h
//  PaintProjector
//
//  Created by 胡 文杰 on 9/10/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADHelpViewController : UIViewController
<UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
- (IBAction)nextPageButtonTouchUp:(UIButton *)sender;
- (IBAction)previousPageButtonTouchUp:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *previousPageButton;
@property (weak, nonatomic) IBOutlet UIButton *nextPageButton;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@end
