//
//  ADLaunchViewController.h
//  PaintProjector
//
//  Created by 胡 文杰 on 9/9/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADSimpleTutorialViewController.h"
#import "ADPaintCollectionViewController.h"
#import "ADLaunchToPaintCollectionTransitionManager.h"

@interface ADLaunchViewController : UIViewController
<ADSimpleTutorialViewControllerDelegate,
ADPaintCollectionViewControllerDelegate,
UIViewControllerTransitioningDelegate>
@property (nonatomic) ADLaunchToPaintCollectionTransitionManager *transitionManager;
@end
