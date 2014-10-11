//
//  PaintCollectionViewController.m
//  PaintProjector
//
//  Created by 胡 文杰 on 1/22/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADPaintCollectionViewController.h"
#import "ADPaintFrameView.h"
#import "ADPaintFrameViewGroup.h"
#import "ADPaintDocManager.h"
#import "ADPaintFrameManager.h"
#import "ADPaintUIKitAnimation.h"
#import "ADPaintScreen.h"
#import "ADSimpleTutorialManager.h"
#import "AppDelegate.h"


#define TutorialImageNumMin 4
#define TutorialPickImageIndex 1
#define launchImageViewToCylinderFadeOutDuration 0.3
#define TempPaintFrameToCylinderFadeOutDuration 1
#define PaintFramePickOperationHalfDuration 0.2
#define PaintFramePickOperationDamping 0.3
#define PaintFramePickOperationVelcotiy 0.5


@interface ADPaintCollectionViewController ()
//圆柱体投影VC
@property (weak, nonatomic) ADCylinderProjectViewController *cylinderProjectVC;
//VC切换动画效果管理器
@property (nonatomic) ADPaintFrameTransitionManager *transitionManager;
//记录选择的图片索引号
@property (retain, nonatomic) NSMutableArray *selectedIndices;
//是否编辑状态
@property (assign, nonatomic) BOOL editMode;

//优化UI体验
@property (assign, nonatomic) BOOL toViewPaintFrame;
@property (retain, nonatomic) UIActivityIndicatorView *activityView;
@end

@implementation ADPaintCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    DebugLogSystem(@"viewWillAppear");
    [self addBackgroundView];
    
    if (!self.isLaunchTransitioned) {
        [self startLaunchTransitionToCylinderProject];
    }

    //在教程调整完毕后需要重新加载
    [self tutorialSetup];
    
    //修正viewDidDisappear unloadPaintFrameView后闪的问题
    [self.collectionView reloadData];
}

- (void)viewWillDisappear:(BOOL)animated{
    DebugLogSystem(@"viewWillDisappear");
}

- (void)viewDidAppear:(BOOL)animated{
    DebugLogSystem(@"viewDidAppear");
    
    if (!self.isLaunchTransitioned) {
        [self launchTransitionToCylinderProject];
    }
    
    //动画在显示完成之后开始进行
    [self tutorialStepNextImmediate:YES];
    //    [self tutorialStartFromStepName:@"PaintCollectionPickImage"];
}

- (void)viewDidDisappear:(BOOL)animated{
    DebugLogSystem(@"viewDidDisappear");
    [self destroyBackgroundView];
    
    [self.selectedIndices removeAllObjects];
    
    //移除显示用的Image
    for (int i = 0; i < [ADPaintFrameManager curGroup].paintDocs.count; ++i) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        ADPaintCollectionViewCell *cell = (ADPaintCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        
        [ADPaintFrameManager unloadPaintFrameView:cell.paintFrameView];
        [self cell:cell markSelected:false];

    }
}


- (void)viewDidLoad
{
    DebugLogSystem(@"viewDidLoad");
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.numberOfPaintPerPage = 9;
    
    self.selectedIndices = [[NSMutableArray alloc]init];
    
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.allowsMultipleSelection = true;
    
    self.editMode = false;
    for (UIButton *button in self.editButtons) {
        button.hidden = true;
    }

    //设置当前PaintFrameGroup PaintFrame
    [ADPaintFrameManager initDataByGroupIndex:0];
    
    self.transitionManager = [[ADPaintFrameTransitionManager alloc]init];
    self.transitionManager.delegate = self;
    
    self.isLaunchTransitioned = false;
 
}

- (void)viewDidUnload{
    DebugLogSystem(@"viewDidUnload");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    DebugLogSystem(@"dealloc");
    self.selectedIndices = nil;
}

- (void)addBackgroundView{
    ADRootCanvasBackgroundView *backgroundView = [[ADRootCanvasBackgroundView alloc]initWithFrame:self.view.frame];
    self.rootView.backgroundView = backgroundView;
    [self.rootView addSubview:backgroundView];
    [self.rootView sendSubviewToBack:backgroundView];
}

-(void)destroyBackgroundView{
    [self.rootView.backgroundView removeFromSuperview];
    self.rootView.backgroundView = nil;
}

