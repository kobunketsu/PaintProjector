//
//  ADHelpCollectionViewCell.m
//  PaintProjector
//
//  Created by 胡 文杰 on 9/10/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADHelpCollectionViewCell.h"

@implementation ADHelpCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (void)dealloc{
    [self setLabel:nil];
}
- (IBAction)switchEnableValueChanged:(id)sender {
    UISwitch *switcher = sender;
    if (switcher.tag == 1) {
        BOOL useEyedrop = switcher.on;
        [[NSUserDefaults standardUserDefaults] setBool:useEyedrop forKey:@"UseLongPressEyedrop"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}
@end
