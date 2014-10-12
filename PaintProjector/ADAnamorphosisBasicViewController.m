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
#import "ADTextSqueezePopAnimator.h"
#import "ADViewScalePopAnimator.h"
#import "ADViewRotatePopAnimator.h"

@interface ADAnamorphosisBasicViewController ()
@property (retain, nonatomic) NSMutableArray *sloganCharacterSrcFrames;
@property (retain, nonatomic) ADTextSqueezePopAnimator *galleryTextPopAnimator;
//@property (retain, nonatomic) ADTextSqueezePopAnimator *lifeArtTextPopAnimator;
@property (retain, nonatomic) ADViewScalePopAnimator *sloganViewPopAnimator;
@property (retain, nonatomic) ADViewScalePopAnimator *lifeArtViewPopAnimator;
@property (retain, nonatomic) ADViewRotatePopAnimator *lifeArtViewFadeAnimator;
@property (retain, nonatomic) NSMutableArray *lifeArtViews;
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
//在iOS8系统下textView位置需要调整
- (void)adjustForiOS8{
    for (UITextView *textView in self.introductionTextViews) {
        [textView setFrameOriginY:textView.frame.origin.y - 30];
    }
//    for (UITextView *textView in self.lifeArtTextViews) {
//        [textView setFrameOriginY:textView.frame.origin.y - 30];
//    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if([UIDevice currentDevice].systemVersion.floatValue >= 8.0){
        [self adjustForiOS8];
    }
    
    //localize text
    for (UITextView *textView in self.introductionTextViews) {
        NSString *text = [NSString stringWithFormat:@"TutorialAnamorphosisIntroduction%d", textView.tag];
        NSString *localizedText = NSLocalizedString(text, nil);
        textView.text = localizedText;
    }
//    for (UITextView *textView in self.lifeArtTextViews) {
//        NSString *text = [NSString stringWithFormat:@"TutorialAnamorphosisInLife%d", textView.tag];
//        NSString *localizedText = NSLocalizedString(text, nil);
//        textView.text = localizedText;
//    }
    
    self.sloganCharacterSrcFrames = [[NSMutableArray alloc]init];
    for (UIView *view in self.sloganCharacters) {
        [self.sloganCharacterSrcFrames addObject:[NSValue valueWithCGRect:view.frame]];
    }

    self.galleryArtCollectionView.backgroundColor = [UIColor clearColor];
    self.galleryArtPageControl.numberOfPages = [self.galleryArtCollectionView numberOfItemsInSection:0];
    self.lifeArtCollectionView.backgroundColor = [UIColor clearColor];
//    self.lifeArtPageControl.numberOfPages = ceilf([self.lifeArtCollectionView numberOfItemsInSection:0] * 0.5);
    
    self.galleryTextPopAnimator = [[ADTextSqueezePopAnimator alloc]initWithTextView:self.introductionTextViews];
//    self.lifeArtTextPopAnimator = [[ADTextSqueezePopAnimator alloc]initWithTextView:self.lifeArtTextViews];
    self.sloganViewPopAnimator = [[ADViewScalePopAnimator alloc]initWithView:self.sloganCharacters];
    [self.sloganViewPopAnimator popByPercentage:0];
    
    self.lifeArtViews = [[NSMutableArray alloc]init];
    self.lifeArtViewPopAnimator = [[ADViewScalePopAnimator alloc]initWithView:self.lifeArtViews];
    self.lifeArtViewFadeAnimator = [[ADViewRotatePopAnimator alloc]initWithView:self.lifeArtViews];
    
    self.nextButton.layer.shadowOpacity = 0.3;
    self.nextButton.layer.shadowOffset = CGSizeMake(0, 0);
    self.nextButton.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    self.nextButton.layer.shadowRadius = 10;
    self.nextButton.userInteractionEnabled = false;
    self.nextButton.alpha = 0;
//    [self.nextButton.layer setValue:[NSNumber numberWithFloat:0] forKeyPath:@"transform.scale.x"];
}


- (void)viewDidAppear:(BOOL)animated{
//    [Flurry logEvent:@"TU_inAnamorphosisBasic" withParameters:nil timed:true];
    
    [self.lifeArtViewFadeAnimator initCustom];
}