#pragma mark- LaunchTransition
-(NSInteger)indexForRecentPaintDoc{
    if ([ADPaintFrameManager curGroup].paintDocs.count > 0) {
        NSString *recentDocPath = [[NSUserDefaults standardUserDefaults] valueForKey:@"RecentDoc"];
        
        if (!recentDocPath) {
            return 0;
        }
        
        for (NSUInteger i = 0; i < [ADPaintFrameManager curGroup].paintDocs.count; ++i) {
            ADPaintDoc *paintDoc = [ADPaintFrameManager curGroup].paintDocs[i];
            if ([paintDoc.docPath isEqualToString:recentDocPath]) {
                return i;
            }
        }
        return 0;
    }
    else{
        return -1;
    }

}

-(void)startLaunchTransitionToCylinderProject{
    //launchImage遮盖主屏幕
//    UIImage *image = [UIImage imageNamed:@"bgRootView.png"];
//    self.launchImageView = [[UIImageView alloc]initWithImage:image];
//    [self.view addSubview:self.launchImageView];
}

-(void)launchTransitionToCylinderProject{
//    if ([PaintFrameManager curGroup].paintDocs.count == 0) {
//        //没有文件，插入一个新文件
//        [self newButtonTouchUp:self.editNewButton];
//    }
//    else{
//        //TODO:载入保存的recentFiles
//        NSInteger index = [self indexForRecentPaintDoc];
//        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
//        [self collectionView:self.collectionView didSelectItemAtIndexPath:indexPath];
//    }
}

-(void)launchTransitionToCylinderProjectCompleted{
    [UIView animateWithDuration:launchImageViewToCylinderFadeOutDuration animations:^{
        self.launchImageView.alpha = 0;
    }completion:^(BOOL finished) {
        [self.launchImageView removeFromSuperview];
        self.launchImageView = nil;
        self.isLaunchTransitioned = true;
    }];

}
- (void)willCompleteLaunchTransitionToCylinderProject{
    [self launchTransitionToCylinderProjectCompleted];
}

#pragma mark- 编辑Edit
- (void)setEditMode:(BOOL)editMode{
    self.fileButton.selected = editMode;
    [self enablePaint:!editMode];
    
    _editMode = editMode;
    
    if (editMode) {
        for (UIButton *button in self.editButtons) {
            button.hidden = false;
        }
        
        //        for (int i = 0; i < [PaintFrameManager curGroup].paintDocs.count; ++i) {
        //            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        //            UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
        //            if (cell.selectedBackgroundView) {
        //                cell.selectedBackgroundView.hidden = NO;
        //            }
        //        }
    }
    else{
        [self.selectedIndices removeAllObjects];
        
        for (int i = 0; i < [ADPaintFrameManager curGroup].paintDocs.count; ++i) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            ADPaintCollectionViewCell *cell = (ADPaintCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
            [self cell:cell markSelected:false];
        }
        
        
        for (UIButton *button in self.editButtons) {
            button.hidden = true;
        }
        
        //        for (int i = 0; i < [PaintFrameManager curGroup].paintDocs.count; ++i) {
        //            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        //            UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
        //            if (cell.selectedBackgroundView) {
        //                cell.selectedBackgroundView.hidden = YES;
        //            }
        //        }
    }
}

- (void)enablePaint:(BOOL)enable{
    self.editNewButton.hidden = !enable;
}
- (void)cell:(ADPaintCollectionViewCell*)cell markSelected:(BOOL)selected{
    cell.pinView.hidden = !selected;
}
#pragma mark- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSInteger count = [ADPaintFrameManager curGroup].paintDocs.count;
    self.pageControl.numberOfPages =  ceilf((float)count / (float)self.numberOfPaintPerPage);
    return count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    // we're going to use a custom UICollectionViewCell, which will hold an image and its label
    //
    DebugLog(@"cellForItemAtIndexPath %d", indexPath.row);
    
    ADPaintCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PaintCollectionViewCell" forIndexPath:indexPath];
    
    cell.cellFrame.layer.shadowRadius = 10;
    cell.cellFrame.layer.shadowOffset = CGSizeMake(0, 10);
    
    if (!self.editMode) {
        [self cell:cell markSelected:false];
    }
    else{
        [self cell:cell markSelected:cell.isSelected];
    }
    
    [ADPaintFrameManager loadPaintFrameView:cell.paintFrameView byIndex:indexPath.row];

    return cell;
}



