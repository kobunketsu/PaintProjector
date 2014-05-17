//
//  LayerTableViewController.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-17.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "LayerTableViewController.h"
#import "LayerTableViewCell.h"
#import "BackgroundLayerTableViewCell.h"
#import "LayerTableViewCellBackgroundView.h"
#import "LayerToolView.h"
#import "FuzzyTransparentView.h"
#import "PaintUIKitStyle.h"

const float LayerTableViewCellHeight  = 155;
const float BackgroundLayerTableViewCellHeight = 75;
const float LayerTableViewWidth = 256;

@interface LayerTableViewController ()

@end

@implementation LayerTableViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {

    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    //更新UI颜色
    [self addObserver:self forKeyPath:@"backgroundLayer.clearColor" options:NSKeyValueObservingOptionOld context:nil];
    [self updateIconColors];
}
- (void)viewDidDisappear:(BOOL)animated{
    [self removeObserver:self forKeyPath:@"backgroundLayer.clearColor"];
}
- (void)dealloc{
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:BackgroundLayerClearColorChangedNotification object:nil];
}

- (void)backgroundLayerClearColorChanged{
    CGFloat colorRGBA[4];
    [self.backgroundLayer.clearColor getRed: &colorRGBA[0] green: &colorRGBA[1] blue: &colorRGBA[2] alpha: &colorRGBA[3]];
    for (UIButton *button in self.layerToolButtons) {
        
        ((CustomLayer*)button.layer).baseColorR = colorRGBA[0];
        ((CustomLayer*)button.layer).baseColorG = colorRGBA[1];
        ((CustomLayer*)button.layer).baseColorB = colorRGBA[2];
        
        [button.layer setNeedsDisplay];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(backgroundLayerClearColorChanged)
//                                                 name:BackgroundLayerClearColorChangedNotification
//                                               object:nil];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //添加blendModeTableViewController
    self.inBlendModeRow = -1;
    self.blendModeTableViewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"LayerBlendModeTableViewController"];
    self.blendModeTableViewController.delegate = self;
    [self addChildViewController:self.blendModeTableViewController];
    
    //状态 窗口大小
    self.tableView.editing = true;
    self.preferredContentSize = CGSizeMake(self.tableViewWidth, self.tableViewHeight);
    
    //得到当前选定层(加载图片后选择)
    //[self selectRowForCurLayer];
    
    //设定好半透明的源图
    UIView *sourceView = [self.delegate willGetFuzzyTransparentSourceView];
    self.rootView.sourceView = sourceView;
    self.rootView.delegate = self;
}


