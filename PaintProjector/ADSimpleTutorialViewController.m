//
//  ADSimpleTutorialViewController.m
//  PaintProjector
//
//  Created by 胡 文杰 on 9/8/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADSimpleTutorialViewController.h"
#import "ADSimpleTutorialManager.h"
#import "ADPaintCollectionViewController.h"
#import "ADTextSqueezePopAnimator.h"
#import "ADTutorialToPaintCollectionTransitionManager.h"
#import "ADAnamorphosisBasicViewController.h"
#import "ADTutorialStatusView.h"


@interface ADSimpleTutorialViewController ()
@property (retain, nonatomic) ADTextSplitter *tutorialListTitleTextSplitter;
@property (retain, nonatomic) ADTutorialToPaintCollectionTransitionManager *transitionManager;
@property (retain, nonatomic) NSArray *tutorialNames;
@end

@implementation ADSimpleTutorialViewController

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
    
    self.tutorialNames = @[@"TutorialAnaDrawBasic", @"TutorialAdvancedSetup", @"TutorialDrawReflection", @"TutorialDrawAnamorphosis"];
    
    //localize text
    self.anaDrawWelcomeLabel.text = NSLocalizedString(@"TutorialWelcome", nil);
    self.whatIsAnaDrawLabel.text = NSLocalizedString(@"PaintCollectionWelcome", nil);
    self.tutorialListTitleLabel.text = NSLocalizedString(@"TutorialListTitleLabel", nil);
    for (UILabel *label in self.tutorialButtonLabels) {
        NSInteger index = (int)fmodf((float)label.tag, 10);
        NSString *text = [NSString stringWithFormat:@"TutorialListButtonLabel%d", index];
        NSString *localizedText = NSLocalizedString(text, nil);
        label.text = localizedText;
    }
   
    [ADSimpleTutorialManager current].delegate = self;
    
    //transfer to splitter
    self.tutorialListTextSplitters = [[NSMutableArray alloc]init];
    
    self.tutorialListTitleTextSplitter = [[ADTextSplitter alloc]initFromUILabel:self.tutorialListTitleLabel perWord:false delegate:self];
    [self.tutorialListTextSplitters addObject:self.tutorialListTitleTextSplitter];
    
    for (UILabel *label in self.tutorialButtonLabels) {
        ADTextSplitter *textSplitter = [[ADTextSplitter alloc]initFromUILabel:label perWord:false delegate:self];
        [self.tutorialListTextSplitters addObject:textSplitter];
    }
    
    self.tutorialListView.hidden = true;
    
    self.transitionManager = [[ADTutorialToPaintCollectionTransitionManager alloc]init];
    
    //根据语言版本调整proEditionLabel的位置
    NSString * language = [[NSLocale preferredLanguages] objectAtIndex:0];
    if([language isEqualToString:@"zh-Hans"]){
        [self.proEditionLabel setFrameOriginX:600];
    }
}

//- (void)viewWillLayoutSubviews{
//    [super viewWillLayoutSubviews];
//
//}
- (void)viewWillAppear:(BOOL)animated{
//    [self preparePopTutorialTexts];
}

