//
//  LayerBlendModeTableViewController.h
//  iReporter
//
//  Created by 胡 文杰 on 13-4-16.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaintLayer.h"

@protocol LayerBlendModeTableViewControllerDelegate
- (void) didFinishSelectLayerBlendMode:(LayerBlendMode)blendMode;
@end

@interface LayerBlendModeTableViewController : UITableViewController
{
}
@property (nonatomic, assign) id delegate;
@end
