//
//  ADAnamorphosisBasicViewController.h
//  PaintProjector
//
//  Created by 胡 文杰 on 9/8/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADAnamorphosisBasicViewController : UIViewController
<UICollectionViewDataSource,
UICollectionViewDelegate>

@property (assign, nonatomic) id delegate;

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *sloganCharacters;

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *sloganCharacters2;
@property (weak, nonatomic) IBOutlet UICollectionView *galleryArtCollectionView;
@property (weak, nonatomic) IBOutlet UIPageControl *galleryArtPageControl;
@property (weak, nonatomic) IBOutlet UICollectionView *lifeArtCollectionView;
@property (strong, nonatomic) IBOutletCollection(UITextView) NSArray *introductionTextViews;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
//@property (strong, nonatomic) IBOutletCollection(UITextView) NSArray *lifeArtTextViews;
//@property (weak, nonatomic) IBOutlet UIPageControl *lifeArtPageControl;
- (IBAction)doneButtonTouchUpOutside:(id)sender;
- (IBAction)DoneButtonTouchUp:(id)sender;
- (IBAction)doneButtonTouchDown:(id)sender;
- (IBAction)doneButtonTouchCancel:(id)sender;

@end

@protocol ADAnamorphosisBasicViewControllerDelegate
- (void)willTutorialAnamorphosisBasicDone;
@end