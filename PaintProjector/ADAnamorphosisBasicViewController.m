//
//  ADAnamorphosisBasicViewController.m
//  PaintProjector
//
//  Created by 胡 文杰 on 9/8/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADAnamorphosisBasicViewController.h"
#import "ADPaintCollectionViewController.h"
#import "ADTutorialArtCollectionViewCell.h"
#import "ADTextPopAnimator.h"

@interface ADAnamorphosisBasicViewController ()
@property (retain, nonatomic) NSMutableArray *sloganCharacterSrcFrames;
@property (retain, nonatomic) ADTextPopAnimator *galleryTextPopAnimator;
@property (retain, nonatomic) ADTextPopAnimator *lifeArtTextPopAnimator;
@end

@implementation ADAnamorphosisBasicViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //localize text
    for (UITextView *textView in self.introductionTextViews) {
        NSString *text = [NSString stringWithFormat:@"TutorialAnamorphosisIntroduction%d", textView.tag];
        NSString *localizedText = NSLocalizedString(text, nil);
        textView.text = localizedText;
    }
    for (UITextView *textView in self.lifeArtTextViews) {
        NSString *text = [NSString stringWithFormat:@"TutorialAnamorphosisInLife%d", textView.tag];
        NSString *localizedText = NSLocalizedString(text, nil);
        textView.text = localizedText;
    }
    
    self.sloganCharacterSrcFrames = [[NSMutableArray alloc]init];
    for (UIView *view in self.sloganCharacters) {
        [self.sloganCharacterSrcFrames addObject:[NSValue valueWithCGRect:view.frame]];
    }

    self.galleryArtCollectionView.backgroundColor = [UIColor clearColor];
    self.galleryArtPageControl.numberOfPages = [self.galleryArtCollectionView numberOfItemsInSection:0];
    self.lifeArtCollectionView.backgroundColor = [UIColor clearColor];
    self.lifeArtPageControl.numberOfPages = ceilf([self.lifeArtCollectionView numberOfItemsInSection:0] * 0.5);
    
    self.galleryTextPopAnimator = [[ADTextPopAnimator alloc]initWithTextView:self.introductionTextViews];
    self.lifeArtTextPopAnimator = [[ADTextPopAnimator alloc]initWithTextView:self.lifeArtTextViews];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.destinationViewController isKindOfClass:[ADPaintCollectionViewController class]] ) {
        
    }
}
- (IBAction)DoneButtonTouchUp:(id)sender{
    [RemoteLog logAction:@"TutorialAnamorphosisBasicDoneButtonTouchUp" identifier:sender];
    
//    [self.navigationController popToRootViewControllerAnimated:true];
    if (self.delegate) {
        [self.delegate willTutorialAnamorphosisBasicDone];
    }
}

-(UIView*)characterViewInSloganViews:(NSArray*)views byTag:(NSInteger)tag{
    UIView *targetView = nil;
    for (UIView *view in views) {
        if (view.tag == tag) {
            targetView = view;
            break;
        }
    }
    return targetView;
}

- (void)transitionFromSloganToSlogan2ByPercentage:(CGFloat)percentage{
    for (int i = 0; i < self.sloganCharacters.count; ++i) {
        UIView *view = self.sloganCharacters[i];
        CGRect srcFrame = ((NSValue*)(self.sloganCharacterSrcFrames[i])).CGRectValue;
        UIView *targetView = [self characterViewInSloganViews:self.sloganCharacters2 byTag:view.tag];
        if (targetView) {
            CGRect destFrame = targetView.frame;
            [view setFrameLerpFromRect:srcFrame toRect:destFrame percentage:percentage];
        }
    }
    
    //rotate i to !
    NSInteger count = self.sloganCharacters.count;
    UIView *i = self.sloganCharacters[count - 2];
    i.layer.transform = CATransform3DMakeRotation(M_PI * percentage, 1, 0, 0);
}

