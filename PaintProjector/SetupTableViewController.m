//
//  ShareTableViewController.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "SetupTableViewController.h"
#import "SetupTableViewCell.h"
#import "UnitConverter.h"

@interface SetupTableViewController ()
@property (retain, nonatomic) Animation *resetAnimation;
@end

@implementation SetupTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        [self customInit];
    }
    return self;
}

//- (id)initWithCoder:(NSCoder *)aDecoder{
//    self = [super initWithCoder:aDecoder];
//    if (self) {
//
//    }
//    return self;
//}

- (void)customInit{
    UITableView *tv = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 20, 1024)
                                                   style:UITableViewStylePlain];
    
    // assuming that your controller adopts the UITableViewDelegate and
    // UITableViewDataSource protocols, add the following 2 lines:
    
    tv.delegate = self;
    tv.dataSource = self;
    
    self.tableView = tv;
    
    self.view = self.tableView;
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    UIButton *footerView = [UIButton buttonWithType:UIButtonTypeSystem];
    footerView.frame = CGRectMake(0, 0, 320, 40);
    [footerView addTarget:self action:@selector(resetInputParams:) forControlEvents:UIControlEventTouchUpInside];
    [footerView setTitle:@"Fit" forState:UIControlStateNormal];
    footerView.titleLabel.font = [UIFont systemFontOfSize:20];
    
    self.tableView.tableFooterView = footerView;
    
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
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    SetupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[SetupTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    USUnit unit;
    // Configure the cell...
    switch(indexPath.row) { // assuming there is only one section
        case 0:
            cell.propertyName.text = @"Cylinder Diameter";
            unit = [UnitConverter usUnitFromMeter:self.userInputParams.cylinderDiameter];
            cell.propertySlider.tag = 0;
            cell.propertySlider.minimumValue = 0.038;
            cell.propertySlider.maximumValue = 0.38;
            cell.propertySlider.value = self.userInputParams.cylinderDiameter;
            break;
        case 1:
            cell.propertyName.text = @"Cylinder Height";
            unit = [UnitConverter usUnitFromMeter:self.userInputParams.cylinderHeight];
            cell.propertySlider.tag = 1;
            cell.propertySlider.minimumValue = 0.068;
            cell.propertySlider.maximumValue = 0.68;
            cell.propertySlider.value = self.userInputParams.cylinderHeight;
            break;
        case 2:
            cell.propertyName.text = @"Image Width";
            unit = [UnitConverter usUnitFromMeter:self.userInputParams.imageWidth];
            cell.propertySlider.tag = 2;
            cell.propertySlider.minimumValue = 0.037;
            cell.propertySlider.maximumValue = 0.37;
            cell.propertySlider.value = self.userInputParams.imageWidth;
            break;
        case 3:
            cell.propertyName.text = @"Image Center Height";
            unit = [UnitConverter usUnitFromMeter:self.userInputParams.imageCenterOnSurfHeight];
            cell.propertySlider.tag = 3;
            cell.propertySlider.minimumValue = 0.035;
            cell.propertySlider.maximumValue = 0.35;
            cell.propertySlider.value = self.userInputParams.imageCenterOnSurfHeight;
            break;
        case 4:
            cell.propertyName.text = @"Eye Horizontal Distance";
            unit = [UnitConverter usUnitFromMeter:self.userInputParams.eyeHonrizontalDistance];
            cell.propertySlider.tag = 4;
            cell.propertySlider.minimumValue = 0.35;
            cell.propertySlider.maximumValue = 3.5;
            cell.propertySlider.value = self.userInputParams.eyeHonrizontalDistance;
            break;
        case 5:
            cell.propertyName.text = @"Eye Vertical Height";
            unit = [UnitConverter usUnitFromMeter:self.userInputParams.eyeVerticalHeight];
            cell.propertySlider.tag = 5;
            cell.propertySlider.minimumValue = 0.4;
            cell.propertySlider.maximumValue = 4;
            cell.propertySlider.value = self.userInputParams.eyeVerticalHeight;
            break;
        case 6:
            cell.propertyName.text = @"Unit Zoom";
            unit = [UnitConverter usUnitFromMeter: DeviceWidth / self.userInputParams.unitZoom];
            cell.propertySlider.tag = 6;
            cell.propertySlider.minimumValue = 0.01;
            cell.propertySlider.maximumValue = 1;
            cell.propertySlider.value = self.userInputParams.unitZoom;
            break;
        default:
            break;
    }

//    if (indexPath.row != 5) {
        cell.propertyValue.text = [NSString stringWithFormat:@"feet %d  inch %.1f", (NSUInteger)unit.feet, unit.inch];
//    }
//    else{
//        cell.propertyValue.text = [NSString stringWithFormat:@"zoom %.2f", self.userInputParams.unitZoom];
//    }

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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
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
//            [self.delegate didSelectPostToFacebook];
            break;
        case 1:
//            [self.delegate didSelectPostToTwitter];
            break;
        case 2:
//            [self.delegate didSelectPostToSinaWeibo];
            break;
        default:
            break;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 66;
}

