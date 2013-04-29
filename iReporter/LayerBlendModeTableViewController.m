//
//  LayerBlendModeTableViewController.m
//  iReporter
//
//  Created by 胡 文杰 on 13-4-16.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "LayerBlendModeTableViewController.h"
#import "PaintLayer.h"

@interface LayerBlendModeTableViewController ()

@end

@implementation LayerBlendModeTableViewController
@synthesize delegate;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        UITableView *tv = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 20, 1024)
                                                       style:UITableViewStyleGrouped];
        
        // assuming that your controller adopts the UITableViewDelegate and
        // UITableViewDataSource protocols, add the following 2 lines:
        
        tv.delegate = self;
        tv.dataSource = self;
        
        self.tableView = tv;
        
        self.view = self.tableView;
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
#if SIMPLE_LAYER
    return 4;
#else
    return 16;
#endif
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // configure cell...
#if SIMPLE_LAYER
    switch(indexPath.row) { // assuming there is only one section
        case 0:
            cell.textLabel.text = @"Normal:";
            break;
        case 1:
            cell.textLabel.text = @"Multiply:";
            break;
        case 2:
            cell.textLabel.text = @"Add";
            break;
        case 3:
            cell.textLabel.text = @"Screen";
            break;
        default:
            break;
    }
#else
    switch(indexPath.row) { // assuming there is only one section
        case 0:
            cell.textLabel.text = @"Normal:";
            break;
        case 1:
            cell.textLabel.text = @"Multiply:";
            break;
        case 2:
            cell.textLabel.text = @"Screen";
            break;
        case 3:
            cell.textLabel.text = @"Overlay";
            break;
        case 4:
            cell.textLabel.text = @"Darken";
            break;
        case 5:
            cell.textLabel.text = @"Lighten";
            break;
        case 6:
            cell.textLabel.text = @"ColorDodge";
            break;
        case 7:
            cell.textLabel.text = @"ColorBurn";
            break;
        case 8:
            cell.textLabel.text = @"SoftLight";
            break;
        case 9:
            cell.textLabel.text = @"HardLight";
            break;
        case 10:
            cell.textLabel.text = @"Difference";
            break;
        case 11:
            cell.textLabel.text = @"Exclusion";
            break;
        case 12:
            cell.textLabel.text = @"Hue";
            break;
        case 13:
            cell.textLabel.text = @"Saturation";
            break;
        case 14:
            cell.textLabel.text = @"Color";
            break;
        case 15:
            cell.textLabel.text = @"Luminosity";
            break;
        default:
            break;
    }
#endif
    return cell;
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */

    
    [delegate didFinishSelectLayerBlendMode:(LayerBlendMode)indexPath.row];
    
}

@end
