//
//  AdjustImageViewController.m
//  iReporter
//
//  Created by 文杰 胡 on 13-2-3.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "AdjustImageViewController.h"

@interface AdjustImageViewController ()

@end

@implementation AdjustImageViewController

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
    _adjustedScale = 1;
    _adjustedTranslate = CGPointZero;
}

- (void)viewDidUnload
{
    [self setAdjustImageDoneButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (IBAction)adjustDoneButtonTapped:(UIButton *)sender {
    self.adjustImageDoneButton.hidden = true;
    CALayer* layer = [self.view layer];
    UIGraphicsBeginImageContext(self.view.bounds.size);
    [layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext(); 
    //crop image
    DebugLog(@"translate x:%.1f y:%.1f", _adjustedTranslate.x, _adjustedTranslate.y);
    CGRect cropRect = CGRectMake(_adjustedTranslate.x, _adjustedTranslate.y, self.view.frame.size.width / _adjustedScale, self.view.frame.size.height / _adjustedScale);
    self.adjustImageDoneButton.hidden = false;
    
    CGImageRef imageRef = CGImageCreateWithImageInRect(viewImage.CGImage, cropRect);
    [self.delegate adjustImageDone:[UIImage imageWithCGImage:imageRef]];
    CGImageRelease(imageRef);
    
    [self dismissViewControllerAnimated:true completion:^{[self.delegate adjustImageViewControllerDismissed];}];    
}
- (IBAction)handlePinchGRAdjustImageView:(id)sender {
    [HandleGestureRecognizer handleScale:sender];    
    _adjustedScale = [HandleGestureRecognizer newScale];
}

- (IBAction)handlePanGRAdjustImageView:(UIPanGestureRecognizer *)sender {
    [HandleGestureRecognizer handleMove:sender];        
    _adjustedTranslate = [HandleGestureRecognizer newTranslate];    
}
@end
