//
//  SwatchManagerViewController.m
//  PaintProjector
//
//  Created by 胡 文杰 on 3/6/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADSwatchManagerViewController.h"
#import "ADSwatchManagerTableViewCell.h"
#import "ADSwatchCollectionViewCell.h"

@interface ADSwatchManagerViewController ()
@property(retain, nonatomic) NSArray *swatchURLs;
//记录本地化名字作为key的颜色组
@property(retain, nonatomic) NSMutableDictionary *localNameKeySwatchURLs;
@property (retain,nonatomic) NSMutableArray *filteredSwatchURLs;

@end

@implementation ADSwatchManagerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.swatchURLs = [[NSBundle mainBundle] URLsForResourcesWithExtension:@"swatch" subdirectory:@"Swatches"];
    
    self.localNameKeySwatchURLs = [[NSMutableDictionary alloc]initWithCapacity:self.swatchURLs.count];
    for (NSURL *url in self.swatchURLs) {
        NSString *swatchName = [url.absoluteString.lastPathComponent stringByDeletingPathExtension];
        NSString *localSwatchName = NSLocalizedString(swatchName, nil);
        [self.localNameKeySwatchURLs setObject:url forKey:localSwatchName];
    }
    
    self.filteredSwatchURLs = [NSMutableArray arrayWithCapacity:[self.swatchURLs count]];
}
- (void)viewDidAppear:(BOOL)animated{
    [Flurry logEvent:@"SWATCH_inSwatch" withParameters:nil timed:true];
}

- (void)viewDidDisappear:(BOOL)animated{
    [Flurry endTimedEvent:@"SWATCH_inSwatch" withParameters:nil];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Action
- (IBAction)backButtonTouchUp:(UIButton *)sender {
    [RemoteLog logAction:@"SWATCH_backButtonTouchUp" identifier:sender];
    [self.delegate willSetSwatchFile:nil];
}

- (IBAction)swatchChartButtonTouchUp:(ADSwatchChartButton *)sender {
    NSInteger index = sender.tag;
    BOOL filtered = sender.filtered;
    NSURL *url = nil;
    // 检查现在应该显示普通列表还是过滤后的列表
    if (filtered) {
        url = self.filteredSwatchURLs[index];
    }
    else{
        url = self.swatchURLs[index];
    }
    
    NSString *string = [NSString stringWithFormat:@"SWATCH_swatchChartButtonTouchUp url:%@", [[url.absoluteString lastPathComponent] stringByDeletingPathExtension]];
    [RemoteLog logAction:string identifier:sender];
    
    //交互动画
    [UIView animateWithDuration:0.1 animations:^{
        sender.layer.transform = CATransform3DIdentity;
    }completion:^(BOOL finished) {
        [self.delegate willSetSwatchFile:url];
    }];

}

- (IBAction)swatchChartButtonTouchDown:(UIButton *)sender {
    [RemoteLog logAction:@"SWATCH_swatchChartButtonTouchDown" identifier:sender];
    //交互动画
    [UIView animateWithDuration:0.1 animations:^{
        sender.layer.transform = CATransform3DMakeScale(1.2, 1.2, 1.2);
    }completion:nil];
}

- (IBAction)swatchChartButtonTouchCancel:(UIButton *)sender {
    [RemoteLog logAction:@"SWATCH_swatchChartButtonTouchCancel" identifier:sender];
    //交互动画
    [UIView animateWithDuration:0.1 animations:^{
        sender.layer.transform = CATransform3DIdentity;
    }completion:nil];
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
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"swatchManagerTableViewCell";
    ADSwatchManagerTableViewCell *cell = (ADSwatchManagerTableViewCell*)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    // 检查现在应该显示普通列表还是过滤后的列表
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        cell.swatchCollectionView.tag = 1;
    }
    else {
        cell.swatchCollectionView.tag = 0;
    }
    
    return cell;
}

#pragma mark - Table view delegate
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.tableView.bounds.size.height;
}

#pragma mark- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSInteger count = 0;
    if (collectionView.tag == 1){
        count = self.filteredSwatchURLs.count;
    }
    else if(collectionView.tag == 0){
        count = self.swatchURLs.count;
    }
    
    return count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"swatchCollectionViewCell";
    ADSwatchCollectionViewCell *cell = (ADSwatchCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSArray *urls = nil;
    if (collectionView.tag == 1) {
        urls = self.filteredSwatchURLs;
    }
    else if (collectionView.tag == 0){
        urls = self.swatchURLs;
    }
    
    NSURL *url = [urls objectAtIndex:indexPath.row];
    NSArray *colorDatas = [NSArray arrayWithContentsOfURL:url];
    
    //对colorDatas按照百分比进行排序
//    NSArray *sortedColors = [[[colorDatas sortedArrayWithOptions:NSSortStable usingComparator:^NSComparisonResult(id obj1, id obj2) {
//        CGFloat percent1 = [[[(NSString*)obj1 componentsSeparatedByString:@"%"]lastObject]floatValue];
//        CGFloat percent2 = [[[(NSString*)obj2 componentsSeparatedByString:@"%"]lastObject]floatValue];
//        NSNumber *p1 = [NSNumber numberWithFloat:percent1];
//        NSNumber *p2 = [NSNumber numberWithFloat:percent2];
//        return [p1 compare:p2];
//    }] reverseObjectEnumerator]allObjects];
//    
//    cell.swatchChartButton.swatchColors = sortedColors;
    
    cell.swatchChartButton.swatchColors = colorDatas;
    
    //tag正负号代表是否是查询过滤表格
    cell.swatchChartButton.tag = indexPath.row;
    cell.swatchChartButton.filtered = collectionView.tag == 1;
    
    NSString *fileName = [url.pathComponents lastObject];
    NSString *swatchName = [fileName stringByDeletingPathExtension];
    cell.swatchNameLabel.text = NSLocalizedString(swatchName, nil);
    cell.swatchNameLabel.tag = indexPath.row;
    
    return cell;
}

#pragma mark- UICollectionViewDelegate
//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    NSURL *url = nil;
//    // 检查现在应该显示普通列表还是过滤后的列表
//    if (collectionView.tag == 1) {
//        url = [self.filteredSwatches objectAtIndex:indexPath.row];
//    }
//    else if(collectionView.tag == 0) {
//        url = [self.swatches objectAtIndex:indexPath.row];
//    }
//    
//    [self.delegate willSetSwatchFile:url];
//}

#pragma mark Content Filtering
-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    // 根据搜索栏的内容和范围更新过滤后的数组。
    // 先将过滤后的数组清空。
    [self.filteredSwatchURLs removeAllObjects];
    // 用NSPredicate来过滤数组。
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@",searchText];

    NSArray *localNames = [self.localNameKeySwatchURLs allKeys];
    NSArray *filteredLocalNames = [localNames filteredArrayUsingPredicate:predicate];
    for (NSString *key in filteredLocalNames) {
        [self.filteredSwatchURLs addObject:[self.localNameKeySwatchURLs valueForKey:key]];
    }
}

#pragma mark - UISearchDisplayController Delegate Methods
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    // 当用户改变搜索字符串时，让列表的数据来源重新加载数据
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    // 返回YES，让table view重新加载。
    return YES;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    // 当用户改变搜索范围时，让列表的数据来源重新加载数据
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    // 返回YES，让table view重新加载。
    return YES;
}

@end