- (void)viewDidAppear:(BOOL)animated{
//    [self popTutorialTexts];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    [self setTutorialWelcomeView:nil];
    [self setAnaDrawWelcomeLabel:nil];
    [self setWhatIsAnaDrawLabel:nil];
    [self setBookBGImageView:nil];
    [self setSetup2ImageView:nil];
    [self setSetup3ImageView:nil];
    [self setSetupImageView:nil];
    [self setPickupImageView:nil];
    [self setViewDeviceSrcImageView:nil];
    [self setPutDeviceImageView:nil];
    [self setAuthorNameLabel:nil];
    [self setStartTutorialButton:nil];
    [self setMiscViews:nil];
    
    [self setTutorialListView:nil];
    [self setSetup3ImageTargetView:nil];
    [self setSetupImageTargetView:nil];
    [self setPickupImageTargetView:nil];
    [self setViewDeviceSrcImageTargetView:nil];
    [self setPutDeviceImageTargetView:nil];
    [self setTutorialButtons:nil];
    [self setTutorialButtonLabels:nil];
    [self setTutorialImageViews:nil];
    [self setTutorialStatusViews:nil];
    [self setTutorialAllViews:nil];
    [self setTutorialButtonGroups:nil];
    [self setTutorialNextButton:nil];
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
- (void)flushTutorialStatus{
    for (ADTutorialStatusView *view in self.tutorialStatusViews) {
        
        //已经checked过的不再更新显示动画
        if (!view.hidden) {
            continue;
        }
        //从hidden true-->false的动画
        switch (view.tag) {
            case 0:
                view.hidden = ![[NSUserDefaults standardUserDefaults] boolForKey:@"TutorialAnamorphosisBasic"];
                break;
            case 1:
                view.hidden = ![[NSUserDefaults standardUserDefaults] boolForKey:@"TutorialAnaDrawBasic"];
                break;
            case 2:
                view.hidden = ![[NSUserDefaults standardUserDefaults] boolForKey:@"TutorialAdvancedSetup"];
                break;
            case 3:
                view.hidden = ![[NSUserDefaults standardUserDefaults] boolForKey:@"TutorialDrawReflection"];
                break;
            case 4:
                view.hidden = ![[NSUserDefaults standardUserDefaults] boolForKey:@"TutorialDrawAnamorphosis"];
                break;
            case 5:
                view.hidden = [[NSUserDefaults standardUserDefaults] boolForKey:@"ReversePaint"];
            default:
                break;
        }
        
        view.alpha = 0;
        [view.layer setValue:[NSNumber numberWithFloat:0.2] forKey:@"transform.scale"];
        [UIView animateWithDuration:TutorialListTextFadeInDuration animations:^{
            view.alpha = 1;
            [view.layer setValue:[NSNumber numberWithFloat:1] forKey:@"transform.scale"];
        }];
    }

}
- (IBAction)startTutorialButtonTouchUp:(id)sender{
    [RemoteLog logAction:@"TU_startTutorialButtonTouchUp" identifier:sender];
    UIButton *button = (UIButton *)sender;
    button.userInteractionEnabled = false;
    
    [self listTutorials];
}

- (void)preparePopTutorialTexts{
    for (UIButton *button in self.tutorialButtons) {
        CALayer *layer = button.layer;
        [layer setValue:[NSNumber numberWithFloat:0] forKeyPath:@"transform.scale.x"];
        layer.anchorPoint = CGPointMake(0, 0.5);
        layer.position = CGPointMake(50, button.center.y);
        
        button.alpha = 0;
    }
    
    for (ADTextSplitter *textSplitter in self.tutorialListTextSplitters) {
        for (UILabel *label in textSplitter.characters) {
            [label.layer setValue:[NSNumber numberWithFloat:0] forKeyPath:@"transform.scale.x"];
        }
    }
}
- (void)popTutorialTexts{
    self.tutorialNextButton.alpha = 0;
    [UIView animateWithDuration:TutorialListButtonFadeInDuration animations:^{
        self.tutorialNextButton.alpha = 1;
        for (UIButton *button in self.tutorialButtons) {
            [button.layer setValue:[NSNumber numberWithFloat:1] forKeyPath:@"transform.scale.x"];
            button.alpha = 1;
        }
        
    }completion:^(BOOL finished) {
        [self flushTutorialStatus];
        [UIView animateWithDuration:TutorialListTextFadeInDuration animations:^{
            for (UIImageView *view in self.tutorialButtonBgImageViews) {
                view.alpha = 0.6;
            }
            
            for (ADTextSplitter *textSplitter in self.tutorialListTextSplitters) {
                for (UILabel *label in textSplitter.characters) {
                    [label.layer setValue:[NSNumber numberWithFloat:1] forKeyPath:@"transform.scale.x"];
                }
            }
        }];
    }];
}

- (void)listTutorials{
    //prepare for animation
    [self preparePopTutorialTexts];
    
    //list tutorial with animation
    [UIView animateWithDuration:TutorialListFadeInDuration delay:0 usingSpringWithDamping:TutorialListFadeInSpringDamp initialSpringVelocity:TutorialListFadeInSpringVelocity options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.setup3ImageView.frame = [self.tutorialWelcomeView convertRect:self.setup3ImageTargetView.bounds fromView:self.setup3ImageTargetView];
        self.setupImageView.frame = [self.tutorialWelcomeView convertRect:self.setupImageTargetView.bounds fromView:self.setupImageTargetView];
        self.pickupImageView.frame = [self.tutorialWelcomeView convertRect:self.pickupImageTargetView.bounds fromView:self.pickupImageTargetView];
        self.viewDeviceSrcImageView.frame = [self.tutorialWelcomeView convertRect:self.viewDeviceSrcImageTargetView.bounds fromView:self.viewDeviceSrcImageTargetView];
        self.putDeviceImageView.frame = [self.tutorialWelcomeView convertRect:self.putDeviceImageTargetView.bounds fromView:self.putDeviceImageTargetView];
        
        for (UIView *view in self.miscViews) {
            view.alpha = 0;
        }
        
    }completion:^(BOOL finished) {
        self.tutorialWelcomeView.hidden = true;
        self.tutorialListView.hidden = false;
        
        [self popTutorialTexts];
    }];
}


- (IBAction)tutorialDoneButtonTouchUp:(id)sender{
    [RemoteLog logAction:@"TU_tutorialDoneButtonTouchUp" identifier:sender];
    
    //检查用户是否有看完所有的教程
    BOOL isTutorialsAllRead = true;
    for (NSString *tutorialName in self.tutorialNames) {
        if(![[NSUserDefaults standardUserDefaults] boolForKey:tutorialName]){
            isTutorialsAllRead = false;
            break;
        }
    }
    if (isTutorialsAllRead) {
        [RemoteLog logAction:@"TU_isTutorialsAllRead" identifier:nil];
    }
    
    //结束tutorialVC
    if (self.delegate) {
        [self.delegate willTutorialViewControllerDissmiss];
    }
}

