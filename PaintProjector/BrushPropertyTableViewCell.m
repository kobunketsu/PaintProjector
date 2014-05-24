//
//  BrushPropertyTableViewCell.m
//  PaintProjector
//
//  Created by 胡 文杰 on 5/19/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "BrushPropertyTableViewCell.h"

@implementation BrushPropertyTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)propertyValueSwitchValueChanged:(UISwitch *)sender {
}

- (IBAction)propertyValueSliderValueChanged:(UISlider *)sender {
}

@end
