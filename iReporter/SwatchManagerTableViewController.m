//
//  SwatchManagerViewController.m
//  PaintProjector
//
//  Created by kobunketsu on 14-2-28.
//  Copyright (c) 2014年 WenjiHu. All rights reserved.
//

#import "SwatchManagerTableViewController.h"
#import "SwatchManagerTableViewCell.h"
#import "SwatchCollectionViewCell.h"

@interface SwatchManagerTableViewController ()
@property(retain, nonatomic) NSArray *swatches;
@end

@implementation SwatchManagerTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    self.swatches = [[NSBundle mainBundle] URLsForResourcesWithExtension:@"swatch" subdirectory:@"Swatches"];

    return self.swatches.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"swatchManagerTableViewCell";
    SwatchManagerTableViewCell *cell = (SwatchManagerTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.swatchCollectionView.tag = indexPath.row;
    NSURL *url = [self.swatches objectAtIndex:indexPath.row];
    NSString *fileName = [url.pathComponents lastObject];
    NSString *swatchName = [fileName stringByDeletingPathExtension];

    [cell.swatchNameButton setTitle:swatchName forState:UIControlStateNormal];
    
    return cell;
}
#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSURL *url = (NSURL *)[self.swatches objectAtIndex:indexPath.row];
    [self.delegate willSetSwatchFile:url];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

#pragma mark- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSURL *url = [self.swatches objectAtIndex:collectionView.tag];
    NSArray *colorDatas = [NSArray arrayWithContentsOfURL:url];
    return colorDatas.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"swatchCollectionViewCell";
    SwatchCollectionViewCell *cell = (SwatchCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    // Configure the cell...
    NSURL *url = [self.swatches objectAtIndex:collectionView.tag];
    NSArray *colorDatas = [NSArray arrayWithContentsOfURL:url];
    if (indexPath.row >= colorDatas.count) {
        cell.colorButton.color = [UIColor clearColor];
    }
    else{
        NSString *colorData = [colorDatas objectAtIndex:indexPath.row];
        NSArray *rgb = [colorData componentsSeparatedByString:@" "];
        CGFloat r = [rgb[0] integerValue] / 255.0;
        CGFloat g = [rgb[1] integerValue] / 255.0;
        CGFloat b = [rgb[2] integerValue] / 255.0;
        cell.colorButton.color = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    }
    
    return cell;
}

@end
