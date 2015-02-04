//
//  ADAdonitJotWritingStyleTableViewController.m
//  PaintProjector
//
//  Created by 文杰 胡 on 2/4/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import "ADAdonitJotWritingStyleTableViewController.h"
@interface ADAdonitJotWritingStyleTableViewController ()

@end

@implementation ADAdonitJotWritingStyleTableViewController
+ (NSString*)writingStyleName:(JotWritingStyle)writingStyle{
    NSString *name = nil;
    switch (writingStyle) {
        case JotWritingStyleRightHorizontal:
            name = NSLocalizedString(@"WritingStyleRH", nil);
            break;
        case JotWritingStyleRightAverage:
            name = NSLocalizedString(@"WritingStyleRA", nil);
            break;
        case JotWritingStyleRightVertical:
            name = NSLocalizedString(@"WritingStyleRV", nil);
            break;
        case JotWritingStyleLeftHorizontal:
            name = NSLocalizedString(@"WritingStyleLH", nil);
            break;
        case JotWritingStyleLeftAverage:
            name = NSLocalizedString(@"WritingStyleLA", nil);
            break;
        case JotWritingStyleLeftVertical:
            name = NSLocalizedString(@"WritingStyleLV", nil);
            break;
        default:
            break;
    }
    return name;
    
}


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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [ADAdonitJotWritingStyleTableViewController writingStyleName:(JotWritingStyle)indexPath.row];
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
    [RemoteLog logAction:@"PS_connectDeviceDidSelectWritingStyle" identifier:nil];
    [JotStylusManager sharedInstance].writingStyle = (JotWritingStyle)indexPath.row;
    [self.delegate didSelectConnectDeviceWritingStyle];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return PopoverTableViewCellHeight;
}
@end