- (IBAction)sliderValueChanged:(UISlider *)sender {
    USUnit unit;
    switch (sender.tag) {
        case 0:
            self.userInputParams.cylinderDiameter = sender.value;
            unit = [UnitConverter usUnitFromMeter:self.userInputParams.cylinderDiameter];
            break;
        case 1:
            self.userInputParams.cylinderHeight = sender.value;
            unit = [UnitConverter usUnitFromMeter:self.userInputParams.cylinderHeight];
            break;
        case 2:
            self.userInputParams.imageWidth = sender.value;
            unit = [UnitConverter usUnitFromMeter:self.userInputParams.imageWidth];
            break;
        case 3:
            self.userInputParams.imageCenterOnSurfHeight = sender.value;
            unit = [UnitConverter usUnitFromMeter:self.userInputParams.imageCenterOnSurfHeight];
            break;
        case 4:
            self.userInputParams.eyeHonrizontalDistance = sender.value;
            unit = [UnitConverter usUnitFromMeter:self.userInputParams.eyeHonrizontalDistance];
            break;
        case 5:
            self.userInputParams.eyeVerticalHeight = sender.value;
            unit = [UnitConverter usUnitFromMeter:self.userInputParams.eyeVerticalHeight];
            break;
        case 6:
            self.userInputParams.unitZoom = sender.value;
            unit = [UnitConverter usUnitFromMeter:DeviceWidth / self.userInputParams.unitZoom];
            break;
        default:
            break;
    }
    
    SetupTableViewCell *cell = (SetupTableViewCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:sender.tag inSection:0]];
//    if (sender.tag != 5) {
        cell.propertyValue.text = [NSString stringWithFormat:@"feet %d  inch %.1f", (NSUInteger)unit.feet, unit.inch];
//    }
//    else{
//        cell.propertyValue.text = [NSString stringWithFormat:@"zoom %.2f", self.userInputParams.unitZoom];
//    }

    
    [self.delegate willCylinderProjectParamsChange];
}

//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//    UIButton *footerView = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 320, 66)];
//    footerView.backgroundColor = [UIColor redColor];
//    footerView.titleLabel.text = @"Fit";

//    UIButton *resetButton = [[UIButton alloc]initWithFrame:footerView.bounds];
//    resetButton.titleLabel.text = @"Fit";
//    [footerView addSubview:resetButton];
    
//    return footerView;
//}

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    return 66;
//}

- (float)tableViewHeight {
//    CGFloat footerHeight = [self tableView:self.tableView heightForFooterInSection:0];
    return 66 * [self tableView:self.tableView numberOfRowsInSection:0] + 40;
}

-(void)resetInputParams:(id)sender{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:[NSNumber numberWithFloat:0.038] forKey:@"userInputParams.cylinderDiameter"];
    [dic setObject:[NSNumber numberWithFloat:0.068] forKey:@"userInputParams.cylinderHeight"];
    [dic setObject:[NSNumber numberWithFloat:0.037] forKey:@"userInputParams.imageWidth"];
    [dic setObject:[NSNumber numberWithFloat:0.035] forKey:@"userInputParams.imageCenterOnSurfHeight"];
    [dic setObject:[NSNumber numberWithFloat:0.35] forKey:@"userInputParams.eyeHonrizontalDistance"];
    [dic setObject:[NSNumber numberWithFloat:0.4] forKey:@"userInputParams.eyeVerticalHeight"];
    [dic setObject:[NSNumber numberWithFloat:1] forKey:@"userInputParams.unitZoom"];
    
    AnimationClip *animClip = [[AnimationClip alloc]init];
    animClip.name = @"userInputParamsResetAnimClip";
    NSEnumerator *enumeratorKey = [dic keyEnumerator];
    for (NSObject *key in enumeratorKey) {
        NSNumber *num = [dic objectForKey:key];
        
        TPPropertyAnimation *propAnim = [TPPropertyAnimation propertyAnimationWithKeyPath:(NSString*)key];
        propAnim.fromValue = [self valueForKeyPath:(NSString*)key];
        propAnim.toValue = num;
        propAnim.duration = 0.5;
        propAnim.target = self;
        propAnim.timing = TPPropertyAnimationTimingEaseOut;
        [animClip addPropertyAnimation:propAnim];
    }
    
    TPPropertyAnimation* propAnim = animClip.propertyAnimations.firstObject;
    propAnim.delegate = self;
    
    self.resetAnimation = [Animation animationWithAnimClip:animClip];
    self.resetAnimation.target = self;
    [self.resetAnimation play];
}
- (void)willBeginPropertyAnimation:(TPPropertyAnimation*)propertyAnimation{
    
}
- (void)propertyAnimationDidFinish:(TPPropertyAnimation*)propertyAnimation{
    [self.tableView reloadData];
    [self.delegate willCylinderProjectParamsReset];
}
@end