- (void)selectRowForCurLayer{
    int layerIndex = [self.delegate willGetLayerIndex];
    int row = [self rowForLayerIndex:layerIndex];
    self.curLayerIndexPath = [NSIndexPath indexPathForRow:row inSection:0];
    [self selectRowAtIndexPath:self.curLayerIndexPath];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidUnload {
    [super viewDidUnload];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    
    // Return the number of rows in the section.
    return [self.layers count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //反过来显示
    if ([self rowForBackgroundLayer] == indexPath.row) {
        BackgroundLayerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BackgroundLayerTableViewCell"];
        BackgroundLayer *backgroundLayer = self.backgroundLayer;
        cell.visibleButton.isVisible = backgroundLayer.visible;
        cell.visibleButton.tag = -1;
        
        cell.isAccessibilityElement = true;
        cell.accessibilityLabel = @"BackgroundCell";
        cell.backgroundView = [[LayerTableViewCellBackgroundView alloc]initWithFrame:cell.bounds];
        return cell;
    }
    else{
        LayerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LayerTableViewCell"];
        PaintLayer *layer = [self.layers objectAtIndex:[self layerIndexForRow:indexPath.row]];
        cell.visibleButton.isVisible = layer.visible;
        cell.layerOpacityLockButton.isOpacityLocked = layer.opacityLock;
        cell.layerOpacitySlider.value = layer.opacity;
        cell.visibleButton.tag = cell.layerBlendModeButton.tag = cell.layerOpacitySlider.tag = cell.layerOpacityLockButton.tag = [self layerIndexForRow:indexPath.row];
        
        cell.isAccessibilityElement = true;
        cell.accessibilityIdentifier = layer.identifier;
        cell.backgroundView = [[LayerTableViewCellBackgroundView alloc]initWithFrame:cell.bounds];
        return cell;
    }
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    if ([tableView numberOfRowsInSection:0] == 1) {
        return NO;
    }
    else if ([self rowForBackgroundLayer] == indexPath.row ) {
        return NO;
    }
    else{
        return YES;
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.inBlendModeRow == indexPath.row) {
        return UITableViewCellEditingStyleNone;
    }
    else{
        return UITableViewCellEditingStyleDelete;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @" X ";
}
- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 0;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        DebugLog(@"deleteLayerDataAtRow %d index %d", indexPath.row, [self layerIndexForRow:indexPath.row]);
        //数据 & 显示
        int layerIndex = [self layerIndexForRow:indexPath.row];
        
        //如果是最后一个图层，只删除图层内容
        if (self.layers.count == 1 && layerIndex == 0) {
            [self.delegate willEraseLayerDataAtIndex:layerIndex];//updateRender
            [self.tableView reloadData];
        }
        //删除图层
        else{
            [self.delegate willDeleteLayerDataAtIndex:layerIndex];
            
            //UI
            // Delete the row from the data source
            [self.tableView beginUpdates];
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationNone];
            [self.tableView endUpdates];
            
            [self checkEditable];
            self.preferredContentSize = CGSizeMake(self.tableViewWidth, self.tableViewHeight);
            
            
            //刷新后选择cell
            NSIndexPath *newIndexPath;
            //删除当前绘制层上方图层
            if(indexPath.row < self.curLayerIndexPath.row){
                newIndexPath = [NSIndexPath indexPathForRow:self.curLayerIndexPath.row - 1 inSection:0];
            }
            //删除当前绘制层
            else if (indexPath.row == self.curLayerIndexPath.row){
                //当前绘制层是最底层，取上一层
                if (layerIndex == 0) {
                    newIndexPath = [NSIndexPath indexPathForRow:[self rowForLayerIndex:0] inSection:0];
                }
                else{
                    newIndexPath = indexPath;
                }
            }
            //删除当前绘制层下方图层
            else{
                newIndexPath = self.curLayerIndexPath;
            }
            //        DebugLog(@"selectRowAtIndexPath row %d", newIndexPath.row);
            [self selectRowAtIndexPath:newIndexPath];
            
            //重新设过当前图层后，需要更新显示
            [self.delegate willUpdateRender];
        }
    }
}
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    if (indexPath.row == [self rowForBackgroundLayer]){
        return NO;
    }
    return YES;
}

- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath{
    DebugLog(@"[ targetIndexPathForMoveFromRowAtIndexPathSection  %d toProposedIndexPathSection %d]", sourceIndexPath.row, proposedDestinationIndexPath.row);
   
    if (proposedDestinationIndexPath.row == [self rowForBackgroundLayer]) {
        return sourceIndexPath;
    }
    else{
        return proposedDestinationIndexPath;
    }
    
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    DebugLog(@"[ moveRowAtIndexPath fromRow %d toRow %d]", fromIndexPath.row, toIndexPath.row);

    //交换数据
    [self.delegate willMoveLayerFromIndex:[self layerIndexForRow:fromIndexPath.row] toIndex:[self layerIndexForRow:toIndexPath.row]];
    
    [self.tableView reloadData];

    //刷新后选择cell
    [self selectRowForCurLayer];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//    DebugLog(@"willDisplayCell layer index %d", [self layerIndexForRow:indexPath.row]);
    
    
    if (indexPath.row == [self rowForBackgroundLayer]) {
        BackgroundLayerTableViewCell *layerTableViewCell = (BackgroundLayerTableViewCell *)cell;
        layerTableViewCell.layerImageButton.backgroundColor = [self.backgroundLayer.clearColor copy];
    }
    else{
        LayerTableViewCell *layerTableViewCell = (LayerTableViewCell *)cell;
        layerTableViewCell.layerImageView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"checkerUnit.png"]];
        //反过来显示
        PaintLayer *layer = [self.layers objectAtIndex:[self layerIndexForRow:indexPath.row]];
        layerTableViewCell.layerImageView.image = [UIImage imageWithData:layer.data];
    }

    //alpha 0.1用来透出毛玻璃效果
    cell.backgroundColor = [UIColor colorWithRed:200.0/255.0 green:200.0/255.0 blue:200.0/255.0 alpha:0.1];
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == [self rowForBackgroundLayer]) {
        return BackgroundLayerTableViewCellHeight;
    }
    else if (indexPath.row == self.inBlendModeRow){
        return LayerTableViewCellHeight + self.blendModeTableViewController.tableViewHeight;
    }
    else{
        return LayerTableViewCellHeight;
    }
}

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    if (self.inBlendModeRow == section) {
//        return self.tableView.sectionFooterHeight;
//    }
//    else{
//        return 0;
//    }
//}

//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//    //用来显示blendModeTableView
//    if (self.inBlendModeRow == section) {
//        return self.blendModeTableViewController.tableView;
//    }
//    else{
//        return nil;
//    }
//    
//}

#pragma mark - Table view custom
- (void)selectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView selectRowAtIndexPath:indexPath animated:true scrollPosition:UITableViewScrollPositionNone];
    [self tableView:self.tableView didSelectRowAtIndexPath:indexPath];
}



