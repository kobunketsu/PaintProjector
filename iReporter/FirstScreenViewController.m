//
//  FirstScreenViewController.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-6-2.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "FirstScreenViewController.h"
#import "PaintScreen.h"
@interface FirstScreenViewController ()

@end

@implementation FirstScreenViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
        if (!self.context) {
            DebugLog(@"Failed to create ES context");
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.paintFrameTableView.delegate = self;
    self.paintFrameTableView.transform = CGAffineTransformMakeRotation(-M_PI / 2);
    
    self.paintFrameViews = [[NSArray alloc]initWithObjects:self.curPaintFrameView, self.paintFrameView1, self.paintFrameView2, self.paintFrameView3, nil];

    //设置当前PaintFrameGroup PaintFrame
    PaintFrameViewGroup* paintFrameGroup = [[PaintFrameViewGroup alloc]initWithCapacity:1];
    paintFrameGroup.name = [NSString stringWithFormat:@"PaintFrameGroup_%d", 0];
    paintFrameGroup.dirPath = [[PaintDocManager sharedInstance]directoryPath:0];
    //加载指定子目录下的PaintDoc
    paintFrameGroup.paintDocs = [[PaintDocManager sharedInstance]loadPaintDocsInDirectoryIndex:0];
    paintFrameGroup.curPaintFrame = self.curPaintFrameView;
    paintFrameGroup.curPaintIndex = paintFrameGroup.lastPaintIndex = 0;
    self.curPaintFrameGroup = paintFrameGroup;
    
    [self reloadPaintFrameViews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    for (UIView* view in self.curPaintFrameView.subviews) {
        [view removeFromSuperview];
    }
    [self setCurPaintFrameGroup:nil];
    [self setCurPaintFrameView:nil];
    [self setRootView:nil];
    [self setStudioHuaJiaJiaZi:nil];
    [self setPaintFrameViews:nil];
    [self setPaintFrameView1:nil];
    [self setPaintFrameView2:nil];
    [self setPaintFrameView3:nil];
    [self setAllInteractiveViews:nil];
    [self setPaintFrameTableView:nil];
    [super viewDidUnload];
}


#pragma mark- 绘画代理PaintScreenDelegate
- (EAGLContext*) createEAGleContextWithShareGroup{
    return [[EAGLContext alloc]initWithAPI:[_context API] sharegroup:[_context sharegroup]];
}

- (void) closePaintDoc:(PaintDoc *)paintDoc{
    [self.paintScreenVC dismissViewControllerAnimated:false completion:^{
        float scale = self.view.bounds.size.width / self.curPaintFrameView.bounds.size.width;        
        [self.rootView.layer setValue:[NSNumber numberWithFloat:scale] forKeyPath:@"transform.scale"];
        DebugLog(@"closePaintDoc rootView Scale: %.1f", scale);
        //刷新当前画架内容
        self.curPaintFrameView.paintDoc = paintDoc;
        [self.curPaintFrameView loadForDisplay];
        

        //更新画框内容
        NSIndexPath* indexPath = [NSIndexPath indexPathForRow:self.curPaintFrameGroup.curPaintIndex inSection:0];
        PaintFrameView *paintFrameView = [[self.paintFrameTableView cellForRowAtIndexPath:indexPath].contentView.subviews objectAtIndex:0];
        if (paintFrameView == NULL) {
            [self.paintFrameTableView reloadData];
        }
        //一张图都没有的情况下刷新paintFrameTableView
        else{
            [paintFrameView  loadForDisplay];            
        }
        
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [self.rootView.layer setValue:[NSNumber numberWithFloat:1.0] forKeyPath:@"transform.scale"];
        } completion:^(BOOL finished) {

        }];

    }];
}

#pragma mark- PaintFrame
- (void)reloadPaintFrameViews{
    if (self.curPaintFrameGroup.paintDocs != nil) {
        //将paintDoc逐个加载到画框集中
        for (int viewIndex=0; viewIndex < self.paintFrameViews.count; ++viewIndex) {
            PaintFrameView *paintFrameView =[self.paintFrameViews objectAtIndex:viewIndex];
            int docIndex = self.curPaintFrameGroup.curPaintIndex + viewIndex;
            if (docIndex < self.curPaintFrameGroup.paintDocs.count) {
                PaintDoc *paintDoc = [self.curPaintFrameGroup.paintDocs objectAtIndex:docIndex];
                [paintFrameView setPaintDoc:paintDoc];
                [paintFrameView loadForDisplay];
            }
        }
    }
}

