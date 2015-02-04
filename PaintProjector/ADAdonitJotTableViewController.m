//
//  ADAdonitJotTouchSetupTableViewController.m
//  PaintProjector
//
//  Created by 文杰 胡 on 2/3/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import "ADAdonitJotTableViewController.h"
#import "ADTutorialStatusView.h"
#import <JotTouchSDK/JotTouchSDK.h>
#import "ADDiscoveryDeviceButton.h"
#import "ADAdonitJotWritingStyleTableViewController.h"

@interface ADAdonitJotTableViewController ()

@end

@implementation ADAdonitJotTableViewController

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
    return 6;
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

#if AdonitSDKConnectTypeTapAvailable
            
            [self setCell:cell deviceConnectedBlock:^(BOOL connected) {
                if (connected) {
                    cell.textLabel.text = [JotStylusManager sharedInstance].stylusModelFriendlyName;
                }
                else{
                    cell.textLabel.text = NSLocalizedString(@"AdonitJotDisconnectedText", nil);
                    cell.detailTextLabel.text = NSLocalizedString(@"AdonitJotDisconnectedDetailText", nil);
                }
            }];
#else
            if ([JotStylusManager sharedInstance].connectionStatus == JotConnectionStatusConnected) {
                cell.textLabel.text = [JotStylusManager sharedInstance].stylusModelFriendlyName;
                cell.accessoryView = [[ADTutorialStatusView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
            }
            else{
                cell.textLabel.text = NSLocalizedString(@"AdonitJotDisconnectedText", nil);
                cell.detailTextLabel.text = NSLocalizedString(@"AdonitJotDisconnectedDetailText", nil);
                UIButton *discoveryDeviceButton = [[ADDiscoveryDeviceButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
                [discoveryDeviceButton addTarget:self.delegate action:@selector(willAdonitJotTouchButtonTouchDown:) forControlEvents:UIControlEventTouchDown];
                [discoveryDeviceButton addTarget:self.delegate action:@selector(willAdonitJotTouchButtonTouchUp:) forControlEvents:UIControlEventTouchUpInside];
                [discoveryDeviceButton addTarget:self.delegate action:@selector(willAdonitJotTouchButtonTouchUp:) forControlEvents:UIControlEventTouchUpOutside];
                [discoveryDeviceButton addTarget:self.delegate action:@selector(willAdonitJotTouchButtonTouchUp:) forControlEvents:UIControlEventTouchCancel];
                cell.accessoryView = discoveryDeviceButton;
            }
            
#endif
        }
            break;
        case 1:
        {
            cell.textLabel.text = NSLocalizedString(@"ButtonDown", nil);
            [self setCell:cell deviceConnectedBlock:^(BOOL connected) {
                if (connected) {
                    cell.detailTextLabel.text = [JotStylusManager sharedInstance].button1Shortcut.shortText;
                }
            }];
        }
            break;
        case 2:
        {
            cell.textLabel.text = NSLocalizedString(@"ButtonUp", nil);
            [self setCell:cell deviceConnectedBlock:^(BOOL connected) {
                if (connected) {
                    cell.detailTextLabel.text = [JotStylusManager sharedInstance].button2Shortcut.shortText;
                }
            }];
            
        }
            break;
        case 3:
            cell.textLabel.text = NSLocalizedString(@"Support", nil);
            break;
        case 4:
        {
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.textLabel.text = NSLocalizedString(@"BatteryLevel", nil);
            [self setCell:cell deviceConnectedBlock:^(BOOL connected) {
                if (connected) {
                    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d%%", [JotStylusManager sharedInstance].batteryLevel];
                }
            }];
        }
            break;
        case 5:
            cell.textLabel.text = NSLocalizedString(@"WritingStyle", nil);
            cell.detailTextLabel.text = [ADAdonitJotWritingStyleTableViewController writingStyleName: [JotStylusManager sharedInstance].writingStyle];
            break;
        default:
            break;
    }
    return cell;
}



- (void)setCell:(UITableViewCell*)cell deviceConnectedBlock:(void (^)(BOOL connected))block{
    if ([JotStylusManager sharedInstance].connectionStatus == JotConnectionStatusConnected) {
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

// Override to support conditional editing of the table view.
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//}


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
            [RemoteLog logAction:@"PS_didDeselectDeviceAdonitJotTouch" identifier:nil];
            [self.delegate didDeselectDeviceAdonitJotTouch];

            break;
        case 1:
            [RemoteLog logAction:@"PS_didSelectDeviceButtonIndex0" identifier:nil];
            [self.delegate didSelectDeviceButtonIndex:0];
            break;
        case 2:
            [RemoteLog logAction:@"PS_didSelectDeviceButtonIndex1" identifier:nil];
            [self.delegate didSelectDeviceButtonIndex:1];
            break;
        case 3:
            [RemoteLog logAction:@"PS_didSelectOpenSupportURL" identifier:nil];
            [self.delegate didSelectOpenSupportURL];
        case 5:
            [RemoteLog logAction:@"PS_didSelectDeviceWritingStylus" identifier:nil];
            [self.delegate didSelectDeviceWritingStylus];
            break;
        default:
            break;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return PopoverTableViewCellHeight;
}

//- (float)tableViewHeight {
//    
//    return PopoverTableViewCellHeight * [self tableView:self.tableView numberOfRowsInSection:0];
//}
@end