- (IBAction)addLayerButtonTouchUp:(UIButton *)sender {
   
    //数据
    [self.delegate willInsertLayerDataAtIndex:[self layerIndexForRow:self.curLayerIndexPath.row] completion:^{
        //UI
        DebugLog(@"insertSectionRowsAtIndexPaths %d", self.curLayerIndexPath.row-1);
        [self.tableView beginUpdates];
        
        [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:self.curLayerIndexPath] withRowAnimation:UITableViewRowAnimationNone];
        //    [self.tableView reloadData];
        [self.tableView endUpdates];
        
        [self checkEditable];
        self.preferredContentSize = CGSizeMake(self.tableViewWidth, self.tableViewHeight);
        
        //刷新后选择cell(不会invoke didSelectRowAtIndexPath)
        NSIndexPath* indexPath = [NSIndexPath indexPathForRow:self.curLayerIndexPath.row inSection:self.curLayerIndexPath.section];
        [self selectRowAtIndexPath:indexPath];
    }];
}

- (IBAction)copyLayerButtonTouchUp:(UIButton *)sender {
    
    //数据
    [self.delegate willInsertCopyLayerDataAtIndex:[self layerIndexForRow:self.curLayerIndexPath.row]];
    [self.tableView reloadData];    
    
    //UI
    [self checkEditable];
    self.preferredContentSize = CGSizeMake(self.tableViewWidth, self.tableViewHeight);

    //刷新后选择cell
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.curLayerIndexPath.row inSection:self.curLayerIndexPath.section];
    [self selectRowAtIndexPath:indexPath];
}

- (IBAction)mergeLayerButtonTouchUp:(UIButton *)sender {
 
    //数据
    [self.delegate willMergeLayerDataAtIndex:[self layerIndexForRow:self.curLayerIndexPath.row]];
    [self.tableView reloadData];
    
    //UI
    [self checkEditable];
    self.preferredContentSize = CGSizeMake(self.tableViewWidth, self.tableViewHeight);

    //刷新后选择cell
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.curLayerIndexPath.row inSection:self.curLayerIndexPath.section];
    [self selectRowAtIndexPath:indexPath];
}

- (IBAction)clearLayerButtonTouchUp:(UIButton *)sender {
    //数据
    [self.delegate willClearLayerDataAtIndex:[self layerIndexForRow:self.curLayerIndexPath.row]];
    
    [self.tableView reloadData];
    
    [self selectRowAtIndexPath:self.curLayerIndexPath];
}

