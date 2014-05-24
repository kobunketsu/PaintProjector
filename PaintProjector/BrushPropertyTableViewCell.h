//
//  BrushPropertyTableViewCell.h
//  PaintProjector
//
//  Created by 胡 文杰 on 5/19/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrushPropertyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *propertyNameLabel;
@property (weak, nonatomic) IBOutlet UISlider *propertyValueSlider;
@property (weak, nonatomic) IBOutlet UISwitch *propertyValueSwitch;
- (IBAction)propertyValueSwitchValueChanged:(UISwitch *)sender;
- (IBAction)propertyValueSliderValueChanged:(UISlider *)sender;



@end