#pragma mark- UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    DebugLog(@"didSelectItemAtIndexPath row %i", indexPath.row);
    //教程
    [self tutorialStepNextImmediate:false];
    
    ADPaintCollectionViewCell *cell = (ADPaintCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    //设定当前选择的paintDoc
    self.curPaintFrameView = cell.paintFrameView;
    [ADPaintFrameManager curGroup].curPaintIndex = indexPath.row;
    
    //非编辑状态，打开
    if (!self.editMode) {
        //优化UI交互，在didHighlightItemAtIndexPath动画调用结束之后进行。
        self.toViewPaintFrame = true;
//        [self viewPaintFrame:cell.paintFrameView paintDirectly:false];
        [ADPaintUIKitAnimation view:self.view switchDownToolBarFromView:self.downToolBar completion:nil];
    }
    //编辑状态
    else{
        if (![self.selectedIndices containsObject:indexPath]) {
            [self.selectedIndices addObject:indexPath];
            [self cell:cell markSelected:true];
        }
    }
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    DebugLogSystem(@"didHighlightItemAtIndexPath row %i", indexPath.row);
    //保证动画不受影响
    ADPaintCollectionViewCell *cell = (ADPaintCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    
    [UIView animateWithDuration:PaintFramePickOperationHalfDuration * 0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        [cell.layer setValue:[NSNumber numberWithFloat:PaintFrameFadeOutScale] forKeyPath:@"transform.scale"];
        cell.cellFrame.layer.shadowRadius = 3;
        cell.cellFrame.layer.shadowOffset = CGSizeMake(0, 2);
    }completion:^(BOOL finished) {
        DebugLog(@"didHighlightItemAtIndexPath anim completed");
    }];

//    [cell.layer setNeedsDisplay];
}

- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    DebugLogSystem(@"didUnHighlightItemAtIndexPath row %i", indexPath.row);
    
    ADPaintCollectionViewCell *cell = (ADPaintCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    [UIView animateWithDuration:PaintFramePickOperationHalfDuration*2 delay:0 usingSpringWithDamping:PaintFramePickOperationDamping initialSpringVelocity:PaintFramePickOperationVelcotiy options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [cell.layer setValue:[NSNumber numberWithFloat:1] forKeyPath:@"transform.scale"];
        
        cell.cellFrame.layer.shadowRadius = 10;
        cell.cellFrame.layer.shadowOffset = CGSizeMake(0, 10);
    }completion:^(BOOL finished) {
        DebugLog(@"didUnhighlightItemAtIndexPath anim completed");
        if (self.toViewPaintFrame) {
            [self createActivityViewFromRect:cell];
            [self viewPaintFrame:cell.paintFrameView paintDirectly:false];
            self.toViewPaintFrame = false;
        }
    }];
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    return true;
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    DebugLog(@"didDeSelectItemAtIndexPath row %i", indexPath.row);
    ADPaintCollectionViewCell *cell = (ADPaintCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    if (self.editMode) {
        if ([self.selectedIndices containsObject:indexPath]) {
            [self.selectedIndices removeObject:indexPath];
            [self cell:cell markSelected:false];
        }
    }
}
#pragma mark- PaintFrameTransitionManagerDelegate
- (CGRect)willGetCylinderMirrorFrame{
    return [self.cylinderProjectVC getCylinderMirrorFrame];
}

#pragma mark- UIViewControllerTransitioningDelegate
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    self.transitionManager.isPresenting = YES;
    return self.transitionManager;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    self.transitionManager.isPresenting = NO;
    return self.transitionManager;
}

#pragma mark- CylinderProjectViewControllerDelegate
- (void)willTransitionToTutorial{
    if (self.delegate) {
        [self.delegate willTransitionToTutorialVC];
    }
}
-(void)willTransitionToGallery{
    //prepare seque
    [self dismissViewControllerAnimated:YES completion:^{
        [self.collectionView reloadData];
        [ADPaintUIKitAnimation view:self.view switchDownToolBarToView:self.downToolBar completion:nil];
    }];
}

#pragma mark- 交互控制 UserInteraction
- (void)lockInteraction:(BOOL)lock{
    self.downToolBar.userInteractionEnabled = !lock;
}

- (void)createActivityViewFromRect:(UIView*)view{
    self.activityView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [view addSubview:self.activityView];
    self.activityView.center = CGPointMake(view.bounds.size.width * 0.5, view.bounds.size.height * 0.5);
    self.activityView.hidesWhenStopped = true;
    [self.activityView startAnimating];
}