- (IBAction)deleteLayerButtonTouchUp:(UIButton *)sender {
    //如果没有选择Layer
    if (self.curLayerIndexPath == nil) {
        return;
    }
    
    LayerTableViewCell *cell = (LayerTableViewCell *)[self.tableView cellForRowAtIndexPath:self.curLayerIndexPath];

    if (sender.tag == 0) {
        sender.tag = 1;
        //显示提示框
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        alertView.transform = CGAffineTransformTranslate( alertView.transform, 200, 0 );
        [alertView show];
        

        cell.layerDeleteDoneButton.hidden = false;
        [sender setNeedsDisplay];
    }
    else {
        sender.tag = 0;


        cell.layerDeleteDoneButton.hidden = true;
        [sender setNeedsDisplay];
    }
}

- (IBAction)deleteDoneLayerButtonTouchUp:(UIButton *)sender {
}


- (IBAction)layerBlendModeButtonTouchUp:(LayerBlendModeButton *)sender {
    int row = [self rowForLayerIndex:sender.tag];
    if (self.inBlendModeRow == row) {
        self.inBlendModeRow = -1;
        
        //删除blendView
        [self.blendModeTableViewController.view removeFromSuperview];
        
        //恢复滚动，编辑
        self.tableView.scrollEnabled = true;
        [self.tableView setEditing:true];
        for (UIButton *button in self.layerToolButtons) {
            button.hidden = false;
        }
        self.blendModeLabel.hidden = true;
    }
    else{
        self.inBlendModeRow = row;
        int row = [self rowForLayerIndex:sender.tag];
        self.curSetupIndexPath = [NSIndexPath indexPathForRow:row inSection:0];
        
        //调整blendModeTableView的位置
        UITableView* tableView = (UITableView*)self.blendModeTableViewController.view;
        CGRect rect = tableView.frame;
        rect.origin.y = LayerTableViewCellHeight;
        rect.size = CGSizeMake(self.tableViewWidth * 0.7, rect.size.height);
        tableView.contentSize = rect.size;
        tableView.frame = rect;
        
        //添加blendView
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:self.curSetupIndexPath];
        [cell.contentView addSubview:self.blendModeTableViewController.view];
        [cell.contentView bringSubviewToFront:self.blendModeTableViewController.view];

        
        //禁止滚动，编辑
        self.tableView.scrollEnabled = false;
        [self.tableView setEditing:false];
        for (UIButton *button in self.layerToolButtons) {
            button.hidden = true;
        }
        self.blendModeLabel.hidden = false;
    }
    
    //刷新，滚动到顶部，调整显示大小
    [self.tableView reloadData];
    
    [self.tableView scrollToRowAtIndexPath:self.curSetupIndexPath atScrollPosition:UITableViewScrollPositionTop animated:true];

    self.preferredContentSize = CGSizeMake(self.tableViewWidth, self.tableViewHeight);
    
    [self selectRowAtIndexPath:self.curLayerIndexPath];
}

- (IBAction)backgroundLayerImageButtonTouchUp:(UIButton *)sender {
    self.backgroundLayerButton = sender;
    [self.delegate willSetBackgroundLayerClearColor:sender colorPickerControllerDelegate:self];
}

- (IBAction)backgroundLayerVisibleButtonTouchUp:(LayerVisibleButton *)sender {
    sender.isVisible = !sender.isVisible;
    [self.delegate willSetBackgroundLayerVisible:sender.isVisible];
}

- (IBAction)layerTransformButtonTouchUp:(UIButton *)sender {
}

- (IBAction)layerVisibleButtonTouchUp:(UIButton *)sender {
    LayerVisibleButton *button = (LayerVisibleButton *)sender;
    button.isVisible = !button.isVisible;
    DebugLog(@"SetLayerAtIndex Index %d visible %i", button.tag, button.isVisible);
    [self.delegate willSetLayerAtIndex:button.tag visible:button.isVisible];
}

- (IBAction)layerOpacityLockButtonTouchUp:(UIButton *)sender {
    LayerOpacityLockButton *button = (LayerOpacityLockButton *)sender;
    button.isOpacityLocked = !button.isOpacityLocked;
    
    DebugLog(@"SetLayerAtIndex Index %d opacityLock %i", button.tag, button.isOpacityLocked);
    [self.delegate willSetLayerAtIndex:button.tag opacityLock:button.isOpacityLocked];
}

- (IBAction)layerOpacitySliderSlide:(UISlider *)sender {
    [self.delegate willSetLayerAtIndex:sender.tag opacity:sender.value];
}

