//
//  LayerBlendModeTableView.h
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-6-26.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LayerBlendModeTableViewController.h"

@interface LayerBlendModeTableView : UITableView
{
    NSInteger _selectedRow;
}
@property (nonatomic, weak) LayerBlendModeTableViewController* controller;
@end
