//
//  SetupTableViewCell.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/16/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetupTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *propertyName;
@property (weak, nonatomic) IBOutlet UISlider *propertySlider;
@property (weak, nonatomic) IBOutlet UILabel *propertyValue;

@end
