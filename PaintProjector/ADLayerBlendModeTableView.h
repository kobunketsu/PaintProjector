//
//  LayerBlendModeTableView.h
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-6-26.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADLayerBlendModeTableViewController.h"

@interface ADLayerBlendModeTableView : UITableView
{
    NSInteger _selectedRow;
}
@property (weak, nonatomic) ADLayerBlendModeTableViewController* controller;
@end
