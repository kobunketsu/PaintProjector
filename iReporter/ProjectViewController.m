//
//  PaintProjectViewController.m
//  iReporter
//
//  Created by 胡 文杰 on 13-3-16.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "ProjectViewController.h"




@interface ProjectViewController ()

@end

@implementation ProjectViewController

@synthesize glkViewController = _glkViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _glkViewController = [[ProjectGLKViewController alloc]initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
        [self addChildViewController:_glkViewController];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark- 工具栏
//初始化 贴图 参数
- (IBAction)adjustEyeSliderSlide:(UISlider *)sender {
    [_glkViewController setEyeT:sender.value];
}

- (IBAction)farDistanceSliderSlide:(UISlider *)sender {
    [_glkViewController setFarDistance:sender.value * FarDistanceMax];
    self.farDistanceLabel.text = [NSString stringWithFormat:@"Far Distance %.1f", _glkViewController.farDistance];
//    NSLog(@"farDistance %.1f", _farDistance);

}

- (IBAction)heightSliderSlide:(UISlider *)sender {
    [_glkViewController setManHeight:sender.value];
    self.heightLabel.text = [NSString stringWithFormat:@"Man Height %.1f", _glkViewController.manHeight];
  
}

- (IBAction)showBackgroundButtonTapped:(UIButton *)sender {
}

- (IBAction)showGridButtonTapped:(UIButton *)sender {
    _glkViewController.showGrid = !_glkViewController.showGrid;
}

- (IBAction)exportButtonTapped:(UIButton *)sender {
    [self ExportToEmail];
}

- (IBAction)close:(UIButton *)sender {
    _glkViewController.state = UnProjecting;
}

#pragma mark- 手势
- (IBAction)handleTapPaintProjectViewGesture:(UITapGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateEnded ) {
        if(_glkViewController.state == Magnified){
            [_glkViewController unMagnifyGridView];
        }
        else if(_glkViewController.state == Projected){
            [_glkViewController magnifyGridView:[sender locationInView:self.view]];
        }
        
    }
}
#pragma mark- 导出 Export
- (void)ExportToEmail{
    MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
    picker.mailComposeDelegate = self;
    [picker setSubject:@"write your subject here"];
    
    UIImage* image = [_glkViewController snapshotToUIImage];
    
    //convert UIImage to NSData to add it as attachment
    NSData *imageData = UIImagePNGRepresentation(image);
    
    //this is how to attach any data in mail, remember mimeType will be different
    //for other data type attachment.
    
    [picker addAttachmentData:imageData mimeType:@"image/png" fileName:@"image.png"];
    
    //showing MFMailComposerView here
    [self presentModalViewController:picker animated:YES];
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    if(result == MFMailComposeResultCancelled)
        NSLog(@"Mail has cancelled");
    if(result == MFMailComposeResultSaved)
        NSLog(@"Mail has saved");
    
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidUnload {
    [self setProjectSlider:nil];
    [self setFarDistanceSlider:nil];
    [self setFarDistanceLabel:nil];
    [self setHeightSlider:nil];
    [self setHeightLabel:nil];
    
    [super viewDidUnload];
}


@end
