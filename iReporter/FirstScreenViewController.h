//
//  FirstScreenViewController.h
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-6-2.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "PaintScreen.h"
//#import "Ultility.h"
#import "PaintFrameView.h"
#import "PaintFrameViewGroup.h"
#import "PaintDoc.h"
#import "PaintDocManager.h"

@class PaintScreen;
@protocol PaintScreenDelegate;

@protocol FirstScreenViewControllerDelegate
- (void)openDoc:(PaintDoc*)paintDoc;
@end

@interface FirstScreenViewController : UIViewController
<UITableViewDelegate,
UITableViewDataSource,
PaintScreenDelegate>

@property (nonatomic, strong)EAGLContext *context;
@property (nonatomic, assign) id delegate;
@property (nonatomic, weak) PaintScreen* paintScreenViewController;
@property (nonatomic, weak) IBOutlet PaintFrameView *curPaintFrameView;
@property (nonatomic, retain) PaintFrameViewGroup* curPaintFrameGroup;
@property (weak, nonatomic) IBOutlet UIView *rootView;
@property (weak, nonatomic) IBOutlet UIImageView *studioHuaJiaJiaZi;
@property (assign, nonatomic) CGPoint paintFrameRootViewPos;
@property (assign, nonatomic) float studioHuaJiaJiaZiPosY;
@property (retain, nonatomic) NSArray* paintFrameViews;
@property (weak, nonatomic) IBOutlet PaintFrameView *paintFrameView1;
@property (weak, nonatomic) IBOutlet PaintFrameView *paintFrameView2;
@property (weak, nonatomic) IBOutlet PaintFrameView *paintFrameView3;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *allInteractiveViews;
@property (weak, nonatomic) IBOutlet UITableView *paintFrameTableView;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;

- (IBAction)paintFrameButtonTouchUp:(PaintFrameView *)sender;
- (IBAction)handlePanPaintFrameRootView:(UIPanGestureRecognizer *)sender;
- (IBAction)newPaintFrameButtonTouchUp:(UIButton *)sender;
- (IBAction)deletePaintFrameButtonTouchUp:(UIButton *)sender;

//打开开始绘图
- (void)openPaintFrameWithAnim;

@end
