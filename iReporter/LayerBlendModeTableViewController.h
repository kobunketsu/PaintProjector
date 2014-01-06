//
//  LayerBlendModeTableViewController.h
//  iReporter
//
//  Created by 胡 文杰 on 13-4-16.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaintLayer.h"
const int LayerBlendModeCellHeight = 39;

@protocol LayerBlendModeTableViewControllerDelegate
- (LayerBlendMode) willGetLayerBlendMode;
- (void) willSetLayerBlendMode:(LayerBlendMode)blendMode;
- (float) willGetLayerOpacity;
- (void) willSetLayerOpacity:(float)opacity;
@end

@interface LayerBlendModeTableViewController : UITableViewController
//<UITableViewDelegate, UITableViewDataSource>
{
}
//@property (weak, nonatomic) IBOutlet LayerBlendModeTableView *tableView;
@property(nonatomic, assign) float tableViewHeight;
@property (nonatomic, assign) id delegate;
- (void)willSelectRowAtIndexPath:(NSIndexPath*)indexPath;
- (float)tableViewHeight;
@end