- (float)tableViewWidth {
    return LayerTableViewWidth;
}
- (float)tableViewHeight {
//    DebugLog(@"toolBar height %.1f", self.toolBar.bounds.size.height);
    float height = LayerTableViewCellHeight * [self.layers count] + BackgroundLayerTableViewCellHeight + self.toolBar.bounds.size.height;
    if (self.inBlendModeRow >= 0) {
        height += self.blendModeTableViewController.tableViewHeight;
    }
//    DebugLog(@"tableViewHeight %.1f", MIN(self.tableViewHeightMax, height));
    return MIN(self.tableViewHeightMax, height);
}
- (int)layerIndexForRow:(int)row{
    return self.layers.count - 1 - row;
}
- (int)rowForLayerIndex:(int)layerIndex{
    return self.layers.count - 1 - layerIndex;
}
- (int)rowForBackgroundLayer{
    return self.layers.count;
}

- (void)checkEditable{
    if ([self.tableView numberOfRowsInSection:0] == 1) {
        self.tableView.editing = false;
    }
    else{
        self.tableView.editing = true;
    }
}
#pragma mark LayerBlendModeTableView delegate
- (LayerBlendMode) willGetLayerBlendMode{
    int layerIndex = [self layerIndexForRow:self.curSetupIndexPath.row];
    PaintLayer *layer = [self.layers objectAtIndex:layerIndex];
    return layer.blendMode;
}

- (void) willSetLayerBlendMode:(LayerBlendMode)blendMode{
    [self.delegate willSetLayerBlendMode:blendMode atIndex:self.curSetupIndexPath.row];
}

- (float) willGetLayerOpacity{
    int index = [self layerIndexForRow:self.curSetupIndexPath.row];
    PaintLayer *layer = [self.layers objectAtIndex:index];
    return layer.opacity;
}
- (void) willSetLayerOpacity:(float)opacity{
    int index = [self layerIndexForRow:self.curSetupIndexPath.row];
    [self.delegate willSetLayerAtIndex:index opacity:opacity];
}
#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DebugLog(@"[didSelectRowAtIndexPath row %d]", indexPath.row);
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
    [self.delegate willSetCurLayerDataAtIndex:[self layerIndexForRow:indexPath.row]];
    self.curLayerIndexPath = indexPath;
}


#pragma mark 
//- (void)registerDeviceRotation{
//    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
//    [[NSNotificationCenter defaultCenter]
//     addObserver:self selector:@selector(orientationChanged:)
//     name:UIDeviceOrientationDidChangeNotification
//     object:[UIDevice currentDevice]];
//}
//
//- (void) orientationChanged:(NSNotification *)note
//{
//    UIDevice * device = note.object;
//    DebugLog(@"orientationChanged %d", device.orientation);
//    
//    for (AutoRotateButton* button in self.autoRotateButtons) {
//        button.isInterfacePortraitUpsideDown = self.isInterfacePortraitUpsideDown;
//        button.orientation = device.orientation;
//    }
//    
//    
//}

#pragma mark- 取色器 InfColorPicker IB actions
- (void) colorPickerControllerDidFinish: (InfColorPickerController*) controller
{
    self.backgroundLayerButton.backgroundColor = [controller.resultColor copy];
    [self.delegate willSetBackgroundLayerClearColorFinished:controller.resultColor];
}

-(void) colorPickerControllerDidChangeColor:(InfColorPickerController *)controller{
    self.backgroundLayerButton.backgroundColor = [controller.resultColor copy];
    [self.delegate willSetBackgroundLayerClearColorChanged:controller.resultColor];
}

