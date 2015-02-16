//
//  ADHelpCollectionViewCell.h
//  PaintProjector
//
//  Created by 胡 文杰 on 9/10/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADHelpCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UISwitch *switchEnable;
@property (weak, nonatomic) IBOutlet UILabel *label;
//@property (assign, nonatomic) id delegate;
- (IBAction)switchEnableValueChanged:(id)sender;
@end

//@protocol ADHelpCollectionViewCellDelegate
//- (void)willTurnEyedropper:(BOOL)on;
//@end
