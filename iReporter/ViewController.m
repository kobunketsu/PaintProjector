//
//  ViewController.m
//  draw2D
//
//  Created by 文杰 胡 on 12-10-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "PaintView.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize colorSlot1;
@synthesize colorSlot2;
@synthesize colorSlot3;
@synthesize colorSlot4;
@synthesize colorSlot5;
@synthesize colorSlot6;
@synthesize colorSlot7;
@synthesize colorSlot0;

- (void)viewDidLoad
{
    [super viewDidLoad];
    paintView = [[PaintView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:paintView];
    [self.view sendSubviewToBack:paintView];
    
}

- (void)viewDidUnload
{
    [self setColorSlot0:nil];
    [self setColorSlot1:nil];
    [self setColorSlot2:nil];
    [self setColorSlot3:nil];
    [self setColorSlot4:nil];
    [self setColorSlot5:nil];
    [self setColorSlot6:nil];
    [self setColorSlot7:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (IBAction)selectColorSlot7:(id)sender {
    paintView.selectedColor = colorSlot7.tintColor;
}

- (IBAction)selectColorSlot6:(id)sender {
    paintView.selectedColor = colorSlot6.tintColor;
}

- (IBAction)selectColorSlot5:(id)sender {
    paintView.selectedColor = colorSlot5.tintColor;
}

- (IBAction)selectColorSlot4:(id)sender {
    paintView.selectedColor = colorSlot4.tintColor;
}

- (IBAction)selectColorSlot3:(id)sender {
    paintView.selectedColor = colorSlot3.tintColor;
}

- (IBAction)selectColorSlot2:(id)sender {
    paintView.selectedColor = colorSlot2.tintColor;    
}

- (IBAction)selectColorSlot1:(id)sender {
    paintView.selectedColor = colorSlot1.tintColor;    
}

- (IBAction)selectColor0:(id)sender {
    paintView.selectedColor = colorSlot0.tintColor;
}
@end