- (void)deleteActivityView{
    if (self.activityView) {
        [self.activityView stopAnimating];
        [self.activityView removeFromSuperview];
        self.activityView = nil;
    }
}
#pragma mark- Tool Bar

- (IBAction)fileButtonTouchUp:(id)sender{
    [RemoteLog logAction:@"PC_fileButtonTouchUp" identifier:sender];
    
    self.editMode = !self.editMode;
}

- (IBAction)copyButtonTouchUp:(id)sender {
    [RemoteLog logAction:@"PC_copyButtonTouchUp" identifier:sender];
    
    //插入拷贝paintDoc到paintDocs中，
    if (self.curPaintFrameView.paintDoc == nil) {
        DebugLog(@"No PaintDoc to copy!");
        return;
    }

//    if (self.selectedIndices.count == 0) {
//        DebugLog(@"No PaintDoc to copy!");
//        return;
//    }
    
    NSMutableArray *indices = [[NSMutableArray alloc]init];
    for (NSIndexPath *indexPath in self.selectedIndices) {
        [indices addObject: [NSNumber numberWithInteger:indexPath.row]];
    }
    
    //文件和内存中插入
    [ADPaintFrameManager insertCopyPaintDocAtIndices:indices];
    indices = nil;
    
    //多项插入会导致显示错误，直接reloadData
//    [self.collectionView insertItemsAtIndexPaths:self.selectedIndices];
    
    [self.collectionView reloadData];
    
    self.editMode = false;
}

- (IBAction)deleteButtonTouchUp:(id)sender {
    [RemoteLog logAction:@"PC_deleteButtonTouchUp" identifier:sender];
    
    NSMutableArray *indices = [[NSMutableArray alloc]init];
    for (NSIndexPath *indexPath in self.selectedIndices) {
        [indices addObject: [NSNumber numberWithInteger:indexPath.row]];
    }
    
    [ADPaintFrameManager deletePaintDocAtIndices:indices];
    indices = nil;
    
    //多项插入会导致显示错误，直接reloadData
//    [self.collectionView deleteItemsAtIndexPaths:self.selectedIndices];

    [self.collectionView reloadData];
    
    self.editMode = false;
}