//打开当前画框
-(void)openPaintFrame {
    if (self.paintScreenVC == NULL) {
        self.paintScreenVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"paintScreen"];
        self.delegate = self.paintScreenVC;
        self.paintScreenVC.delegate = self;
    }
    
    //如果paintDoc为空，则新建一个paintDoc
    if(self.curPaintFrameGroup.curPaintFrame.paintDoc == NULL){
        DebugLog(@"curPaintFrame paintDoc NULL, Create New!");
        PaintDoc *paintDoc = [[PaintDocManager sharedInstance] createPaintDocInDirectory:self.curPaintFrameGroup.dirPath];
        self.curPaintFrameGroup.curPaintFrame.paintDoc = paintDoc;
        [self.curPaintFrameGroup.paintDocs addObject:paintDoc];
    }
    
    //打开绘图面板
    [self presentViewController:self.paintScreenVC animated:false completion:^{
        [self.delegate openDoc:self.curPaintFrameGroup.curPaintFrame.paintDoc];
    }];
}

- (void)openPaintFrameWithAnim{
    //屏幕放缩动画
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        float scale = self.view.bounds.size.width / self.curPaintFrameView.bounds.size.width;
        [self.rootView.layer setValue:[NSNumber numberWithFloat:scale] forKeyPath:@"transform.scale"];
    } completion:^(BOOL finished) {
        //恢复所有按钮可操作
        [self setAllInteractive:true];
        //打开绘图界面开始绘图
        [self openPaintFrame];
        //不reset会导致问题
        [self.rootView.layer setValue:[NSNumber numberWithFloat:1.0] forKeyPath:@"transform.scale"];
    }];
}

- (void)nextPaintFrame
{
    [self setAllInteractive:false];
    //画框左侧移出
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.curPaintFrameView.frame = CGRectMake(-self.curPaintFrameView.frame.size.width, self.curPaintFrameView.frame.origin.y, self.curPaintFrameView.frame.size.width, self.curPaintFrameView.frame.size.height);
    } completion:^(BOOL finished) {
        //重载paintDoc到paintFrame
        [self.curPaintFrameGroup movePaintIndexByStep:1];
        [self reloadPaintFrameViews];
        //画框右侧移入
        self.curPaintFrameView.frame = CGRectMake(self.view.frame.size.width, self.curPaintFrameView.frame.origin.y, self.curPaintFrameView.frame.size.width, self.curPaintFrameView.frame.size.height);
        
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.curPaintFrameView.frame = CGRectMake(self.paintFrameRootViewPos.x, self.paintFrameRootViewPos.y, self.curPaintFrameView.frame.size.width, self.curPaintFrameView.frame.size.height);
        } completion:^(BOOL finished) {
            //收起夹子
            [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.studioHuaJiaJiaZi.frame = CGRectMake(self.studioHuaJiaJiaZi.frame.origin.x, self.studioHuaJiaJiaZiPosY, self.studioHuaJiaJiaZi.frame.size.width, self.studioHuaJiaJiaZi.frame.size.height);
            } completion:^(BOOL finished) {
                [self setAllInteractive:true];
            }];
        }];
    }];
}

- (void)lastPaintFrame
{
    [self setAllInteractive:false];
    //画框右侧移出
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.curPaintFrameView.frame = CGRectMake(self.view.frame.size.width, self.curPaintFrameView.frame.origin.y, self.curPaintFrameView.frame.size.width, self.curPaintFrameView.frame.size.height);
    } completion:^(BOOL finished) {
        //重载paintDoc到paintFrame
        [self.curPaintFrameGroup movePaintIndexByStep:-1];
        [self reloadPaintFrameViews];
        //画框左侧移入
        self.curPaintFrameView.frame = CGRectMake(-self.curPaintFrameView.frame.size.width, self.curPaintFrameView.frame.origin.y, self.curPaintFrameView.frame.size.width, self.curPaintFrameView.frame.size.height);
        
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.curPaintFrameView.frame = CGRectMake(self.paintFrameRootViewPos.x, self.paintFrameRootViewPos.y, self.curPaintFrameView.frame.size.width, self.curPaintFrameView.frame.size.height);
        } completion:^(BOOL finished) {
            //收起夹子
            [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.studioHuaJiaJiaZi.frame = CGRectMake(self.studioHuaJiaJiaZi.frame.origin.x, self.studioHuaJiaJiaZiPosY, self.studioHuaJiaJiaZi.frame.size.width, self.studioHuaJiaJiaZi.frame.size.height);
            } completion:^(BOOL finished) {
                [self setAllInteractive:true];
            }];
        }];
    }];
}
- (IBAction)paintFrameButtonTouchUp:(PaintFrameView *)sender {
    [self openPaintFrameWithAnim];
}



