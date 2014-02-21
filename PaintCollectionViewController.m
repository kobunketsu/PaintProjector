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

//是否编辑状态
@property (assign, nonatomic) BOOL isEditing;
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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
//    UIImage *uiImage = [UIImage imageNamed:@"launchImage2.png"];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:uiImage];
    self.collectionView.backgroundColor = [UIColor clearColor];
    
    self.isEditing = false;
    for (UIButton *button in self.editButtons) {
        button.hidden = true;
    }

    //设置当前PaintFrameGroup PaintFrame
    self.paintFrameManager = [[PaintFrameManager alloc]init];
    [self.paintFrameManager setCurPaintFrameGroupByIndex:1];
    
    self.transitionManager = [[PaintFrameTransitionManager alloc]init];
    self.transitionManager.delegate = self;
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
}

#pragma mark- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.paintFrameManager.curPaintFrameGroup.paintDocs.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    // we're going to use a custom UICollectionViewCell, which will hold an image and its label
    //
    PaintCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PaintCollectionViewCell" forIndexPath:indexPath];

//    cell.paintFrameView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"checkBox.png"]];
    
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
    
//    CGRect rect = [self.paintFrameManager.curPaintFrameView convertRect:self.paintFrameManager.curPaintFrameView.frame toView:self.view];
//    DebugLog(@"rect %@", NSStringFromCGRect(rect));
    
    //非编辑状态，打开
    if (!self.isEditing) {
        self.cylinderProjectVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CylinderProjectViewController"];
        self.cylinderProjectVC.delegate = self;
        self.cylinderProjectVC.transitioningDelegate = self;

        //prepare for segue
        PaintFrameView* view = cell.paintFrameView;
        self.cylinderProjectVC.paintFrameViewGroup = self.paintFrameManager.curPaintFrameGroup;
//        [self.cylinderProjectVC setCurPaintDoc:view.paintDoc];
        self.cylinderProjectVC.cylinderProjectDefaultAlphaBlend = 0;
        
        [self presentViewController:self.cylinderProjectVC animated:YES completion:^{
            DebugLog(@"Fade in cylinderProjcet");
            [self.cylinderProjectVC.cylinderProjectCur.animation play];
            
            //隐藏从paintCollectionVC transition 时添加的view
            UIView *tempImageView = [self.cylinderProjectVC.view subViewWithTag:100];
            if (tempImageView) {
                [UIView animateWithDuration:1 animations:^{
                    tempImageView.alpha = 0;
                }completion:^(BOOL finished) {
                }];
            }
        }];
    }
    //编辑状态
    else{
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
    self.isEditing = !self.isEditing;
    if (self.isEditing) {
        [self startEditFile];
    }
    else{
        [self endEditFile];
    }
}

- (IBAction)copyButtonTouchUp:(id)sender {
    //插入拷贝paintDoc到paintDocs中，
    if (self.paintFrameManager.curPaintFrameView.paintDoc == nil) {
        DebugLog(@"No PaintDoc to copy!");
        return;
    }
    
    //从磁盘拷贝
    [self.paintFrameManager insertCopyPaintDocAtCurIndex:self.paintFrameManager.curPaintFrameView.paintDoc];
    
    //插入新表单到表格
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.paintFrameManager.curPaintFrameGroup.curPaintIndex inSection:0];
    [self.collectionView insertItemsAtIndexPaths:@[indexPath]];
}

- (IBAction)deleteButtonTouchUp:(id)sender {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.paintFrameManager.curPaintFrameGroup.curPaintIndex inSection:0];
    [self.paintFrameManager deletePaintDocAtCurIndex];
    
    [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];

    [self.collectionView reloadData];
    
    [self endEditFile];
}

- (IBAction)printButtonTouchUp:(id)sender {
//    [self exportToAirPrint];
}

- (IBAction)newButtonTouchUp:(id)sender {
    if (!self.isEditing) {
        //非编辑状态下从最后一个PaintFrameView之后添加
        if (self.paintFrameManager.curPaintFrameGroup.paintDocs.count > 0) {
            self.paintFrameManager.curPaintFrameGroup.curPaintIndex = self.paintFrameManager.curPaintFrameGroup.paintDocs.count - 1;
        }
        else{
            self.paintFrameManager.curPaintFrameGroup.curPaintIndex = -1;
            self.paintFrameManager.curPaintFrameView = nil;
        }
    }

    //插入新paintDoc到paintDocs中，
    [self.paintFrameManager insertNewPaintDocAtCurIndex];
    
    //插入新表单到表格
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.paintFrameManager.curPaintFrameGroup.curPaintIndex inSection:0];
    [self.collectionView insertItemsAtIndexPaths:@[indexPath]];
    
    //更新当前PaintFrame
    PaintCollectionViewCell *cell = (PaintCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    self.paintFrameManager.curPaintFrameView = cell.paintFrameView;
    self.paintFrameManager.curPaintFrameGroup.curPaintIndex = indexPath.row;
    
    //放大画框开始绘制
    [self openPaintFrame:self.paintFrameManager.curPaintFrameView paintDirectly:true];
}

#pragma mark-
- (void)startEditFile{
    self.isEditing = true;
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

- (void)endEditFile{
    self.isEditing = false;
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

-(void)openPaintFrame:(PaintFrameView*)paintFrameView paintDirectly:(BOOL)paintDirectly{
    self.cylinderProjectVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CylinderProjectViewController"];
    self.cylinderProjectVC.delegate = self;
    self.cylinderProjectVC.transitioningDelegate = self;
    
    if (paintDirectly) {
    }
    else{
//       [self.cylinderProjectVC setCurPaintDoc:paintFrameView.paintDoc];
    }
    [self presentViewController:self.cylinderProjectVC animated:true completion:^{
        if (paintDirectly) {
            [self.cylinderProjectVC openPaintDoc:paintFrameView.paintDoc];
        }
        else{
        }
        
    }];
}

@end
