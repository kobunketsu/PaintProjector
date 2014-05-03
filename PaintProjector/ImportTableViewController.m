//
//  ImportViewController.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-4-20.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "ImportTableViewController.h"
#import "SharedTableViewCell.h"
#import "SharedTableView.h"

@interface ImportTableViewController ()

@end

@implementation ImportTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        SharedTableView *tv = [[SharedTableView alloc] initWithFrame:CGRectMake(0, 0, 20, 1024)
                                                       style:UITableViewStylePlain];
        
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
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
//    SharedTableViewCell *cell = (SharedTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil)
//    {
//        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SharedTableViewCell" owner:self options:nil];
//        cell = [nib objectAtIndex:0];
//    }

    
    // Configure the cell...
    switch(indexPath.row) { // assuming there is only one section
        case 0:
            cell.textLabel.text = @"Photo";
            cell.imageView.image = [UIImage imageNamed:@"PhotoLibrary.png"];
            break;
        case 1:
            cell.textLabel.text = @"Camera";
            cell.imageView.image = [UIImage imageNamed:@"camera_48.png"];
            break;
//        case 2:
//            cell.textLabel.text = @"Dropbox";
//            cell.imageView.image = [UIImage imageNamed:@"dropbox_Logo_48.png"];
//            break;
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
    switch(indexPath.row) { // assuming there is only one section
        case 0:
            [self.delegate didSelectImportPhoto];
            break;
        case 1:
            [self.delegate didSelectImportCamera];
            break;
//        case 2:
//            //TODO: import 图片有问题
//            [self.delegate didSelectImportDropbox];
//            break;
        default:
            break;
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 66;
}

- (float)tableViewHeight {
    return 66 * [self tableView:self.tableView numberOfRowsInSection:0];
}


@end
