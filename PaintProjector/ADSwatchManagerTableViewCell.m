//
//  SwatchManagerTableViewCell.m
//  PaintProjector
//
//  Created by kobunketsu on 14-2-28.
//  Copyright (c) 2014年 WenjiHu. All rights reserved.
//

#import "ADSwatchManagerTableViewCell.h"

@implementation ADSwatchManagerTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}
//- (id)initWithCoder:(NSCoder *)aDecoder{
//    self = [super initWithCoder:aDecoder];
//    if (self) {
//        self.swatchCollectionView.contentSize = CGSizeMake(self.bounds.size.width, 10000);
//    }
//    return self;
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
