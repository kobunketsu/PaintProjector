//
//  SwatchManagerViewController.h
//  PaintProjector
//
//  Created by kobunketsu on 14-2-28.
//  Copyright (c) 2014年 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwatchManagerTableViewController : UITableViewController <UICollectionViewDataSource, UICollectionViewDelegate>
@property(assign, nonatomic) id delegate;
@end

@protocol SwatchManagerTableViewControllerDelegate
- (void)willSetSwatchFile:(NSURL*)url;
@end