- (IBAction)newButtonTouchUp:(id)sender {
    [RemoteLog logAction:@"PC_newButtonTouchUp" identifier:sender];
    
    //在present到cylinderProject之后恢复userInteractionEnable
    [self lockInteraction:true];
    
    //非编辑状态下从最后一个PaintFrameView之后添加
    if ([ADPaintFrameManager curGroup].paintDocs.count > 0) {
        [ADPaintFrameManager curGroup].curPaintIndex = [ADPaintFrameManager curGroup].paintDocs.count - 1;
    }
    else{
        [ADPaintFrameManager curGroup].curPaintIndex = -1;
        self.curPaintFrameView = nil;
    }

    //插入新paintDoc到paintDocs中，
    [ADPaintFrameManager insertNewPaintDocAtCurIndex];
    
    //插入新表单到表格
    //FIXME:需要确保insertNewPaintDocAtCurIndex 完成之后,否则回crash attempt to insert item 0 into section 0, but there are only 0 items in section 0 after the update
//    [self.collectionView reloadData];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[ADPaintFrameManager curGroup].curPaintIndex inSection:0];
    
    //滚到最后一张图的位置上
    if ([ADPaintFrameManager curGroup].paintDocs.count > 0) {
        float index = [ADPaintFrameManager curGroup].curPaintIndex;
        CGFloat curPage = floorf((CGFloat)index / (CGFloat)self.numberOfPaintPerPage);
        self.collectionView.contentOffset = CGPointMake(curPage * self.collectionView.frame.size.width, 0);
        self.pageControl.currentPage = curPage;
    }

    [self.collectionView insertItemsAtIndexPaths:@[indexPath]];
    
    //更新当前PaintFrame
    ADPaintCollectionViewCell *cell = (ADPaintCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    self.curPaintFrameView = cell.paintFrameView;
    [ADPaintFrameManager curGroup].curPaintIndex = indexPath.row;
    
    //放大画框开始绘制
    [self viewPaintFrame:self.curPaintFrameView paintDirectly:true];
//    [self viewPaintFrame:nil paintDirectly:true];
}

#pragma mark-

-(void)viewPaintFrame:(ADPaintFrameView*)paintFrameView paintDirectly:(BOOL)paintDirectly{
    self.cylinderProjectVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CylinderProjectViewController"];
    self.cylinderProjectVC.delegate = self;
    self.cylinderProjectVC.transitioningDelegate = self;
    
    //prepare to present
    self.cylinderProjectVC.cylinderProjectDefaultAlphaBlend = 0;
    self.cylinderProjectVC.downToolBar.hidden = true;
    [self.cylinderProjectVC lockInteraction:true];
    self.cylinderProjectVC.paintDirectly = paintDirectly;
    
    [self presentViewController:self.cylinderProjectVC animated:YES completion:^{
        [self deleteActivityView];
        [self lockInteraction:false];
        
        DebugLog(@"Fade in cylinderProjcet");
        
        [self.cylinderProjectVC.cylinderProjectCur.animation play];
        
        //隐藏从paintCollectionVC transition 时添加的view
        UIView *transitionImageView = [self.cylinderProjectVC.rootView subViewWithTag:100];
        if (transitionImageView) {
            [UIView animateWithDuration:TempPaintFrameToCylinderFadeOutDuration animations:^{
                transitionImageView.alpha = 0;
            }completion:^(BOOL finished) {
                if (self.isLaunchTransitioned) {
                    [self launchTransitionToCylinderProjectCompleted];
                }

                if (paintDirectly) {
                    [self.cylinderProjectVC transitionToPaint:[ADPaintFrameManager curGroup].curPaintDoc];
                }
                else{
                }
            }];
        }
    }];
}

#pragma mark- Scroll
- (IBAction)pageControlValueChanged:(UIPageControl *)sender {
    self.collectionView.contentOffset = CGPointMake(sender.currentPage * self.collectionView.frame.size.width, 0);
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //    DebugLog(@"[scrollViewDidScroll] contentOffset %@", NSStringFromCGPoint(scrollView.contentOffset));
    self.pageControl.currentPage = floorf(scrollView.contentOffset.x / scrollView.frame.size.width);
    
}

#pragma mark- 教程 Tutorial
//主教程入口设置
- (void)tutorialLayout:(ADTutorial*)tutorial{
    ADSimpleTutorial *simpleTutorial = (ADSimpleTutorial *)tutorial;
    [simpleTutorial.cancelView removeFromSuperview];
    simpleTutorial.cancelView.center = CGPointMake(TutorialNextButtonHeight*0.5, self.rootView.bounds.size.height - self.downToolBar.frame.size.height - simpleTutorial.cancelView.frame.size.height);
    simpleTutorial.cancelView.hidden = false;    
    [self.rootView addSubview:simpleTutorial.cancelView];
}
- (void)tutorialSetup{
    DebugLogFuncStart(@"tutorialSetup");
    if (![[ADSimpleTutorialManager current] isActive]) {
        return;
    }
    
    for (ADSimpleTutorial *tutorial in [ADSimpleTutorialManager current].tutorials.objectEnumerator) {
        tutorial.curViewController = self;
        for (ADTutorialStep *step in tutorial.steps) {
            if ([step.name rangeOfString:@"PaintCollection"].length > 0) {
                step.delegate = self;
            }
        }
    }
    
    //教程基本要素，需要两张图片来说明操作, 如果文件数量少于两个, 则从app中拷贝两份到用户目录中,重新加载PaintFrameManager
    if ([self.collectionView numberOfItemsInSection:0] < TutorialImageNumMin) {
        AppDelegate *appDelegate = (AppDelegate *)([UIApplication sharedApplication].delegate);
        [appDelegate copyCollectionFromMainBundleToUserDocument];
        [ADPaintFrameManager destroy];
        [ADPaintFrameManager initDataByGroupIndex:0];
    }
    
    self.pageControl.currentPage = 0;
    self.collectionView.contentOffset = CGPointZero;
    
    [self tutorialLayout:[ADSimpleTutorialManager current].curTutorial];
}

//在排版等准备完成以后,检查是否需要开始教程
- (void)tutorialStartFromStepName:(NSString *)name{
    DebugLogFuncStart(@"tutorialStartFromStepName %@", name);
    if (![[ADSimpleTutorialManager current] isActive]) {
        return;
    }
    
    if ([[ADSimpleTutorialManager current].curTutorial.curStep.name isEqualToString:name]) {
        [[ADSimpleTutorialManager current].curTutorial startFromStepName:name];
    }
}

- (void)tutorialStepNextImmediate:(BOOL)immediate{
    DebugLogFuncStart(@"checkTutorialStep");
    if (![[ADSimpleTutorialManager current] isActive]) {
        return;
    }

    //isCheckTutorialStep
    if (!self.editMode) {
        if (immediate) {
            [[ADSimpleTutorialManager current].curTutorial stepNextImmediate];
        }
        else{
            [[ADSimpleTutorialManager current].curTutorial stepNext:nil];
        }
    }
}

- (void)transitionToTutorial{
    DebugLogFuncStart(@"launchTransitionToTutorial");
    if (![[ADSimpleTutorialManager current] isActive]) {
        return;
    }
    
//    TutorialStepAnimationBlock animBlock = [ADSimpleTutorialManager current].curTutorial.curStep.fadeInAnimationBlock;
//    if (animBlock) {
//        animBlock();
//    }

    
    ADSimpleTutorialViewController *simpleTutorialVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SimpleTutorialViewController"];
    simpleTutorialVC.delegate = self;
    simpleTutorialVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:simpleTutorialVC animated:true completion:^{
        
    }];
}



