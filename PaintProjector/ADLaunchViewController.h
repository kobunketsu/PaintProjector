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
#import "ADLaunchLogoView.h"

#import "ADTransformContentView.h"
@interface ADLaunchViewController : UIViewController
<ADSimpleTutorialViewControllerDelegate,
ADPaintCollectionViewControllerDelegate,
UIViewControllerTransitioningDelegate>
@property (nonatomic) ADLaunchToPaintCollectionTransitionManager *transitionManager;

@property (weak, nonatomic) IBOutlet UIView *title_A1_Ana;
@property (weak, nonatomic) IBOutlet UIView *title_n_Ana;
@property (weak, nonatomic) IBOutlet UIView *title_a2_Ana;
@property (weak, nonatomic) IBOutlet UIView *title_D_Draw;
@property (weak, nonatomic) IBOutlet UIView *title_r_Draw;
@property (weak, nonatomic) IBOutlet UIView *title_a_Draw;
@property (weak, nonatomic) IBOutlet UIView *title_pencil;
@property (weak, nonatomic) IBOutlet UIView *title_w_Draw;


@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *title_characters;

@end
