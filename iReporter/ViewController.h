//
//  ViewController.h
//  draw2D
//
//  Created by 文杰 胡 on 12-10-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaintView.h"

@interface ViewController : UIViewController
{
    UIBarButtonItem * colorPalette;
    PaintView  *paintView;
}
- (IBAction)selectColorSlot7:(id)sender;
- (IBAction)selectColorSlot6:(id)sender;
- (IBAction)selectColorSlot5:(id)sender;
- (IBAction)selectColorSlot4:(id)sender;
- (IBAction)selectColorSlot3:(id)sender;
- (IBAction)selectColorSlot2:(id)sender;
- (IBAction)selectColorSlot1:(id)sender;
- (IBAction)selectColor0:(id)sender;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *colorSlot0;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *colorSlot1;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *colorSlot2;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *colorSlot3;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *colorSlot4;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *colorSlot5;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *colorSlot6;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *colorSlot7;
//- (void)drawView:(UIView*)view;

@end