- (IBAction)newPaintFrameButtonTouchUp:(UIButton *)sender {
    //完成操作前不可交互
    sender.userInteractionEnabled = false;
    
    self.studioHuaJiaJiaZiPosY = self.studioHuaJiaJiaZi.frame.origin.y;
    self.paintFrameRootViewPos = self.curPaintFrameView.frame.origin;
    //打开夹子
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.studioHuaJiaJiaZi.frame = CGRectMake(self.studioHuaJiaJiaZi.frame.origin.x, self.studioHuaJiaJiaZiPosY - 10, self.studioHuaJiaJiaZi.frame.size.width, self.studioHuaJiaJiaZi.frame.size.height);
    } completion:^(BOOL finished) {
        //画框左侧移出
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.curPaintFrameView.frame = CGRectMake(-self.curPaintFrameView.frame.size.width, self.curPaintFrameView.frame.origin.y, self.curPaintFrameView.frame.size.width, self.curPaintFrameView.frame.size.height);
        } completion:^(BOOL finished) {
            //插入新paintDoc到paintDocs中，重载paintDoc到paintFrame
            PaintDoc *paintDoc = [[PaintDocManager sharedInstance] createPaintDocInDirectory:self.curPaintFrameGroup.dirPath];
            self.curPaintFrameGroup.curPaintIndex ++;
            [self.curPaintFrameGroup.paintDocs insertObject:paintDoc atIndex:self.curPaintFrameGroup.curPaintIndex];
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.curPaintFrameGroup.curPaintIndex inSection:0];
            [self.paintFrameTableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
            
            self.curPaintFrameView.paintDoc = paintDoc;
            [self.curPaintFrameView loadForDisplay];
            
            //画框右侧移入
            self.curPaintFrameView.frame = CGRectMake(self.view.frame.size.width, self.curPaintFrameView.frame.origin.y, self.curPaintFrameView.frame.size.width, self.curPaintFrameView.frame.size.height);
            
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.curPaintFrameView.frame = CGRectMake(self.paintFrameRootViewPos.x, self.paintFrameRootViewPos.y, self.curPaintFrameView.frame.size.width, self.curPaintFrameView.frame.size.height);
            } completion:^(BOOL finished) {
                //收起夹子
                [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    self.studioHuaJiaJiaZi.frame = CGRectMake(self.studioHuaJiaJiaZi.frame.origin.x, self.studioHuaJiaJiaZiPosY, self.studioHuaJiaJiaZi.frame.size.width, self.studioHuaJiaJiaZi.frame.size.height);
                } completion:^(BOOL finished) {
                    //放大画框开始绘制
                    [self openPaintFrameWithAnim];
                }];
            }];
        }];
    }];

}

- (IBAction)deletePaintFrameButtonTouchUp:(UIButton *)sender {
    [self.curPaintFrameGroup.paintDocs removeObjectAtIndex:self.curPaintFrameGroup.curPaintIndex];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.curPaintFrameGroup.curPaintIndex inSection:0];
    [self.paintFrameTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
    if (self.curPaintFrameGroup.curPaintIndex == self.curPaintFrameGroup.paintDocs.count) {
        self.curPaintFrameGroup.curPaintIndex--;
    }
    [self selectPaintFrameAtIndex:self.curPaintFrameGroup.curPaintIndex];
}

