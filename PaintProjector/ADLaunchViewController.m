//
//  ADLaunchViewController.m
//  PaintProjector
//
//  Created by 胡 文杰 on 9/9/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADLaunchViewController.h"
#import "ADSimpleTutorialViewController.h"
#import "ADPaintCollectionViewController.h"
#import "ADSimpleTutorialManager.h"
#import "AppDelegate.h"

@interface ADLaunchViewController ()

@end

@implementation ADLaunchViewController

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
    self.transitionManager = [[ADLaunchToPaintCollectionTransitionManager alloc]init];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [self addBackgroundView];
}
- (void)viewDidAppear:(BOOL)animated{
    
    if([ADSimpleTutorialManager current].isActive){
        ADSimpleTutorialViewController *vc =  [self.storyboard instantiateViewControllerWithIdentifier:@"SimpleTutorialViewController"];
        vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        vc.delegate = self;
        [self presentViewController:vc animated:true completion:^{
            
        }];
    }
    else{
        ADPaintCollectionViewController *vc =  [self.storyboard instantiateViewControllerWithIdentifier:@"PaintCollectionViewController"];
//        vc.transitioningDelegate = self;
        vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        vc.delegate = self;
        [self presentViewController:vc animated:true completion:^{
            
        }];
    }
}

- (void)viewDidDisappear:(BOOL)animated{
    [self destroyBackgroundView];
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
//运行中加载占用内存的大背景图片(如果放在nib中，presentViewController后还留在内存里)
- (void)addBackgroundView{
    ADRootCanvasBackgroundView *backgroundView = [[ADRootCanvasBackgroundView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:backgroundView];
}
//运行中卸载占用内存的大背景图片
- (void)destroyBackgroundView{
    ADRootCanvasBackgroundView *backgroundView = self.view.subviews[0];
    [backgroundView removeFromSuperview];

}

#pragma mark- ADSimpleTutorialViewControllerDelegate
- (void)willTutorialViewControllerDissmiss{
    AppDelegate *appDelegate = (AppDelegate *)([UIApplication sharedApplication].delegate);
    [appDelegate destoryTutorialManager];
    
    [self dismissViewControllerAnimated:true completion:^{
        //结束教程自动进入paint collection
    }];
}

//- (void)willTutorialStart{
//    [self dismissViewControllerAnimated:true completion:^{
        //结束教程进入paint collection
//    }];
//}
#pragma mark- ADPaintCollectionViewControllerDelegate
- (void)willTransitionToTutorialVC{
    [self dismissViewControllerAnimated:false completion:^{
        //default to tutorial
        ADSimpleTutorialViewController *vc =  [self.storyboard instantiateViewControllerWithIdentifier:@"SimpleTutorialViewController"];
        vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        vc.delegate = self;
        [self presentViewController:vc animated:true completion:^{
            
        }];
    }];
}

#pragma mark- UIViewControllerTransitioningDelegate
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    self.transitionManager.isPresenting = YES;
    return self.transitionManager;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    self.transitionManager.isPresenting = NO;
    return self.transitionManager;
}
@end