#pragma mark- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (collectionView.tag == 1) {
        return 7;
    }
    else if (collectionView.tag == 2) {
        return 4;
    }
    else{
        return 0;
    }
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    ADTutorialArtCollectionViewCell *cell = nil;
    
    if (collectionView.tag == 1) {
        NSString *cellIdentifier = @"TutorialArtCollectionViewCell";
        cell = (ADTutorialArtCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];

        // Configure the cell...
        NSString *imageName = nil;
        NSString *authorName = nil;
        switch (indexPath.row) {
            case 0:
                imageName = @"tutorial_gallery_orosz_01.png";
                authorName = @"Istvan Orosz";
                break;
            case 1:
                imageName = @"tutorial_gallery_orosz_02.png";
                authorName = @"Istvan Orosz";
                break;
            case 2:
                imageName = @"tutorial_gallery_orosz_03.png";
                authorName = @"Istvan Orosz";
                break;
            case 3:
                imageName = @"tutorial_gallery_orosz_04.png";
                authorName = @"Istvan Orosz";
                break;
            case 4:
                imageName = @"tutorial_gallery_dali_05.png";
                authorName = @"Salvador Dali";
                break;
            case 5:
                imageName = @"tutorial_gallery_jontyHurwitz_06.png";
                authorName = @"Jonty Hurwitz";
                break;
            case 6:
                imageName = @"tutorial_gallery_jontyHurwitz_07.png";
                authorName = @"Jonty Hurwitz";
                break;
            default:
                break;
        }
        
        cell.imageView.image = [UIImage imageNamed:imageName];
        cell.authorNameLabel.text = NSLocalizedString(authorName, nil);
    }
    else if (collectionView.tag == 2) {
        NSString *cellIdentifier = @"LifeArtCollectionViewCell";
        cell = (ADTutorialArtCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
        
        NSString *imageName = nil;
        NSString *imageNameLabel = nil;
        switch (indexPath.row) {
            case 0:
                imageName = @"tutorial_lifeart_01.png";
                imageNameLabel = @"TutorialAnamorphosisLifeArt0";
                break;
            case 1:
                imageName = @"tutorial_lifeart_02.png";
                imageNameLabel = @"TutorialAnamorphosisLifeArt1";
                break;
            case 2:
                imageName = @"tutorial_lifeart_03.png";
                imageNameLabel = @"TutorialAnamorphosisLifeArt2";
                break;
            case 3:
                imageName = @"tutorial_lifeart_04.png";
                imageNameLabel = @"TutorialAnamorphosisLifeArt3";
                break;

            default:
                break;
        }

        cell.imageView.image = [UIImage imageNamed:imageName];
        cell.imageNameLabel.text =  NSLocalizedString(imageNameLabel, nil);
        cell.imageNameLabel.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        cell.imageNameLabel.shadowOffset = CGSizeMake(0, 2);
    }
    else{
        return cell;
    }
    cell.frameView.layer.cornerRadius = 10;
    cell.shadowView.layer.shadowColor = [UIColor blackColor].CGColor;
    cell.shadowView.layer.shadowOpacity = 0.5;
    cell.shadowView.layer.shadowOffset = CGSizeMake(0, 2);
    cell.shadowView.layer.shadowRadius = 4;
    
    return cell;
}
#pragma mark- UICollectionViewDelegate

#pragma mark- ScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView.tag == 1) {
        CGSize contentSize = self.galleryArtCollectionView.contentSize;
        CGPoint contentOffset = self.galleryArtCollectionView.contentOffset;
        
        CGFloat contentSizePerPage = contentSize.width / (CGFloat)self.galleryArtPageControl.numberOfPages;
        CGFloat curPage = contentOffset.x / contentSizePerPage;
        curPage = MIN(MAX(0, curPage), self.galleryArtPageControl.numberOfPages-1);

        self.galleryArtPageControl.currentPage = floorf(curPage);
        [self.galleryTextPopAnimator popTextByPercentage:curPage];
    }
    else if (scrollView.tag == 2){
        CGSize contentSize = self.lifeArtCollectionView.contentSize;
        CGPoint contentOffset = self.lifeArtCollectionView.contentOffset;
        
        UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.lifeArtCollectionView.collectionViewLayout;
        CGFloat percentage = (contentOffset.x + layout.minimumLineSpacing) / ((contentSize.width + layout.minimumLineSpacing) * 0.5);
        percentage = MIN(MAX(percentage, 0), 1);
        [self transitionFromSloganToSlogan2ByPercentage:percentage];
        
        self.lifeArtPageControl.currentPage = floorf(percentage);
        [self.lifeArtTextPopAnimator popTextByPercentage:percentage];
    }
}

@end