- (void)setAllInteractive:(BOOL)interactive{
    //动画中禁止交互
    for (UIView *view in self.allInteractiveViews) {
        view.userInteractionEnabled = interactive;
    }
}
- (IBAction)handlePanPaintFrameRootView:(UIPanGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        self.studioHuaJiaJiaZiPosY = self.studioHuaJiaJiaZi.frame.origin.y;
        //打开夹子
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.studioHuaJiaJiaZi.frame = CGRectMake(self.studioHuaJiaJiaZi.frame.origin.x, self.studioHuaJiaJiaZiPosY - 10, self.studioHuaJiaJiaZi.frame.size.width, self.studioHuaJiaJiaZi.frame.size.height);
        } completion:^(BOOL finished) {
        }];
        
        self.paintFrameRootViewPos = self.curPaintFrameView.frame.origin;
    }
    //平移画纸
    else if (sender.state == UIGestureRecognizerStateChanged) {
        float translationX = [sender translationInView:sender.view].x;
        self.curPaintFrameView.frame = CGRectMake(self.paintFrameRootViewPos.x + translationX, self.paintFrameRootViewPos.y, self.curPaintFrameView.frame.size.width, self.curPaintFrameView.frame.size.height);
    }
    //移走画纸，下一张
    else if (sender.state == UIGestureRecognizerStateEnded) {
        //后一张
        if ([sender translationInView:sender.view].x > 0) {
            [self lastPaintFrame];
        }
        //前一张
        else if ([sender translationInView:sender.view].x < 0) {
            [self nextPaintFrame];
        }
    }
    
    
}
#pragma mark - Table View Data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    DebugLog(@"numberOfSectionsInTableView");
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    DebugLog(@"numberOfRowsInSection: %d",self.curPaintFrameGroup.paintDocs.count);
    return self.curPaintFrameGroup.paintDocs.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DebugLog(@"cellForRowAtIndexPath row:%d", indexPath.row);
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.contentView.transform = CGAffineTransformMakeRotation(M_PI / 2);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        //创建PaintFrameView
        PaintFrameView *paintFrameView = [[PaintFrameView alloc]initWithFrame:CGRectMake(80, 15, 108, 144)];
        paintFrameView.userInteractionEnabled = false;
        paintFrameView.backgroundColor = [UIColor whiteColor];
        [paintFrameView addTarget:self action:@selector(selectPaintFrame:) forControlEvents:UIControlEventTouchUpInside];
        [[cell contentView] addSubview:paintFrameView];
        
        //添加画框
        UIView *cellBackgroundView = [[UIView alloc]initWithFrame:CGRectZero];
        cell.backgroundView = cellBackgroundView;
        cell.backgroundView.transform = CGAffineTransformMakeRotation(M_PI / 2);
        UIView *frameView = [[UIView alloc]initWithFrame:CGRectMake(70, 0, 130, 174)];
        frameView.backgroundColor = [UIColor darkGrayColor];
        frameView.layer.shadowOpacity = 0.4;
        frameView.layer.shadowOffset = CGSizeMake(5, 10);
        frameView.layer.shadowRadius = 4.0;
        frameView.layer.shadowColor = [UIColor blackColor].CGColor;
        frameView.layer.shadowPath = [UIBezierPath bezierPathWithRect:frameView.bounds].CGPath;
        [cell.backgroundView addSubview:frameView];

    }
    else{

    }
    
    //重载
    PaintFrameView *paintFrameView = [[cell contentView].subviews objectAtIndex:0];
    PaintDoc *paintDoc = [self.curPaintFrameGroup.paintDocs objectAtIndex:indexPath.row];
    [paintFrameView setPaintDoc:paintDoc];
    [paintFrameView loadForDisplay];
    DebugLog(@"paintFrameViewDocThumbImage: %@", paintFrameView.paintDoc.thumbImagePath);
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.view.frame.size.width / 3.0;
}

-(void)selectPaintFrameAtIndex:(int)index{
    DebugLog(@"selectPaintFrameAtIndex %d", index);
    self.curPaintFrameGroup.curPaintIndex = index;
    //设置当前画架
    PaintDoc *paintDoc = [self.curPaintFrameGroup.paintDocs objectAtIndex:index];
    self.curPaintFrameView.paintDoc = paintDoc;
    [self.curPaintFrameView loadForDisplay];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
    DebugLog(@"didSelectRowAtIndexPath %d", indexPath.row);
    [self selectPaintFrameAtIndex:indexPath.row];
}
@end
