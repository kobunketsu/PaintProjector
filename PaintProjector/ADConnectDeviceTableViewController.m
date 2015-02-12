//
//  ADConnectDeviceTableViewController.m
//  PaintProjector
//
//  Created by 文杰 胡 on 2/3/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import "ADConnectDeviceTableViewController.h"
#import <JotTouchSDK/JotTouchSDK.h>

@interface ADConnectDeviceTableViewController ()

@end

@implementation ADConnectDeviceTableViewController

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
- (void)viewDidAppear:(BOOL)animated{
    [Flurry logEvent:@"PS_inConnectDevice" withParameters:nil timed:true];
}
- (void)viewDidDisappear:(BOOL)animated{
    [Flurry endTimedEvent:@"PS_inConnectDevice" withParameters:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 3;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    // Configure the cell...
    switch(indexPath.row) { // assuming there is only one section
        case 0:
            cell.textLabel.text = NSLocalizedString(@"AdonitJotTouch", nil);
            break;
        case 1:
            cell.textLabel.text = NSLocalizedString(@"WacomCreativeStylus", nil);
            break;
        case 2:
            cell.textLabel.text = NSLocalizedString(@"PogoConnect", nil);
            break;
        default:
            break;
    }
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
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
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
    switch(indexPath.row) { // assuming there is only one section
        case 0:
        {
            [RemoteLog logAction:@"PS_didSelectDeviceAdonitJotTouch" identifier:nil];
            [self.delegate didSelectDeviceAdonitJotTouch];
        }
            break;
        case 1:
        {
            [RemoteLog logAction:@"PS_didSelectDeviceWacomStylus" identifier:nil];
            [self.delegate didSelectDeviceWacomStylus];
        }
            break;
        case 2:
        {
            [RemoteLog logAction:@"PS_didSelectDevicePogoConnect" identifier:nil];
            [self.delegate didSelectDevicePogoConnect];
        }
            break;
        default:
            break;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return PopoverTableViewCellHeight;
}

- (float)tableViewHeight {
    return PopoverTableViewCellHeight * ConnectDeviceCellNum;
}

@end
