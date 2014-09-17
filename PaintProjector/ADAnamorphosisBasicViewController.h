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
@property (weak, nonatomic) IBOutlet UIPageControl *lifeArtPageControl;
@property (weak, nonatomic) IBOutlet UICollectionView *lifeArtCollectionView;

@property (strong, nonatomic) IBOutletCollection(UITextView) NSArray *introductionTextViews;
@property (weak, nonatomic) IBOutlet UITextView *introduction0TextView;
@property (weak, nonatomic) IBOutlet UITextView *introduction1TextView;
@property (weak, nonatomic) IBOutlet UITextView *introduction2TextView;
@property (weak, nonatomic) IBOutlet UITextView *introduction3TextView;
@property (weak, nonatomic) IBOutlet UITextView *introduction4TextView;
@property (weak, nonatomic) IBOutlet UITextView *introduction5TextView;
@property (weak, nonatomic) IBOutlet UITextView *introduction6TextView;

@property (weak, nonatomic) IBOutlet UITextView *lifeArt0TextView;
@property (weak, nonatomic) IBOutlet UITextView *lifeArt1TextView;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (strong, nonatomic) IBOutletCollection(UITextView) NSArray *lifeArtTextViews;
- (IBAction)DoneButtonTouchUp:(id)sender;

@end

@protocol ADAnamorphosisBasicViewControllerDelegate
- (void)willTutorialAnamorphosisBasicDone;
@end