#pragma mark- FuzzyTransparentViewDelegate
-(void)willSnapshotUIImageEnd:(UIImage *)image{
//    DebugLog(@"willSnapshotUIImageEnd");
//    //更新顶部按钮颜色
//    [CATransaction begin];
//    [CATransaction setAnimationDuration:1.0];
//    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
//    [CATransaction setCompletionBlock:^{
////        DebugLog(@"button baseColor finished");
//        for (AutoRotateButton *button in self.layerToolButtons) {
//            [button.layer removeAllAnimations];
//        }
//    }];
//    
//    for (AutoRotateButton *button in self.layerToolButtons) {
////        DebugLog(@"topToolBarButton %@", button);
//        CABasicAnimation *colorAnim = [CABasicAnimation animationWithKeyPath:@"baseColor"];
//        //在sourceView位置上采样颜色
//        CGPoint point = [self.toolBar convertPoint:button.center toView:self.rootView.sourceView];
//        UIColor *toColor = [image pickPixelAtX:(NSUInteger)point.x Y:(NSUInteger)point.y];
//        
//        CGFloat colorRGBA[4];
//        [toColor getRed: &colorRGBA[0] green: &colorRGBA[1] blue: &colorRGBA[2] alpha: &colorRGBA[3]];
//       
//        UIColor* toColorShadow = [UIColor colorWithRed: (colorRGBA[0] * 0.675) green: (colorRGBA[1] * 0.675) blue: (colorRGBA[2] * 0.675) alpha: 1.0];
//        
//        //        colorAnim.fromValue = (__bridge id)([UIColor colorWithCGColor:((CustomLayer*)button.layer).baseColor].CGColor);
//        CGColorRelease((__bridge CGColorRef)(colorAnim.fromValue));
//        CGColorRelease((__bridge CGColorRef)(colorAnim.toValue));
//        colorAnim.fromValue = (__bridge id)(CGColorCreateCopy(((CustomLayer*)button.layer).baseColor));
//        colorAnim.toValue = (__bridge id)(toColorShadow.CGColor);
//        
//        [button.layer removeAnimationForKey:@"baseColor"];
//        [button.layer addAnimation:colorAnim forKey:@"baseColor"];
//        //release previous colorRef created by CGColorCreate
//        //        ((CustomLayer*)button.layer).baseColor = [UIColor colorWithCGColor:(toColorShadow.CGColor)].CGColor;
//        CGColorRelease(((CustomLayer*)button.layer).baseColor);
//        ((CustomLayer*)button.layer).baseColor = CGColorCreateCopy(toColorShadow.CGColor);
//    }
//    [CATransaction commit];
}

-(void)willRemoveFuzzyTransparentEnd{
    DebugLog(@"willRemoveFuzzyTransparentEnd");
}
- (void)updateIconColors{
    CGFloat colorRGBA[4];
    [self.backgroundLayer.clearColor getRed: &colorRGBA[0] green: &colorRGBA[1] blue: &colorRGBA[2] alpha: &colorRGBA[3]];
    for (AutoRotateButton *button in self.layerToolButtons) {
        ((CustomLayer*)button.layer).baseColorR = colorRGBA[0];
        ((CustomLayer*)button.layer).baseColorG = colorRGBA[1];
        ((CustomLayer*)button.layer).baseColorB = colorRGBA[2];
        [button.layer setNeedsDisplay];
    }
    
    size_t num = [self.tableView numberOfRowsInSection:0];
    for (int i = 0; i < num-1; ++i) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        LayerTableViewCell *cell = (LayerTableViewCell * )[self.tableView cellForRowAtIndexPath:indexPath];
        for (IconColorPermeateButton *button in cell.layerHelpButtons) {
            ((CustomLayer*)button.layer).baseColorR = colorRGBA[0];
            ((CustomLayer*)button.layer).baseColorG = colorRGBA[1];
            ((CustomLayer*)button.layer).baseColorB = colorRGBA[2];
            [button.layer setNeedsDisplay];
        }
    }
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:num-1 inSection:0];
    BackgroundLayerTableViewCell *cell = (BackgroundLayerTableViewCell * )[self.tableView cellForRowAtIndexPath:indexPath];
    ((CustomLayer*)cell.visibleButton.layer).baseColorR = colorRGBA[0];
    ((CustomLayer*)cell.visibleButton.layer).baseColorG = colorRGBA[1];
    ((CustomLayer*)cell.visibleButton.layer).baseColorB = colorRGBA[2];
    [cell.visibleButton.layer setNeedsDisplay];


}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                        change:(NSDictionary *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"backgroundLayer.clearColor"]) {
        [self updateIconColors];
    }
}
@end
