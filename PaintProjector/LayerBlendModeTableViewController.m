//
//  LayerBlendModeTableViewController.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-4-16.
//  Copyright (c) 2013年 Hu Wenjie. All rights reserved.
//

#import "LayerBlendModeTableViewController.h"
#import "PaintLayer.h"
#import "LayerBlendModeTableView.h"
#import "LayerBlendModeTableViewCell.h"
#import "LayerOpacitySlider.h"

#define LayerBlendModeCellHeight 39
#define LayerBlendModeCount 16

@interface LayerBlendModeTableViewController ()

@end

@implementation LayerBlendModeTableViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
//        // Custom initialization
//        LayerBlendModeTableView *tv = [[LayerBlendModeTableView alloc] initWithFrame:CGRectMake(0, 0, 20, 1024)
//                                                       style:UITableViewStylePlain];
//        
//        // assuming that your controller adopts the UITableViewDelegate and
//        // UITableViewDataSource protocols, add the following 2 lines:
//        tv.controller = self;
//        tv.delegate = self;
//        tv.dataSource = self;
//        tv.backgroundColor = [UIColor clearColor];
//        
//        self.tableView = tv;
//        self.tableView.bounces = false;
//
//        [self.view addSubview:self.tableView];
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
    
    LayerBlendModeTableView* layerBlendModeTableView = (LayerBlendModeTableView*)self.tableView;
    layerBlendModeTableView.controller = self;
    
    //初始化透明度
    LayerOpacitySlider* layerOpacitySlider = [[LayerOpacitySlider alloc]initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, UISliderDefaultHeight)];
    layerOpacitySlider.value = [self.delegate willGetLayerOpacity];
    [layerOpacitySlider addTarget:self action:@selector(layerOpacitySliderSlide:) forControlEvents:UIControlEventValueChanged];
    self.tableView.tableHeaderView = layerOpacitySlider;
}

- (void)viewWillAppear:(BOOL)animated{
    //初始化混合
    LayerBlendMode blendMode = [self.delegate willGetLayerBlendMode];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(int)blendMode inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:true scrollPosition:UITableViewScrollPositionNone];
}

- (void)layerOpacitySliderSlide:(LayerOpacitySlider *)sender {
    [self.delegate willSetLayerOpacity:sender.value];
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
    return LayerBlendModeCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    LayerBlendModeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[LayerBlendModeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.tag = indexPath.row;
    }
    
    // configure cell...
    cell.isAccessibilityElement = true;
    switch(indexPath.row) { // assuming there is only one section
        case 0:
            cell.textLabel.text = cell.accessibilityLabel = NSLocalizedString(@"Normal", nil);
            break;
        case 1:
            cell.textLabel.text = cell.accessibilityLabel = NSLocalizedString(@"Multiply", nil);
            break;
        case 2:
            cell.textLabel.text = cell.accessibilityLabel = NSLocalizedString(@"Screen", nil);
            break;
        case 3:
            cell.textLabel.text = cell.accessibilityLabel = NSLocalizedString(@"Overlay", nil);
            break;
        case 4:
            cell.textLabel.text = cell.accessibilityLabel = NSLocalizedString(@"Darken", nil);
            break;
        case 5:
            cell.textLabel.text = cell.accessibilityLabel = NSLocalizedString(@"Lighten", nil);
            break;
        case 6:
            cell.textLabel.text = cell.accessibilityLabel = NSLocalizedString(@"ColorDodge", nil);
            break;
        case 7:
            cell.textLabel.text = cell.accessibilityLabel = NSLocalizedString(@"ColorBurn", nil);
            break;
        case 8:
            cell.textLabel.text = cell.accessibilityLabel = NSLocalizedString(@"SoftLight", nil);
            break;
        case 9:
            cell.textLabel.text = cell.accessibilityLabel = NSLocalizedString(@"HardLight", nil);
            break;
        case 10:
            cell.textLabel.text = cell.accessibilityLabel = NSLocalizedString(@"Difference", nil);
            break;
        case 11:
            cell.textLabel.text = cell.accessibilityLabel = NSLocalizedString(@"Exclusion", nil);
            break;
        case 12:
            cell.textLabel.text = cell.accessibilityLabel = NSLocalizedString(@"Hue", nil);
            break;
        case 13:
            cell.textLabel.text = cell.accessibilityLabel = NSLocalizedString(@"Saturation", nil);
            break;
        case 14:
            cell.textLabel.text = cell.accessibilityLabel = NSLocalizedString(@"Color", nil);
            break;
        case 15:
            cell.textLabel.text = cell.accessibilityLabel = NSLocalizedString(@"Luminosity", nil);
            break;
        default:
            break;
    }

    
//    cell.backgroundColor = [UIColor redColor];
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


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
//- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    DebugLog(@"willSelectRowAtIndexPath %d", indexPath.row);
//}
//
//- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
//    DebugLog(@"willDeselectRowAtIndexPath %d", indexPath.row);
//}

//- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
//    DebugLog(@"didDeselectRowAtIndexPath %d", indexPath.row);
//}
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    return NO;
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

    DebugLog(@"didSelectRowAtIndexPath at row %d", indexPath.row);    
//    [self.delegate willSelectLayerBlendMode:(LayerBlendMode)indexPath.row];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return LayerBlendModeCellHeight;
}

- (float)tableViewHeight {
    return LayerBlendModeCellHeight * LayerBlendModeCount + self.tableView.tableHeaderView.bounds.size.height;

}

- (void)willSelectRowAtIndexPath:(NSIndexPath*)indexPath{
    DebugLog(@"willSelectLayerBlendMode at row %d", indexPath.row);    
    [self.delegate willSetLayerBlendMode:(LayerBlendMode)indexPath.row];
}
@end
