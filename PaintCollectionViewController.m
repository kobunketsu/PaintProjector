//
//  PaintCollectionViewController.m
//  PaintProjector
//
//  Created by 胡 文杰 on 1/22/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "PaintCollectionViewController.h"
#import "PaintCollectionViewCell.h"
#import "PaintFrameViewGroup.h"
#import "PaintDocManager.h"
#import "PaintUIKitAnimation.h"

@interface PaintCollectionViewController ()
@property (nonatomic, retain) PaintFrameViewGroup* curPaintFrameGroup;
@property (nonatomic, retain) PaintFrameView *curPaintFrameView;
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
    
    UIImage *uiImage = [UIImage imageNamed:@"rootCanvasViewBackground.png"];
    self.collectionView.backgroundColor = [UIColor colorWithPatternImage:uiImage];
    
    [PaintUIKitAnimation view:self.view switchDownToolBarFromView:self.toolBar completion:nil toView:self.categoryBar completion:nil];
    
    //设置当前PaintFrameGroup PaintFrame
    [self setCurPaintFrameGroupByIndex:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.curPaintFrameGroup.paintDocs.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    // we're going to use a custom UICollectionViewCell, which will hold an image and its label
    //
    PaintDoc *paintDoc = [self.curPaintFrameGroup.paintDocs objectAtIndex:indexPath.row];
    
    PaintCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PaintCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    
    PaintFrameView *paintFrameView = cell.paintFrameView;
    paintFrameView.isAccessibilityElement = true;
    NSUInteger length = [paintDoc.docPath length];
    NSString *accLabel = [paintDoc.docPath substringToIndex:(length - 4)];
    paintFrameView.accessibilityLabel = accLabel;
    [paintFrameView setPaintDoc:paintDoc];
    [paintFrameView loadForDisplay];
    
    return cell;
}

#pragma mark- 从磁盘载入文件
//设置当前用于显示的组(Document下的子目录)
- (void)setCurPaintFrameGroupByIndex:(int)groupIndex{
    PaintFrameViewGroup* paintFrameGroup = [[PaintFrameViewGroup alloc]initWithCapacity:1];
    paintFrameGroup.name = [NSString stringWithFormat:@"PaintFrameGroup_%d", groupIndex];
    paintFrameGroup.dirPath = [[PaintDocManager sharedInstance]directoryPath:groupIndex];
    //加载指定子目录下的PaintDoc
    paintFrameGroup.paintDocs = [[PaintDocManager sharedInstance]loadPaintDocsInDirectoryIndex:groupIndex];
    //设置当前画框源
    //如果paintFrameGroup下的数据源paintDocs为空，
    if (paintFrameGroup.paintDocs.count == 0) {
        paintFrameGroup.curPaintIndex = paintFrameGroup.lastPaintIndex = -1;
    }
    else{
        //        paintFrameGroup.curPaintFrame = self.curPaintFrameView;
        paintFrameGroup.curPaintIndex = paintFrameGroup.lastPaintIndex = 0;
    }
    self.curPaintFrameGroup = paintFrameGroup;
}

#pragma mark- Category Bar

- (IBAction)myArtworkButtonTouchUp:(id)sender {
    [self setCurPaintFrameGroupByIndex:1];
    
    [self openPaintFrameViewsWithAnimation];
    
//    self.paintButton.hidden = true;
    [PaintUIKitAnimation view:self.view switchDownToolBarFromView:self.categoryBar completion:nil toView:self.toolBar completion:nil];
}

#pragma mark- Tool Bar

- (IBAction)backButtonTouchUp:(id)sender {
}

- (IBAction)newButtonTouchUp:(id)sender {
}

- (IBAction)copyButtonTouchUp:(id)sender {
}

- (IBAction)deleteButtonTouchUp:(id)sender {
}

- (IBAction)printButtonTouchUp:(id)sender {
}

- (IBAction)paintButtonTouchUp:(id)sender {
}


- (void)openPaintFrameViewsWithAnimation{
    /*
    self.paintFrameTableView.hidden = false;
    [self.paintFrameTableView reloadData];
    
    //    DebugLog(@"openPaintFrameViewsWithAnimation visibleCells count %d", self.paintFrameTableView.visibleCells.count);
    for (UITableViewCell *cell in self.paintFrameTableView.visibleCells) {
        //        DebugLog(@"openPaintFrameViewsWithAnimation PaintFrameTableView Cell %@", cell);
        UIView *view = [cell.contentView.subviews objectAtIndex:0];
        view.bounds = CGRectMake(0, 0, 0, PaintFrameViewHeight);
    }
    
    [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.paintFrameTableView.alpha = 1;
        for (UITableViewCell *cell in self.paintFrameTableView.visibleCells) {
            //            DebugLog(@"openPaintFrameViewsWithAnimation PaintFrameTableView Cell After Anim %@", cell);
            UIView *view = [cell.contentView.subviews objectAtIndex:0];
            view.bounds = CGRectMake(0, 0, PaintFrameViewWidth, PaintFrameViewHeight);
        }
        
    }completion:^(BOOL finished){
        
    }];
     */
}
@end