#pragma mark- 教程步骤代理 TutorialStepDelegate
- (void)willTutorialEnableUserInteraction:(BOOL)enable withStep:(ADTutorialStep *)step{
    DebugLogFuncStart(@"willTutorialEnableUserInteraction");
    //只要是教程,就需要关闭所有其他工具
    self.downToolBar.userInteractionEnabled = enable;
    self.collectionView.userInteractionEnabled = enable;
    self.collectionView.scrollEnabled = enable;
    
    if ([step.name isEqualToString:@"PaintCollectionWelcome"]) {
    }
    else if ([step.name isEqualToString:@"PaintCollectionPickImage"]) {
        self.collectionView.userInteractionEnabled = true;
        self.collectionView.scrollEnabled = false;
        //打开关闭第一个作品的交互
        if ([self.collectionView numberOfItemsInSection:0] == 0) {
            return;
        }
        
        //不同的Tutorial指定不同的图片
        NSInteger index = 0;
        if ([step.tutorialName isEqualToString:@"TutorialAnaDrawBasic"]) {
            index = 0;
        }
        else if ([step.tutorialName isEqualToString:@"TutorialAdvancedSetup"]) {
            index = 1;
        }
        else if ([step.tutorialName isEqualToString:@"TutorialDrawReflection"]) {
            index = 2;
        }
        else if ([step.tutorialName isEqualToString:@"TutorialDrawAnamorphosis"]) {
            index = 3;
        }
        
        for (NSInteger i = 0; i < [self.collectionView numberOfItemsInSection:0]; ++i) {
            if (i == index) {
                continue;
            }
            UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
            cell.userInteractionEnabled = enable;
        }
    }
}

- (void)willTutorialLayoutWithStep:(ADTutorialStep *)step{
    DebugLogFuncStart(@"willTutorialLayoutWithStep");
    step.contentView.center = CGPointMake(TutorialNextButtonHeight*0.5, self.rootView.bounds.size.height - self.downToolBar.frame.size.height - step.contentView.frame.size.height);
    
    if ([step.name isEqualToString:@"PaintCollectionWelcome"]) {
        [step.contentView bringSubviewToFront:((ADTutorialPageButtonView*)step.contentView).nextButton];
    }
    else if ([step.name isEqualToString:@"PaintCollectionPickImage"]) {
        //不同的Tutorial指定不同的图片
        NSInteger index = 0;
        if ([step.tutorialName isEqualToString:@"TutorialAnaDrawBasic"]) {
            index = 0;
        }
        else if ([step.tutorialName isEqualToString:@"TutorialAdvancedSetup"]) {
            index = 1;
        }
        else if ([step.tutorialName isEqualToString:@"TutorialDrawReflection"]) {
            index = 2;
        }
        else if ([step.tutorialName isEqualToString:@"TutorialDrawAnamorphosis"]) {
            index = 3;
        }
        
        //对齐第一个image的底面
        UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
        CGRect rect = step.indicatorView.frame;
        rect.size.width = cell.frame.size.width;
        step.indicatorView.frame = rect;
        
        CGRect targetRect = CGRectMake(cell.center.x, cell.center.y, 1, 1);
//        [step.indicatorView targetView:cell inRootView:self.rootView];
        [step.indicatorView targetViewFrame:targetRect inRootView:self.rootView];

    }
    [step addToRootView:self.rootView];
}

- (void)willTutorialEndWithStep:(ADTutorialStep*)step{
}
@end
