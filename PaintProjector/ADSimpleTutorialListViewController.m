//
//  ADSimpleTutorialListViewController.m
//  PaintProjector
//
//  Created by 胡 文杰 on 9/9/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADSimpleTutorialListViewController.h"
#import "ADAnamorphosisBasicViewController.h"
#import "ADPaintCollectionViewController.h"
#import "ADSimpleTutorialManager.h"

@interface ADSimpleTutorialListViewController ()

@end

@implementation ADSimpleTutorialListViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.destinationViewController isKindOfClass:[ADPaintCollectionViewController class]] ) {

    }
    else if ([segue.destinationViewController isKindOfClass:[ADAnamorphosisBasicViewController class]] ) {
        ADAnamorphosisBasicViewController * controller = segue.destinationViewController;
        controller.delegate = self;
    }
}

- (IBAction)tutorialDoneButtonTouchUp:(id)sender{
    if (self.delegate) {
        [self.delegate willTutorialListDone];
    }
}

#pragma mark- ADAnamorphosisBasicViewControllerDelegate
- (void)willTutorialAnamorphosisBasicDone{
    [self dismissViewControllerAnimated:true completion:^{
        
    }];
}
@end
