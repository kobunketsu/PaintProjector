//
//  BrushTypeViewController.h
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-9.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Brush.h"

@protocol BrushTypeViewControllerDelegate
- (void) didFinishSelectBrushType:(BrushType)brushType;
@end
@interface BrushTypeViewController : UITableViewController
@property (assign, nonatomic) id delegate;
@end