- (void)tutorialStartFromButton:(UIButton*)button{
    self.selectedButton = button;
    
    ADPaintCollectionViewController *vc =  [self.storyboard instantiateViewControllerWithIdentifier:@"PaintCollectionViewController"];
    vc.transitioningDelegate = self;
    [self presentViewController:vc animated:true completion:^{
        
    }];
}

- (IBAction)tutorialAnamorphosisBasicButtonTouchUp:(id)sender{
    [RemoteLog logAction:@"TU_tutorialAnamorphosisBasicButtonTouchUp" identifier:sender];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"TutorialAnamorphosisBasic"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    self.selectedButton = sender;
    ADAnamorphosisBasicViewController *vc =  [self.storyboard instantiateViewControllerWithIdentifier:@"AnamorphosisBasicViewController"];
    vc.delegate = self;
    vc.transitioningDelegate = self;
    [self presentViewController:vc animated:true completion:^{
        
    }];
}

- (IBAction)tutorialAnaDrawBasicButtonTouchUp:(id)sender{
    [RemoteLog logAction:@"TU_tutorialAnaDrawBasicButtonTouchUp" identifier:sender];
    
    [[ADSimpleTutorialManager current]activeTutorial:@"TutorialAnaDrawBasic"];
    
    [self tutorialStartFromButton:sender];
}
- (IBAction)tutorialAdvancedSetupButtonTouchUp:(id)sender{
    [RemoteLog logAction:@"TU_tutorialAdvancedSetupButtonTouchUp" identifier:sender];
    self.selectedButton = sender;
    
    [[ADSimpleTutorialManager current]activeTutorial:@"TutorialAdvancedSetup"];
    
    [self tutorialStartFromButton:sender];
}
- (IBAction)tutorialDrawReflectionButtonTouchUp:(id)sender{
    [RemoteLog logAction:@"TU_tutorialDrawReflectionButtonTouchUp" identifier:sender];
    self.selectedButton = sender;
    
    [[ADSimpleTutorialManager current]activeTutorial:@"TutorialDrawReflection"];
    
    [self tutorialStartFromButton:sender];
}
- (IBAction)tutorialDrawAnamorphosisButtonTouchUp:(id)sender{
    [RemoteLog logAction:@"TU_tutorialDrawAnamorphosisButtonTouchUp" identifier:sender];
    self.selectedButton = sender;
    
    //IAP dependent
//    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"ReversePaint"]) {
//        return;
//    }
    
    [[ADSimpleTutorialManager current]activeTutorial:@"TutorialDrawAnamorphosis"];
    
    [self tutorialStartFromButton:sender];
}

#pragma mark-
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.destinationViewController isKindOfClass:[ADAnamorphosisBasicViewController class]] ) {
        ADAnamorphosisBasicViewController * vc = segue.destinationViewController;
        vc.delegate = self;
//        vc.modalPresentationStyle = UIModalPresentationCustom;
        vc.transitioningDelegate = self;
    }
}

#pragma mark- ADAnamorphosisBasicViewControllerDelegate
- (void)willTutorialAnamorphosisBasicDone{
    [self dismissViewControllerAnimated:true completion:^{
        //如果看完过一篇tutorial，则认为完成教程了
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"TutorialWatched"];
        
        [self flushTutorialStatus];
    }];
}

#pragma mark- tutorialManagerDelegate
- (void)willTutorialManagerEndTutorial:(ADTutorial*)tutorial finished:(BOOL)finished{
    if (finished) {
        NSString *logStr = [NSString stringWithFormat:@"TU_finishTutorial:%@", tutorial.name];
        [RemoteLog logAction:logStr identifier:nil];
        
        //如果看完过一篇tutorial，则认为完成教程了
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"TutorialWatched"];
        
        for (NSString *tutorialName in self.tutorialNames) {
            if ([tutorial.name isEqualToString:tutorialName]) {
                [[NSUserDefaults standardUserDefaults] setBool:YES forKey:tutorialName];
                break;
            }
        }
        
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    ((ADSimpleTutorial*)tutorial).curViewController.transitioningDelegate = self;
    //退回到初始界面
    [self dismissViewControllerAnimated:true completion:^{
        [self flushTutorialStatus];
    }];
}

#pragma mark- ADTextSplitterDelegate
- (void)willAdjustTextView:(UITextView *)textView{
    CGRect frame = textView.frame;
    if (textView.tag == 1) {
        frame.origin.y -= 15;
    }
    else if ((int)floorf(((float)textView.tag / 10.0)) == 2){
        frame.origin.y += 22;
    }

    textView.frame = frame;
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
