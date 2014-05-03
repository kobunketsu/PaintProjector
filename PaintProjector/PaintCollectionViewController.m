//
//  PaintCollectionViewController.m
//  PaintProjector
//
//  Created by 胡 文杰 on 1/22/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "PaintCollectionViewController.h"
#import "PaintCollectionViewCell.h"
#import "PaintFrameView.h"
#import "PaintFrameViewGroup.h"
#import "PaintDocManager.h"
#import "PaintFrameManager.h"
#import "PaintUIKitAnimation.h"
#import "PaintScreen.h"
#import "UIView+Tag.h"

//#import "TestViewController.h"

@interface PaintCollectionViewController ()
//圆柱体投影VC
@property (weak, nonatomic) CylinderProjectViewController *cylinderProjectVC;
//VC切换动画效果管理器
@property (nonatomic) PaintFrameTransitionManager *transitionManager;
//记录选择的图片索引号
@property (retain, nonatomic) NSMutableArray *selectedIndices;
//是否编辑状态
@property (assign, nonatomic) BOOL editing;

@end

@implementation PaintCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    DebugLog(@"viewWillAppear");
    if (!self.isLaunchTransitioned) {
        [self startLaunchTransitionToCylinderProject];
    }
}

- (void)viewDidAppear:(BOOL)animated{
    DebugLog(@"viewDidAppear");
    if (!self.isLaunchTransitioned) {
        [self launchTransitionToCylinderProject];
    }
}

- (void)viewDidDisappear:(BOOL)animated{
    DebugLog(@"viewDidDisappear");
    [self.selectedIndices removeAllObjects];
}

- (void)viewDidLoad
{
    DebugLog(@"viewDidLoad");
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.selectedIndices = [[NSMutableArray alloc]init];
    
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.allowsMultipleSelection = true;
    
    self.editing = false;
    for (UIButton *button in self.editButtons) {
        button.hidden = true;
    }

    //设置当前PaintFrameGroup PaintFrame
    self.paintFrameManager = [[PaintFrameManager alloc]init];
    [self.paintFrameManager setCurPaintFrameGroupByIndex:0];
    
    self.transitionManager = [[PaintFrameTransitionManager alloc]init];
    self.transitionManager.delegate = self;
    
    self.isLaunchTransitioned = false;
}

- (void)viewDidUnload{
    DebugLog(@"[ viewDidUnload ]");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    DebugLog(@"[ dealloc ]");
    self.selectedIndices = nil;
}

- (void)setEditing:(BOOL)editing{
    _editing = editing;
    
    if (editing) {
        for (UIButton *button in self.editButtons) {
            button.hidden = false;
        }
        
        for (int i = 0; i < self.paintFrameManager.curPaintFrameGroup.paintDocs.count; ++i) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
            if (cell.selectedBackgroundView) {
                cell.selectedBackgroundView.hidden = NO;
            }
        }
    }
    else{
        [self.selectedIndices removeAllObjects];
        
        for (UIButton *button in self.editButtons) {
            button.hidden = true;
        }
        
        for (int i = 0; i < self.paintFrameManager.curPaintFrameGroup.paintDocs.count; ++i) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
            if (cell.selectedBackgroundView) {
                cell.selectedBackgroundView.hidden = YES;
            }
        }
    }
}

