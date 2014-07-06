//
//  BrushTypeViewController.h
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-9.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADBrush.h"

@protocol ADBrushTypeViewControllerDelegate
- (void) didFinishSelectBrushType:(BrushType)brushType;
@end
@interface ADBrushTypeViewController : UITableViewController
@property (assign, nonatomic) id delegate;
@end
