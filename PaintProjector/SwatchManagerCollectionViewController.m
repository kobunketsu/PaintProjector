//
//  SwatchManagerCollectionViewController.m
//  PaintProjector
//
//  Created by 胡 文杰 on 3/2/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "SwatchManagerCollectionViewController.h"
#import "SwatchCollectionViewCell.h"


@interface SwatchManagerCollectionViewController ()
@property(retain, nonatomic) NSArray *swatches;
@end

@implementation SwatchManagerCollectionViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSURL *url = [self.swatches objectAtIndex:collectionView.tag];
    NSArray *colorDatas = [NSArray arrayWithContentsOfURL:url];
    return colorDatas.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"swatchCollectionViewCell";
    SwatchCollectionViewCell *cell = (SwatchCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    // Configure the cell...
    NSURL *url = [self.swatches objectAtIndex:collectionView.tag];
    NSArray *colorDatas = [NSArray arrayWithContentsOfURL:url];
    if (indexPath.row >= colorDatas.count) {
        cell.colorButton.color = [UIColor clearColor];
    }
    else{
        NSString *colorData = [colorDatas objectAtIndex:indexPath.row];
        NSArray *rgb = [colorData componentsSeparatedByString:@" "];
        CGFloat r = [rgb[0] integerValue] / 255.0;
        CGFloat g = [rgb[1] integerValue] / 255.0;
        CGFloat b = [rgb[2] integerValue] / 255.0;
        cell.colorButton.color = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    }
    
    return cell;
}
@end
