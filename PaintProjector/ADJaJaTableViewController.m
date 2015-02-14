//
//  ADJaJaTableViewController.m
//  PaintProjector
//
//  Created by 文杰 胡 on 2/14/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import "ADJaJaTableViewController.h"
#import "ADTutorialStatusView.h"
#import "ADDeviceManager.h"
@interface ADJaJaTableViewController ()

@end

@implementation ADJaJaTableViewController

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
        if(indexPath.row == 0){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        }
        else{
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        }
    }
    
    // Configure the cell...
    switch(indexPath.row) { // assuming there is only one section
        case 0:
        {
            [self setCell:cell deviceConnectedBlock:^(BOOL connected) {
                if (connected) {
                    cell.textLabel.text = NSLocalizedString(@"JaJaHex3", nil);
                    cell.detailTextLabel.text = nil;
                }
                else{
                    cell.textLabel.text = NSLocalizedString(@"JaJaConnectDisconnectedText", nil);
                    cell.detailTextLabel.text = NSLocalizedString(@"JaJaConnectDisconnectedDetailText", nil);
                }
            }];
        }
            break;
        case 1:
        {
            cell.textLabel.text = NSLocalizedString(@"ButtonDown", nil);
            [self setCell:cell deviceConnectedBlock:^(BOOL connected) {
                if (connected) {
                    NSString *shortText = [ADDeviceManager sharedInstance].button1Shortcut.descriptiveText ;
                    cell.detailTextLabel.text = shortText;
                }
                else{
                    cell.detailTextLabel.text = nil;
                }
            }];
        }
            break;
        case 2:
        {
            cell.textLabel.text = NSLocalizedString(@"ButtonUp", nil);
            [self setCell:cell deviceConnectedBlock:^(BOOL connected) {
                if (connected) {
                    NSString *shortText = [ADDeviceManager sharedInstance].button2Shortcut.descriptiveText ;
                    cell.detailTextLabel.text = shortText;
                }
            }];
            
        }
            break;
        case 3:
            cell.textLabel.text = NSLocalizedString(@"Support", nil);
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

- (void)setCell:(UITableViewCell*)cell deviceConnectedBlock:(void (^)(BOOL connected))block{
    if ([ADDeviceManager sharedInstance].isJaJaConnected) {
        if (cell.accessoryView) {
            UIActivityIndicatorView *activityView = (UIActivityIndicatorView *)cell.accessoryView;
            [activityView stopAnimating];
            [activityView removeFromSuperview];
        }
        if(block){
            block(YES);
        }
    }
    else{
        UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        activityView.hidesWhenStopped = true;
        [activityView startAnimating];
        cell.accessoryView = activityView;
        if(block){
            block(NO);
        }
    }
}

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
            [RemoteLog logAction:@"PS_didDeselectJaJa" identifier:nil];
            [self.delegate didDeselectJaJa];
            
            break;
        case 1:
            [RemoteLog logAction:@"PS_didSelectJaJaButtonIndex0" identifier:nil];
            [self.delegate didSelectJaJaButtonIndex:0];
            break;
        case 2:
            [RemoteLog logAction:@"PS_didSelectJaJaButtonIndex1" identifier:nil];
            [self.delegate didSelectJaJaButtonIndex:1];
            break;
        case 3:
            [RemoteLog logAction:@"PS_didSelectOpenJaJaSupportURL" identifier:nil];
            [self.delegate didSelectOpenJaJaSupportURL];
        default:
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return PopoverTableViewCellHeight;
}
@end