#pragma mark- LaunchTransition
-(NSInteger)indexForRecentPaintDoc{
    if (self.paintFrameManager.curPaintFrameGroup.paintDocs.count > 0) {
        NSString *recentDocPath = [[NSUserDefaults standardUserDefaults] valueForKey:@"RecentDoc"];
        
        if (!recentDocPath) {
            return 0;
        }
        
        for (NSUInteger i = 0; i < self.paintFrameManager.curPaintFrameGroup.paintDocs.count; ++i) {
            PaintDoc *paintDoc = self.paintFrameManager.curPaintFrameGroup.paintDocs[i];
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
    UIImage *image = [UIImage imageNamed:@"AnaDrawLaunch"];
    self.launchImageView = [[UIImageView alloc]initWithImage:image];
    [self.view addSubview:self.launchImageView];
}

-(void)launchTransitionToCylinderProject{
    if (self.paintFrameManager.curPaintFrameGroup.paintDocs.count == 0) {
        //没有文件，插入一个新文件
        [self newButtonTouchUp:self.editNewButton];
    }
    else{
        //TODO:载入保存的recentFiles
        NSInteger index = [self indexForRecentPaintDoc];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
        [self collectionView:self.collectionView didSelectItemAtIndexPath:indexPath];
    }
}

-(void)launchTransitionToCylinderProjectCompleted{
    [UIView animateWithDuration:0.3 animations:^{
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
#pragma mark- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.paintFrameManager.curPaintFrameGroup.paintDocs.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    // we're going to use a custom UICollectionViewCell, which will hold an image and its label
    //
    DebugLog(@"cellForItemAtIndexPath %d", indexPath.row);
    
    PaintCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PaintCollectionViewCell" forIndexPath:indexPath];

    [self.paintFrameManager loadPaintFrameView:cell.paintFrameView byIndex:indexPath.row];

    return cell;
}

#pragma mark- UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    DebugLog(@"didSelectItemAtIndexPath");
    
    PaintCollectionViewCell *cell = (PaintCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    //设定当前选择的paintDoc
    self.paintFrameManager.curPaintFrameView = cell.paintFrameView;
    self.paintFrameManager.curPaintFrameGroup.curPaintIndex = indexPath.row;
    
    if (![self.selectedIndices containsObject:indexPath]) {
        [self.selectedIndices addObject:indexPath];
    }
//    CGRect rect = [self.paintFrameManager.curPaintFrameView convertRect:self.paintFrameManager.curPaintFrameView.frame toView:self.view];
//    DebugLog(@"rect %@", NSStringFromCGRect(rect));
    
    //非编辑状态，打开
    if (!self.editing) {
        [self viewPaintFrame:cell.paintFrameView paintDirectly:false];
    }
    //编辑状态
    else{
    }
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    return true;
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    DebugLog(@"didDeSelectItemAtIndexPath");
 
    if ([self.selectedIndices containsObject:indexPath]) {
        [self.selectedIndices removeObject:indexPath];
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
-(void)willTransitionToGallery{
    //prepare seque
    
    
    [self.cylinderProjectVC dismissViewControllerAnimated:YES completion:^{
        [self.collectionView reloadData];
    }];
}

#pragma mark- Tool Bar

- (IBAction)fileButtonTouchUp:(id)sender{
    self.editing = !self.editing;
}

- (IBAction)copyButtonTouchUp:(id)sender {
    //插入拷贝paintDoc到paintDocs中，
    if (self.paintFrameManager.curPaintFrameView.paintDoc == nil) {
        DebugLog(@"No PaintDoc to copy!");
        return;
    }
    
    NSMutableArray *indices = [[NSMutableArray alloc]init];
    for (NSIndexPath *indexPath in self.selectedIndices) {
        [indices addObject: [NSNumber numberWithInteger:indexPath.row]];
    }
    
    //文件和内存中插入
    [self.paintFrameManager insertCopyPaintDocAtIndices:indices];
    indices = nil;
    
    //多项插入会导致显示错误，直接reloadData
//    [self.collectionView insertItemsAtIndexPaths:self.selectedIndices];
    
    [self.collectionView reloadData];
    
    self.editing = false;
}

- (IBAction)deleteButtonTouchUp:(id)sender {
    NSMutableArray *indices = [[NSMutableArray alloc]init];
    for (NSIndexPath *indexPath in self.selectedIndices) {
        [indices addObject: [NSNumber numberWithInteger:indexPath.row]];
    }
    
    [self.paintFrameManager deletePaintDocAtIndices:indices];
    indices = nil;
    
    //多项插入会导致显示错误，直接reloadData
//    [self.collectionView deleteItemsAtIndexPaths:self.selectedIndices];

    [self.collectionView reloadData];
    
    self.editing = false;
}

- (IBAction)newButtonTouchUp:(id)sender {
    self.editing = false;
    
    //非编辑状态下从最后一个PaintFrameView之后添加
    if (self.paintFrameManager.curPaintFrameGroup.paintDocs.count > 0) {
        self.paintFrameManager.curPaintFrameGroup.curPaintIndex = self.paintFrameManager.curPaintFrameGroup.paintDocs.count - 1;
    }
    else{
        self.paintFrameManager.curPaintFrameGroup.curPaintIndex = -1;
        self.paintFrameManager.curPaintFrameView = nil;
    }

    //插入新paintDoc到paintDocs中，
    [self.paintFrameManager insertNewPaintDocAtCurIndex];
    
    //插入新表单到表格
//    [self.collectionView reloadData];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.paintFrameManager.curPaintFrameGroup.curPaintIndex inSection:0];
    [self.collectionView insertItemsAtIndexPaths:@[indexPath]];
    
    //更新当前PaintFrame
    PaintCollectionViewCell *cell = (PaintCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    self.paintFrameManager.curPaintFrameView = cell.paintFrameView;
    self.paintFrameManager.curPaintFrameGroup.curPaintIndex = indexPath.row;
    
    //放大画框开始绘制
    [self viewPaintFrame:self.paintFrameManager.curPaintFrameView paintDirectly:true];
}

#pragma mark-

-(void)viewPaintFrame:(PaintFrameView*)paintFrameView paintDirectly:(BOOL)paintDirectly{
    self.cylinderProjectVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CylinderProjectViewController"];
    self.cylinderProjectVC.delegate = self;
    self.cylinderProjectVC.transitioningDelegate = self;
    
    //prepare to present
    self.cylinderProjectVC.paintFrameViewGroup = self.paintFrameManager.curPaintFrameGroup;
    self.cylinderProjectVC.cylinderProjectDefaultAlphaBlend = 0;
    
    [self presentViewController:self.cylinderProjectVC animated:YES completion:^{
        DebugLog(@"Fade in cylinderProjcet");
        [self.cylinderProjectVC.cylinderProjectCur.animation play];
        
        //隐藏从paintCollectionVC transition 时添加的view
        UIView *transitionImageView = [self.cylinderProjectVC.view subViewWithTag:100];
        if (transitionImageView) {
            [UIView animateWithDuration:1 animations:^{
                transitionImageView.alpha = 0;
            }completion:^(BOOL finished) {
                if (self.isLaunchTransitioned) {
                    [self launchTransitionToCylinderProjectCompleted];
                }
                
                if (paintDirectly) {
                    [self.cylinderProjectVC transitionToPaint];
//                    [self.cylinderProjectVC openPaintDoc:paintFrameView.paintDoc];
                }
                
            }];
        }
    }];
}

@end
