//
//  ADWacomIntuosCreativeStylusTableViewController.m
//  PaintProjector
//
//  Created by 文杰 胡 on 2/3/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import "ADWacomStylusTableViewController.h"
#import "ADTutorialStatusView.h"
#import "ADDiscoveryDeviceButton.h"
#import "ADDeviceManager.h"
@interface ADWacomStylusTableViewController ()

@end

@implementation ADWacomStylusTableViewController

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

- (void)viewDidDisappear:(BOOL)animated{
	[[WacomManager getManager] stopDeviceDiscovery];
    [super viewDidDisappear:animated];
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
            cell.textLabel.text = NSLocalizedString(@"WacomStylusDisconnectedText", nil);
            [self setCell:cell deviceConnectedBlock:^(BOOL connected) {
                if (connected) {
                    cell.textLabel.text = [WacomManager getManager].getSelectedDevice.getName;
                    cell.accessoryView = [[ADTutorialStatusView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
                    cell.accessoryView.opaque = false;
                }
                else{
                    
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
        case 4:
        {
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            if ([ADDeviceManager isDeviceConnected]) {
                cell.textLabel.text = NSLocalizedString(@"BatteryLevel", nil);
                cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu%%", [[WacomManager getManager] getSelectedDevice].batteryLevel];
            }
            else{
                cell.textLabel.text = NSLocalizedString(@"Status", nil);
                cell.detailTextLabel.text = NSLocalizedString(@"DeviceScanning", nil);
            }
        }
            break;
        case 5:
            cell.textLabel.text = NSLocalizedString(@"WritingStyle", nil);
            cell.detailTextLabel.text = [ADDeviceManager writingStyleName: [ADDeviceManager sharedInstance].writingStyle];
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
    if ([ADDeviceManager isDeviceConnected]) {
        cell.userInteractionEnabled = true;
        if (cell.accessoryView) {
            if ([cell.accessoryView isKindOfClass:[UIActivityIndicatorView class]]) {
                UIActivityIndicatorView *activityView = (UIActivityIndicatorView *)cell.accessoryView;
                [activityView stopAnimating];
            }
            cell.accessoryView = nil;
        }
        if(block){
            block(YES);
        }
    }
    else{
        cell.userInteractionEnabled = false;
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
            [RemoteLog logAction:@"PS_didDeselectWacomStylus" identifier:nil];
            [self.delegate didDeselectWacomStylus];
            
            break;
        case 1:
            [RemoteLog logAction:@"PS_didSelectWacomStylusButtonIndex0" identifier:nil];
            [self.delegate didSelectWacomStylusButtonIndex:0];
            break;
        case 2:
            [RemoteLog logAction:@"PS_didSelectWacomStylusButtonIndex1" identifier:nil];
            [self.delegate didSelectWacomStylusButtonIndex:1];
            break;
        case 3:
            [RemoteLog logAction:@"PS_didSelectOpenWacomStylusSupportURL" identifier:nil];
            [self.delegate didSelectOpenWacomStylusSupportURL];
        case 5:
            [RemoteLog logAction:@"PS_didSelectWacomStylusWritingStylus" identifier:nil];
            [self.delegate didSelectWacomStylusWritingStylus];
            break;
        default:
            break;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return PopoverTableViewCellHeight;
}
@end
