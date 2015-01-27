//
//  LayerBlendModeTableViewController.h
//  PaintProjector
//
//  Created by 胡 文杰 on 13-4-16.
//  Copyright (c) 2013年 Hu Wenjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADPaintLayer.h"

@protocol ADLayerBlendModeTableViewControllerDelegate
- (LayerBlendMode) willGetLayerBlendMode;
- (void) willSetLayerBlendMode:(LayerBlendMode)blendMode;
- (float) willGetLayerOpacity;
- (void) willSetLayerOpacity:(float)opacity;
@end

@interface ADLayerBlendModeTableViewController : UITableViewController
//<UITableViewDelegate, UITableViewDataSource>
{
}
//@property (weak, nonatomic) IBOutlet LayerBlendModeTableView *tableView;
@property (assign, nonatomic) float tableViewHeight;
@property (assign, nonatomic) id delegate;
- (void)willSelectRowAtIndexPath:(NSIndexPath*)indexPath;
- (float)tableViewHeight;
@end