- (void)viewDidDisappear:(BOOL)animated{
//    [Flurry endTimedEvent:@"TU_inAnamorphosisBasic" withParameters:nil];
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
- (void)doneButtonTouchStart{
    ADTextSplitter *splitter = self.galleryTextPopAnimator.textSplitters[10];
    for (UILabel *label in splitter.characters) {
        label.textColor = [UIColor whiteColor];
    }
}
- (void)doneButtonTouchEnd{
    ADTextSplitter *splitter = self.galleryTextPopAnimator.textSplitters[10];
    for (UILabel *label in splitter.characters) {
        label.textColor = [UIColor selectableColor];
    }
}
- (IBAction)doneButtonTouchUpOutside:(id)sender {
    [self doneButtonTouchEnd];
}

- (IBAction)DoneButtonTouchUp:(id)sender{
    [RemoteLog logAction:@"TU_tutorialAnamorphosisBasicDoneButtonTouchUp" identifier:sender];
    
    [self doneButtonTouchEnd];
    
    if (self.delegate) {
        [self.delegate willTutorialAnamorphosisBasicDone];
    }
}

- (IBAction)doneButtonTouchDown:(id)sender {
    [self doneButtonTouchStart];
}

- (IBAction)doneButtonTouchCancel:(id)sender {
    [self doneButtonTouchEnd];
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
    DebugLogFuncStart(@"transitionFromSloganToSlogan2ByPercentage %.2f", percentage);
    for (int i = 0; i < self.sloganCharacters.count; ++i) {
        UIView *view = self.sloganCharacters[i];
        CGRect srcFrame = ((NSValue*)(self.sloganCharacterSrcFrames[i])).CGRectValue;
        UIView *targetView = [self characterViewInSloganViews:self.sloganCharacters2 byTag:view.tag];
        if (targetView) {
            CGRect destFrame = targetView.frame;
            [view setFrameLerpFromRect:srcFrame toRect:destFrame percentage:percentage];
            
            //放大个别的字母
            if (view.tag == 2) {
                //o
                [view.layer setValue:[NSNumber numberWithFloat:sin(percentage * M_PI)*0.5 + 1] forKeyPath:@"transform.scale"];
            }
            else if (view.tag == 3) {
                //y
                [view.layer setValue:[NSNumber numberWithFloat:sin(percentage * M_PI)*0.5 + 1] forKeyPath:@"transform.scale"];
            }
            else if (view.tag == 4) {
                //o
                [view.layer setValue:[NSNumber numberWithFloat:sin(percentage * M_PI)*0.5 + 1] forKeyPath:@"transform.scale"];
            }
            else if (view.tag == 5) {
                //u
                [view.layer setValue:[NSNumber numberWithFloat:sin(percentage * M_PI)*0.25 + 1] forKeyPath:@"transform.scale"];
            }
            else if (view.tag == 9) {
                //n
                [view.layer setValue:[NSNumber numberWithFloat:sin(percentage * M_PI)*0.5 + 1] forKeyPath:@"transform.scale"];
            }
            else if (view.tag == 11) {
                //n
                [view.layer setValue:[NSNumber numberWithFloat:sin(percentage * M_PI)*0.5 + 1] forKeyPath:@"transform.scale"];
            }
            else if (view.tag == 17) {
                //t
                [view.layer setValue:[NSNumber numberWithFloat:sin(percentage * M_PI) + 1] forKeyPath:@"transform.scale"];
            }
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
        return 11;
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
            case 7:
            case 8:
            case 9:
            case 10:
                imageName = nil;
                authorName = nil;
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
        
        if (![self.lifeArtViews containsObject:cell.shadowView]) {
            [self.lifeArtViews addObject:cell.shadowView];
            [cell.shadowView.layer setValue:[NSNumber numberWithFloat:0] forKeyPath:@"transform.scale"];
        }
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
        //出字幕
        [self.galleryTextPopAnimator popTextByPercentage:curPage];
       
        self.nextButton.userInteractionEnabled = false;
        //出宣传语
        if (curPage >= 6 && curPage < 7) {
            CGFloat percent = MAX(0, curPage - 6);
            [self.sloganViewPopAnimator popByPercentage:percent];
        }
        else if (curPage >= 7 && curPage < 8) {
            CGFloat percent = curPage - 7;
            [self transitionFromSloganToSlogan2ByPercentage:percent];
        }
        else if (curPage >= 8 && curPage < 9) {
            CGFloat percent = MAX(0, curPage - 8 );
            [self.sloganViewPopAnimator fadeOutByPercentage:percent];
            [self.lifeArtViewPopAnimator popByPercentage:percent];
        }
        else if (curPage >= 9 && curPage < 10) {
            CGFloat percent = MAX(0, curPage - 9);
            [self.lifeArtViewFadeAnimator fadeOutByPercentage:percent];
            self.nextButton.alpha = percent;
        }
        else if ((curPage - 10) < 0.001){
            self.nextButton.userInteractionEnabled = true;
        }
    }
    else if (scrollView.tag == 2){
        CGSize contentSize = self.lifeArtCollectionView.contentSize;
        CGPoint contentOffset = self.lifeArtCollectionView.contentOffset;
        
        UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.lifeArtCollectionView.collectionViewLayout;
        CGFloat percentage = (contentOffset.x + layout.minimumLineSpacing) / ((contentSize.width + layout.minimumLineSpacing) * 0.5);
        percentage = MIN(MAX(percentage, 0), 1);
        [self transitionFromSloganToSlogan2ByPercentage:percentage];
        
//        self.lifeArtPageControl.currentPage = floorf(percentage);
//        [self.lifeArtTextPopAnimator popTextByPercentage:percentage];
    }
}

@end
