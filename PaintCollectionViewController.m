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
#import "PaintFrameManager.h"
#import "PaintUIKitAnimation.h"
#import "PaintScreen.h"

@interface PaintCollectionViewController ()

@property (nonatomic, retain) PaintFrameManager *paintFrameManager;
@property (nonatomic, assign) BOOL isEditing;
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
    
    self.isEditing = false;
    for (UIButton *button in self.editButtons) {
        button.hidden = true;
    }

    //设置当前PaintFrameGroup PaintFrame
    self.paintFrameManager = [[PaintFrameManager alloc]init];
    [self.paintFrameManager setCurPaintFrameGroupByIndex:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

    [self.paintFrameManager loadPaintFrameView:cell.paintFrameView byIndex:indexPath.row];

    return cell;
}

-(void)openPaintFrame:(PaintFrameView*)paintFrameView {

    PaintScreen *paintScreenViewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"paintScreen"];
        self.delegate = paintScreenViewController;
        paintScreenViewController.delegate = self;

    
    //打开绘图面板动画，从cylinder的中心放大过度到paintScreenViewController
    DebugLog(@"presentViewController start");
    [self presentViewController:paintScreenViewController animated:true completion:^{
        DebugLog(@"presentViewController completed");
        [self.delegate openDoc:paintFrameView.paintDoc];
    }];
}

#pragma mark- Tool Bar
- (IBAction)fileButtonTouchUp:(id)sender{
    self.isEditing = !self.isEditing;
    for (UIButton *button in self.editButtons) {
        button.hidden = !self.isEditing;
    }
}

- (IBAction)copyButtonTouchUp:(id)sender {
}

- (IBAction)deleteButtonTouchUp:(id)sender {
}

- (IBAction)printButtonTouchUp:(id)sender {
}

- (IBAction)newButtonTouchUp:(id)sender {
    if (!self.isEditing) {
        //非编辑状态下从最后一个PaintFrameView之后添加
        if (self.paintFrameManager.curPaintFrameGroup.paintDocs.count > 0) {
            self.paintFrameManager.curPaintFrameGroup.curPaintIndex = self.paintFrameManager.curPaintFrameGroup.paintDocs.count - 1;
        }
        else{
            self.paintFrameManager.curPaintFrameGroup.curPaintIndex = 0;
        }
    }

    //插入新paintDoc到paintDocs中，
    [self.paintFrameManager insertNewPaintDocAtCurIndex];
    
    //插入新表单到表格
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.paintFrameManager.curPaintFrameGroup.curPaintIndex inSection:0];
    [self.collectionView insertItemsAtIndexPaths:@[indexPath]];

    PaintCollectionViewCell *cell = (PaintCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    self.paintFrameManager.curPaintFrameView = cell.paintFrameView;
    self.paintFrameManager.curPaintFrameGroup.curPaintIndex = indexPath.row;
    
    //放大画框开始绘制
    [self openPaintFrame:self.paintFrameManager.curPaintFrameView];
}

@end