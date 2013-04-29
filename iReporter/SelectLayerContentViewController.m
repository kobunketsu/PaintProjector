//
//  SelectLayerContentViewController.m
//  iReporter
//
//  Created by 文杰 胡 on 12-12-2.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "SelectLayerContentViewController.h"
#import "ImageView.h"
@interface SelectLayerContentViewController ()

@end

@implementation SelectLayerContentViewController
@synthesize delegate;
@synthesize imageScrollView;
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
    
    NSDictionary* imageInfo0 = [NSDictionary dictionaryWithObjectsAndKeys:@"check.jpg", @"imageName", @"pic0", @"caption", @"scene", @"bgType", nil];
    
    NSDictionary* imageInfo1 = [NSDictionary dictionaryWithObjectsAndKeys:@"ConcreteFloors0100_i4S.jpg", @"imageName", @"pic1", @"caption", @"image", @"bgType", nil];
    
    NSDictionary* imageInfo2 = [NSDictionary dictionaryWithObjectsAndKeys:@"ConcreteFloors0048_7_i4S.jpg", @"imageName", @"pic2", @"caption", @"image", @"bgType",nil];
    
    NSDictionary* imageInfo3 = [NSDictionary dictionaryWithObjectsAndKeys:@"FloorHerringbone0043_1_i4S.jpg", @"imageName", @"pic3", @"caption", @"image", @"bgType", nil];    
    
    NSDictionary* imageInfo4 = [NSDictionary dictionaryWithObjectsAndKeys:@"blackboard.jpg", @"imageName", @"pic4", @"caption", @"image", @"bgType", nil];        
    
    NSArray* array = [NSArray arrayWithObjects:imageInfo0, imageInfo1, imageInfo2, imageInfo3, imageInfo4,nil];    
    [self showStream:array];
}

- (void)viewDidUnload
{
    [self setImageScrollView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (IBAction)testButtonTapped:(UIButton *)sender {
    [self dismissViewControllerAnimated:true completion:^{NSLog(@"Dismiss SelectLayerContent");}];    
}

-(void)showStream:(NSArray*)stream {
    // 1 remove old photos
    for (UIView* view in imageScrollView.subviews) {
        [view removeFromSuperview];
    }
    // 2 add new photo views
    for (int i=0;i<[stream count];i++) {
        NSDictionary* image = [stream objectAtIndex:i];
        ImageView* imageView = [[ImageView alloc] initWithIndex:i andData:image];
        imageView.delegate = self;
        [imageScrollView addSubview: imageView];
    }
    // 3 update scroll list's height
    int listHeight = ([stream count]/4 + 1)*(kThumbSide+kPadding);
    [imageScrollView setContentSize:CGSizeMake(640, listHeight)];
    [imageScrollView scrollRectToVisible:CGRectMake(0, 0, 10, 10) animated:YES];
}

-(void)didSelectImage:(id)sender{
    ImageView* imageView = (ImageView*)sender;
    if(imageView.tag==0){
        _curBackgroundImageType = BG_Normal;

        _imageViewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"AdjustImageViewController"];        
        _imageViewController.delegate = self;
        UIView* view = [_imageViewController.view.subviews objectAtIndex:0];
        view.backgroundColor = [UIColor colorWithPatternImage:imageView.image]; 
        [self presentViewController:_imageViewController animated:false completion:^(void){}];        
    }
    if(imageView.tag==1){
        _curBackgroundImageType = BG_Scene;

        _sceneViewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"AdjustSceneViewController"];        
        _sceneViewController.delegate = self;
        [self presentViewController:_sceneViewController animated:false completion:^(void){}];
    }    
}
#pragma mark AdjustSceneDelegate
- (void) adjustSceneDone:(UIImage*)image{
    [delegate selectLayerContent:image];
}
- (void) adjustSceneViewControllerDismissed{
    [self dismissViewControllerAnimated:true completion:nil];        
}
- (void) adjustImageDone:(UIImage*)image{
    [delegate selectLayerContent:image];
}
- (void) adjustImageViewControllerDismissed{
    [self dismissViewControllerAnimated:true completion:nil];        
}
@end
