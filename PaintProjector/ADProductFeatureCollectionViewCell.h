//
//  ProductFeatureCollectionViewCell.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/23/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADColorButton.h"

@interface ADProductFeatureCollectionViewCell : UICollectionViewCell
//@property (assign, nonatomic) id delegate;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet ADColorButton *colorButton1;
@property (weak, nonatomic) IBOutlet ADColorButton *colorButton2;
@property (weak, nonatomic) IBOutlet ADColorButton *colorButton3;
@property (weak, nonatomic) IBOutlet ADColorButton *colorButton4;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *brushButtons;
@property (weak, nonatomic) IBOutlet UILabel *tryLabel;
@property (weak, nonatomic) IBOutlet UIButton *getFreeButton;

@end

//@protocol ProductFeatureCollectionViewCellDelegate
//@end
