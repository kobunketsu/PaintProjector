//
//  SwatchManagerViewController.h
//  PaintProjector
//
//  Created by 胡 文杰 on 3/6/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SwatchChartButton;

@interface SwatchManagerViewController : UIViewController
<UITableViewDelegate,
UITableViewDataSource,
UICollectionViewDataSource,
UICollectionViewDelegate,
UISearchBarDelegate,
UISearchDisplayDelegate>

- (IBAction)backButtonTouchUp:(UIButton *)sender;
- (IBAction)swatchChartButtonTouchUp:(SwatchChartButton *)sender;
- (IBAction)swatchChartButtonTouchDown:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(assign, nonatomic) id delegate;
@end

@protocol SwatchManagerViewControllerDelegate
- (void)willSetSwatchFile:(NSURL*)url;
@end