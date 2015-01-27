//
//  ADHelpViewController.m
//  PaintProjector
//
//  Created by 胡 文杰 on 9/10/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADHelpViewController.h"
#import "ADHelpCollectionViewCell.h"
//#import "ADPageControl.h"

#define Patch_PageControl 10
#define NumberOfPage 3
@interface ADHelpViewController ()

@end

@implementation ADHelpViewController

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
//    CGSize size = self.preferredContentSize;
//    size.width -= 22;
//    ADPageControl *pageControl = [[ADPageControl alloc]initWithScrollView:self.collectionView size:size];
//    [pageControl initCustom];
}
- (void)viewDidAppear:(BOOL)animated{
    [Flurry logEvent:@"PS_inHelp" withParameters:nil timed:true];
}
- (void)viewDidDisappear:(BOOL)animated{
    [Flurry endTimedEvent:@"PS_inHelp" withParameters:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    [self setPageControl:nil];
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

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 12;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier = @"helpCollectionViewCell";
    ADHelpCollectionViewCell *cell = (ADHelpCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    // Configure the cell...
    //配置features的图片,说明
    cell.userInteractionEnabled = false;
    NSString *imageName = nil;
    switch (indexPath.row) {
        case 0:
            imageName = @"tutorial_gesture1FingerDrag";
            break;
        case 1:
            imageName = @"tutorial_gesture1FingerTapHold";
            break;
        case 2:
            imageName = @"tutorial_gesture2FingerDrag";
            break;
        case 3:
            imageName = @"tutorial_gesture2FingerRotate";
            break;
        case 4:
            imageName = @"tutorial_gesture2FingerPinch";
            break;
        case 5:
            imageName = @"tutorial_gesture2FingerSpread";
            break;
        case 6:
            imageName = @"tutorial_gesture2FingerDoubleTap";
            break;
        case 7:
            imageName = @"tutorial_gesture3FingerUp";
            break;
        case 8:
            imageName = @"tutorial_gesture3FingerDown";
            break;
        case 9:
            imageName = @"tutorial_gesture3FingerLeft";
            break;
        case 10:
            imageName = @"tutorial_gesture3FingerRight";
            break;
        case 11:
            imageName = @"tutorial_gesture3FingerZ";
            break;
        default:
            break;
    }
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:imageName]];
    cell.label.text = NSLocalizedString(imageName, nil);
    
    return cell;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.pageControl.currentPage = floorf((scrollView.contentOffset.x + Patch_PageControl)/ (scrollView.contentSize.width / NumberOfPage));
    
    self.nextPageButton.hidden = self.previousPageButton.hidden = false;
    if (self.pageControl.currentPage == 2) {
        self.nextPageButton.hidden = true;
    }
    if (self.pageControl.currentPage == 0) {
        self.previousPageButton.hidden = true;
    }
}

- (IBAction)nextPageButtonTouchUp:(UIButton *)sender {
    CGPoint contentOffset = self.collectionView.contentOffset;
    contentOffset.x += self.collectionView.contentSize.width / 3.0;
    self.collectionView.contentOffset = contentOffset;
    
    self.previousPageButton.hidden = false;
    if (self.pageControl.currentPage == 2) {
        self.nextPageButton.hidden = true;
    }
}

- (IBAction)previousPageButtonTouchUp:(UIButton *)sender {
    CGPoint contentOffset = self.collectionView.contentOffset;
    contentOffset.x -= self.collectionView.contentSize.width / 3.0;
    self.collectionView.contentOffset = contentOffset;
    
    self.nextPageButton.hidden = false;
    if (self.pageControl.currentPage == 0) {
        self.previousPageButton.hidden = true;
    }
}
@end
