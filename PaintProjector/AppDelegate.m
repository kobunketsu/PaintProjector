//
//  AppDelegate.m
//  PaintProjector
//
//  Created by 胡 文杰 on 09/02/2012.
//  Copyright (c) 2012 Hu Wenjie. All rights reserved.
//

#import "AppDelegate.h"

#import <DBChooser/DBChooser.h>
#import "ADSimpleIAPManager.h"
#import "BBXBeeblex.h"
#import "iRate.h"
#import "Questionnaire.h"
#import "ADSimpleTutorialViewController.h"

#define TutorialGrid 64

@implementation AppDelegate

@synthesize window = _window;

+ (void)initialize
{
//#if DEBUG
    //configure iRate
    [iRate sharedInstance].appStoreID = 885877961;
    [iRate sharedInstance].daysUntilPrompt = 5;
    [iRate sharedInstance].usesUntilPrompt = 15;
    [iRate sharedInstance].eventsUntilPrompt = 3;
//    [iRate sharedInstance].previewMode = true;
//#endif
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    DebugLogSystem(@"applicationDidFinishLaunchingWithOptions");
    
    [BBXBeeblex initializeWithAPIKey:@"OWEwODU3ZWVjNzU3NmNkMjg2MDFiODg1ODE3NThjNTk2MTliYTE3ZDM5YTA2MDcwODI4YWRjN2FiMzgwNzAwMDc1YmI1ZDFkMTE0Njk2YzBhMDNkYzhhNTY1M2NiY2I1NGFjM2U2MDMyMzYxYTcyYjU5ZTRmNzBjMjU3ZWYzNWUsLS0tLS1CRUdJTiBQVUJMSUMgS0VZLS0tLS0KTUlJQklqQU5CZ2txaGtpRzl3MEJBUUVGQUFPQ0FROEFNSUlCQ2dLQ0FRRUE1cW5mN0hka29UZXRVeEYwOHM2Qwp2ME95NEtOd3F4bGVvcW5wd3pUa1orUXVQTWhkU0xXQ1NSUHhOUjNRYjlzeVEvVHhkS1hWTUt2VjJicldWZE42ClhnNUxQT2NjZ0l6ZWFQQWp2UXdjcGc2KzZmOFlKTFpEUGtudzAxeGhZZkRCajJqNzY3NFNRVmNVenB1QUZqYVEKeEV2Zm5DUkxIZUh5SnNWTm1YZGp1clZJOW9xTERVcnk5S3hEdkVXMENyKzBqK0NaYzlkMytxOXBBRXdVRUxlaApSY3g2cTdjMmxtL0c1NU9LTkw0NmVqcTgrK3VTTEJSL0pkWUF5MFR2MnY4bkdHQURhb2tjUG9XMUVVdjk1Z0gyCnBqTC8vSzNDY1dpZUo0U2d0NVRnZFBPNmhhS3NaTk5lZDVxNmZ6Vm9LWlB6WVdPcnk4dGluclNGSFZtckt1TTMKeXdJREFRQUIKLS0tLS1FTkQgUFVCTElDIEtFWS0tLS0t"];
    
    [Flurry setCrashReportingEnabled:NO];
    [Flurry startSession:@"M8DMDS5GW352GZQ4TN3B"];
    
    [TestFlight takeOff:@"d99fa9e3-3923-4f55-acea-0a1e077b133f"];
    
#if TESTFLIGHT
    [self initQuestionnaire];
#endif
    
    [Crashlytics startWithAPIKey:@"c9088b1cc6c9d24318c5ed35da6d53c9457d0365"];
    
//    DBAccountManager* accountMgr =
//    [[DBAccountManager alloc] initWithAppKey:@"08yvvqxgb9k6jbl" secret:@"8sdk2e91z8nv2vy"];
//    [DBAccountManager setSharedManager:accountMgr];
//
#if DEBUG
    //设置用户参数
    [self copyCollectionFromMainBundleToUserDocument];
    [[NSUserDefaults standardUserDefaults] setInteger:10 forKey:@"LayerQuantityLimitation"];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"ReversePaint"];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"ExpandedBrushPackageAvailable"];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"ExpandedSwatchManagerAvailable"];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"AnamorphosisSetup"];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"TutorialWatched"];
    
#else
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"everLaunched"]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"everLaunched"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
    }
    else{
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"firstLaunch"];
    }
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"]) {
        //第一次启动时，将Collection内的contents拷贝入Documents,以后首页直接读取用户document目录下的文件结构
        [self copyCollectionFromMainBundleToUserDocument];

        //非IAP功能
        [[NSUserDefaults standardUserDefaults] setInteger:10 forKey:@"LayerQuantityLimitation"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"AnamorphosisSetup"];
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"TutorialWatched"];
        
        //IAP功能
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"ReversePaint"];
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"ExpandedBrushPackageAvailable"];
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"ExpandedSwatchManagerAvailable"];
    }
    

#endif
    
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"TutorialWatched"]) {
        //      這裡判斷是否第一次,初始化教程
        [self initTutorialManager];
    }
    
    //初始化IAP商店
    [[ADSimpleIAPManager sharedInstance] requestProductsWithCompletionHandler:nil];

    return YES;
}

//- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url
//  sourceApplication:(NSString *)source annotation:(id)annotation
//{
//    
//    if ([[DBChooser defaultChooser] handleOpenURL:url]) {
//        // This was a Chooser response and handleOpenURL automatically ran the
//        // completion block
//        return YES;
//    }
//    
//    return NO;
//}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
    DebugLogSystem(@"applicationWillResignActive");
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
    
    //postNotificationName:UIApplicationDidEnterBackgroundNotification will called automatically
//    [[NSNotificationCenter defaultCenter]
//     postNotificationName:UIApplicationDidEnterBackgroundNotification
//     object:self
//     userInfo:nil];
    
    DebugLogSystem(@"applicationDidEnterBackground");
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
    DebugLogSystem(@"applicationWillEnterForeground");
    
    //恢复所有动画的播放
    //恢复教程动画的播放
    if (![[ADSimpleTutorialManager current] isActive]) {
        return;
    }
    for (ADTutorialStep *step in [ADSimpleTutorialManager current].curTutorial.steps) {
        for (ADTutorialIndicatorView *view in step.indicatorViews) {
            [view setNeedsLayout];
        }
    }
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
//    NSLog(@"applicationDidBecomeActive");
    DebugLogSystem(@"applicationDidBecomeActive");
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
    
    DebugLogSystem(@"applicationWillTerminate");
}

- (void)copyCollectionFromMainBundleToUserDocument{
    DebugLogFuncStart(@"copyCollectionFromMainBundleToUserDocument");
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *documentImagesFolderPath = [documentsDirectory stringByAppendingPathComponent:@"Folder_0"];

    if (![fileManager fileExistsAtPath:documentImagesFolderPath]){
        //不存在，则拷贝app bundle内Collection内的文件到Documents/Folder_0中
        [fileManager createDirectoryAtPath:documentImagesFolderPath withIntermediateDirectories:true attributes:nil error:&error];
        if (error) {
            DebugLogError(@"Error fileManager createDirectoryAtPath: %@", [error localizedDescription]);
        }
    }

    NSString *resourceDBFolderPath = [[[NSBundle mainBundle] resourcePath]
                                      stringByAppendingPathComponent:@"Collection"];
    NSArray *sourceFiles = [fileManager contentsOfDirectoryAtPath:resourceDBFolderPath error:NULL];

    for (NSString *fileName in sourceFiles) {
        NSString *srcPath = [resourceDBFolderPath stringByAppendingPathComponent:fileName];
        NSString *destPath = [documentImagesFolderPath stringByAppendingPathComponent:fileName];
        if ([fileManager fileExistsAtPath:destPath isDirectory:NO]) {
            //removing file
            if (![fileManager removeItemAtPath:destPath error:&error])
            {
                DebugLogError(@"could not remove old files from user documents/Folder_0. Error:%@",[error description]);
            }
        }
        BOOL success = [[NSFileManager defaultManager] copyItemAtPath:srcPath toPath:destPath error:&error];
        if (success == YES)
        {
            DebugLogWriteSuccess(@"file %@ copied from app bundle to user documents/Folder_0.", fileName);
        }
        else
        {
            DebugLogError(@"Error file %@ copied from app bundle to user documents/Folder_0 :%@", fileName, [error description]);
        }
    }

//        error = nil;
//        [fileManager copyItemAtPath:resourceDBFolderPath toPath:documentImagesFolderPath
//                              error:&error];
//        if (error) {
//            DebugLogError(@"Error fileManager copyItemAtPath:toPath: %@", [error localizedDescription]);
//        }
}

#pragma mark- Tutorial
//初始化教程的四个步骤，具体步骤的排版信息在切换到具体步骤并加载对应页面后使用页面排版代理进行排版
- (void)initTutorialAnaDrawBasic{
    ADSimpleTutorial *tutorial = (ADSimpleTutorial*)[[ADSimpleTutorialManager current] addTutorial:@"TutorialAnaDrawBasic" ofClass:@"ADSimpleTutorial"];
    
    //选中图片
    [tutorial addActionStep:@"PaintCollectionPickImage" description:NSLocalizedString(@"PaintCollectionPickImage", nil) bounds:CGRectMake(0, 0, TutorialGrid*4, TutorialGrid*2) arrowDirection:UIPopoverArrowDirectionUp];
    
    //向后翻页
    [tutorial addActionStep:@"CylinderProjectNextImage" description:NSLocalizedString(@"CylinderProjectNextImage", nil) bounds:CGRectMake(0, 0, TutorialGrid*5, TutorialGrid*2) arrowDirection:UIPopoverArrowDirectionUp];
    
    //放置设备
    [tutorial addActionStep:@"CylinderProjectPutDevice" description:NSLocalizedString(@"CylinderProjectPutDevice", nil) bounds:CGRectMake(0, 0, TutorialGrid*5, TutorialGrid*2) arrowDirection:UIPopoverArrowDirectionDown];
    
    ADTutorialStep *step = [tutorial addActionStep:@"CylinderProjectViewDevice" description:NSLocalizedString(@"CylinderProjectViewDeviceDone", nil) bounds:CGRectMake(0, 0, TutorialGrid*6, TutorialGrid*3) arrowDirection:UIPopoverArrowDirectionDown];

    ADTutorialIndicatorView *inidcatorView = [[ADTutorialIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 384, 368)];
    inidcatorView.animated = false;
    inidcatorView.arrowDirection = UIPopoverArrowDirectionDown;
    [inidcatorView initWithTutorial:tutorial description:NSLocalizedString(@"CylinderProjectViewDevice", nil) bgImage:[UIImage imageNamed:@"tutorial_viewDevice.png"]];
    [step addIndicatorView:inidcatorView];
    
    //完成
    [tutorial addPageStep:@"CylinderProjectTutorialDone" description:nil pageBounds:CGRectMake(0, 0, TutorialNextButtonWidth, TutorialNextButtonHeight) pageImage:nil withNextButton:YES nextButtonName:NSLocalizedString(@"CylinderProjectTutorialDone", nil)];
}

- (void)initTutorialAdvancedSetup{
    ADSimpleTutorial *tutorial = (ADSimpleTutorial*)[[ADSimpleTutorialManager current] addTutorial:@"TutorialAdvancedSetup" ofClass:@"ADSimpleTutorial"];
    
    //选中图片
    [tutorial addActionStep:@"PaintCollectionPickImage" description:NSLocalizedString(@"PaintCollectionPickImage", nil) bounds:CGRectMake(0, 0, TutorialGrid*4, TutorialGrid*2) arrowDirection:UIPopoverArrowDirectionUp];
    
    //高级设置
    [tutorial addActionStep:@"CylinderProjectSetup" description:NSLocalizedString(@"CylinderProjectSetup", nil) bounds:CGRectMake(0, 0, TutorialGrid*5, TutorialGrid*2) arrowDirection:UIPopoverArrowDirectionDown];
    
    //点击圆柱体，进入快捷参数选择
    [tutorial addActionStep:@"CylinderProjectSetupScene" description:NSLocalizedString(@"CylinderProjectSetupScene", nil) bounds:CGRectMake(0, 0, TutorialGrid*5, TutorialGrid*2) arrowDirection:UIPopoverArrowDirectionUp];
    
    //点击圆柱体，进入快捷参数选择
    [tutorial addActionStep:@"CylinderProjectSetupSceneDone" description:NSLocalizedString(@"CylinderProjectSetupSceneDone", nil) bounds:CGRectMake(0, 0, TutorialGrid*5, TutorialGrid*2) arrowDirection:UIPopoverArrowDirectionUp];

    //调整圆柱体半径
    [tutorial addActionStep:@"CylinderProjectSetupCylinderDiameter" description:NSLocalizedString(@"CylinderProjectSetupCylinderDiameter", nil) bounds:CGRectMake(0, 0, TutorialGrid*6, TutorialGrid*2) arrowDirection:UIPopoverArrowDirectionUp];
    [tutorial addActionStep:@"CylinderProjectSetupCylinderDiameterValue" description:NSLocalizedString(@"CylinderProjectSetupValue", nil) bounds:CGRectMake(0, 0, TutorialGrid*6, TutorialGrid*2) arrowDirection:UIPopoverArrowDirectionUp];
    
    //调整图片宽度
    [tutorial addActionStep:@"CylinderProjectSetupImageWidth" description:NSLocalizedString(@"CylinderProjectSetupImageWidth", nil) bounds:CGRectMake(0, 0, TutorialGrid*6, TutorialGrid*2) arrowDirection:UIPopoverArrowDirectionUp];
    //    [tutorial addActionStep:@"CylinderProjectSetupImageWidthValue" description:NSLocalizedString(@"CylinderProjectSetupValue", nil) bounds:CGRectMake(0, 0, 256, 128) arrowDirection:UIPopoverArrowDirectionUp];
    [tutorial addActionStep:@"CylinderProjectSetupImageWidthValue" description:nil bounds:CGRectZero arrowDirection:UIPopoverArrowDirectionUp];
    
    //调整圆柱体高度
    [tutorial addActionStep:@"CylinderProjectSetupCylinderHeight" description:NSLocalizedString(@"CylinderProjectSetupCylinderHeight", nil) bounds:CGRectMake(0, 0, TutorialGrid*6, TutorialGrid*2) arrowDirection:UIPopoverArrowDirectionUp];
    //    [tutorial addActionStep:@"CylinderProjectSetupCylinderHeightValue" description:NSLocalizedString(@"CylinderProjectSetupValue", nil) bounds:CGRectMake(0, 0, 256, 128) arrowDirection:UIPopoverArrowDirectionUp];
    [tutorial addActionStep:@"CylinderProjectSetupCylinderHeightValue" description:nil bounds:CGRectZero arrowDirection:UIPopoverArrowDirectionUp];
    
    //调整图片高度
    [tutorial addActionStep:@"CylinderProjectSetupImageCenter" description:NSLocalizedString(@"CylinderProjectSetupImageCenter", nil) bounds:CGRectMake(0, 0, TutorialGrid*6, TutorialGrid*2) arrowDirection:UIPopoverArrowDirectionUp];
    //    [tutorial addActionStep:@"CylinderProjectSetupImageCenterValue" description:NSLocalizedString(@"CylinderProjectSetupValue", nil) bounds:CGRectMake(0, 0, 256, 128) arrowDirection:UIPopoverArrowDirectionUp];
    [tutorial addActionStep:@"CylinderProjectSetupImageCenterValue" description:nil bounds:CGRectZero arrowDirection:UIPopoverArrowDirectionUp];
    
    //调整缩放比例修正显示
    [tutorial addActionStep:@"CylinderProjectSetupZoomFixDisplay" description:NSLocalizedString(@"CylinderProjectSetupZoomFixDisplay", nil) bounds:CGRectMake(0, 0, TutorialGrid*6, TutorialGrid*2) arrowDirection:UIPopoverArrowDirectionUp];
    //    [tutorial addActionStep:@"CylinderProjectSetupZoomFixDisplayValue" description:NSLocalizedString(@"CylinderProjectSetupValue", nil) bounds:CGRectMake(0, 0, 256, 128) arrowDirection:UIPopoverArrowDirectionUp];
    [tutorial addActionStep:@"CylinderProjectSetupZoomFixDisplayValue" description:nil bounds:CGRectZero arrowDirection:UIPopoverArrowDirectionUp];
    
    //调整到顶视图
    [tutorial addActionStep:@"CylinderProjectTopViewForZoom" description:NSLocalizedString(@"CylinderProjectTopViewForZoom", nil) bounds:CGRectMake(0, 0, TutorialGrid*6, TutorialGrid*2) arrowDirection:UIPopoverArrowDirectionDown];
    
    //调整缩放比例
    [tutorial addActionStep:@"CylinderProjectSetupZoom" description:NSLocalizedString(@"CylinderProjectSetupZoom", nil) bounds:CGRectMake(0, 0, TutorialGrid*6, TutorialGrid*4) arrowDirection:UIPopoverArrowDirectionUp];
    //    [tutorial addActionStep:@"CylinderProjectSetupZoomValue" description:NSLocalizedString(@"CylinderProjectSetupValue", nil) bounds:CGRectMake(0, 0, 256, 128) arrowDirection:UIPopoverArrowDirectionUp];
    [tutorial addActionStep:@"CylinderProjectSetupZoomValue" description:nil bounds:CGRectZero arrowDirection:UIPopoverArrowDirectionUp];
    
    //调整到视角视图
    [tutorial addActionStep:@"CylinderProjectSideViewForEye" description:NSLocalizedString(@"CylinderProjectSideViewForEye", nil) bounds:CGRectMake(0, 0, TutorialGrid*6, TutorialGrid*2) arrowDirection:UIPopoverArrowDirectionDown];
    
    //    //调整视角水平距离
    //    [tutorial addActionStep:@"CylinderProjectSetupEyeDistance" description:NSLocalizedString(@"CylinderProjectSetupEyeDistance", nil) bounds:CGRectMake(0, 0, 256, 128) arrowDirection:UIPopoverArrowDirectionUp];
    //    [tutorial addActionStep:@"CylinderProjectSetupEyeDistanceValue" description:NSLocalizedString(@"CylinderProjectSetupValue", nil) bounds:CGRectMake(0, 0, 256, 128) arrowDirection:UIPopoverArrowDirectionUp];
    //
    //    //调整视角垂直距离
    //    [tutorial addActionStep:@"CylinderProjectSetupEyeHeight" description:NSLocalizedString(@"CylinderProjectSetupEyeHeight", nil) bounds:CGRectMake(0, 0, 256, 128) arrowDirection:UIPopoverArrowDirectionUp];
    //    [tutorial addActionStep:@"CylinderProjectSetupEyeHeightValue" description:NSLocalizedString(@"CylinderProjectSetupValue", nil) bounds:CGRectMake(0, 0, 256, 128) arrowDirection:UIPopoverArrowDirectionUp];
    
    //调整视角水平距离
    [tutorial addActionStep:@"CylinderProjectSetupEyeZoom" description:NSLocalizedString(@"CylinderProjectSetupEyeZoom", nil) bounds:CGRectMake(0, 0, TutorialGrid*6, TutorialGrid*2) arrowDirection:UIPopoverArrowDirectionUp];
    //    [tutorial addActionStep:@"CylinderProjectSetupEyeZoomValue" description:NSLocalizedString(@"CylinderProjectSetupValue", nil) bounds:CGRectMake(0, 0, 256, 128) arrowDirection:UIPopoverArrowDirectionUp];
    [tutorial addActionStep:@"CylinderProjectSetupEyeZoomValue" description:nil bounds:CGRectZero arrowDirection:UIPopoverArrowDirectionUp];
    
    //关闭参数设置
    [tutorial addActionStep:@"CylinderProjectCloseSetup" description:NSLocalizedString(@"CylinderProjectCloseSetup", nil) bounds:CGRectMake(0, 0, TutorialGrid*6, TutorialGrid*3) arrowDirection:UIPopoverArrowDirectionDown];

    //完成
    [tutorial addPageStep:@"CylinderProjectTutorialDone" description:nil pageBounds:CGRectMake(0, 0, TutorialNextButtonWidth, TutorialNextButtonHeight) pageImage:nil withNextButton:YES nextButtonName:NSLocalizedString(@"CylinderProjectTutorialDone", nil)];
}


- (void)initTutorialDrawReflection{
    ADSimpleTutorial *tutorial = (ADSimpleTutorial*)[[ADSimpleTutorialManager current] addTutorial:@"TutorialDrawReflection" ofClass:@"ADSimpleTutorial"];
    
    //选中图片
    [tutorial addActionStep:@"PaintCollectionPickImage" description:NSLocalizedString(@"PaintCollectionPickImage", nil) bounds:CGRectMake(0, 0, TutorialGrid*4, TutorialGrid*2) arrowDirection:UIPopoverArrowDirectionUp];
    
    //开始绘制图片
    [tutorial addActionStep:@"CylinderProjectPaint" description:NSLocalizedString(@"CylinderProjectPaint", nil) bounds:CGRectMake(0, 0, TutorialGrid*6, TutorialGrid*2) arrowDirection:UIPopoverArrowDirectionDown];
    
    //查看手势
    [tutorial addActionStep:@"PaintScreenHelpTips" description:NSLocalizedString(@"PaintScreenHelpTips", nil) bounds:CGRectMake(0, 0, TutorialGrid*4, TutorialGrid*2) arrowDirection:UIPopoverArrowDirectionUp];
    
    //完成教程
    [tutorial addPageStep:@"PaintScreenTutorialDone" description:nil pageBounds:CGRectMake(0, 0, TutorialNextButtonWidth, TutorialNextButtonHeight) pageImage:nil withNextButton:YES nextButtonName:NSLocalizedString(@"PaintScreenTutorialDone", nil)];
    
    //完成教程
//    [self addHelpStepWithTutorial:tutorial];
}

- (void)initTutorialDrawAnamorphosis{
    ADSimpleTutorial *tutorial = (ADSimpleTutorial*)[[ADSimpleTutorialManager current] addTutorial:@"TutorialDrawAnamorphosis" ofClass:@"ADSimpleTutorial"];
    
    //选中图片
    [tutorial addActionStep:@"PaintCollectionPickImage" description:NSLocalizedString(@"PaintCollectionPickImage", nil) bounds:CGRectMake(0, 0, TutorialGrid*4, TutorialGrid*2) arrowDirection:UIPopoverArrowDirectionUp];
    
    //顶视角绘画创作
    [tutorial addActionStep:@"CylinderProjectTopViewForPaint" description:NSLocalizedString(@"CylinderProjectTopViewForPaint", nil) bounds:CGRectMake(0, 0, TutorialGrid*5, TutorialGrid*2) arrowDirection:UIPopoverArrowDirectionDown];
    
    //打开设置
    [tutorial addActionStep:@"CylinderProjectSetup" description:NSLocalizedString(@"CylinderProjectSetup", nil) bounds:CGRectMake(0, 0, TutorialGrid*5, TutorialGrid*2) arrowDirection:UIPopoverArrowDirectionDown];
    
    //调整图片高度
    [tutorial addActionStep:@"CylinderProjectSetupImageCenter" description:NSLocalizedString(@"CylinderProjectSetupImageCenter", nil) bounds:CGRectMake(0, 0, TutorialGrid*6, TutorialGrid*2) arrowDirection:UIPopoverArrowDirectionUp];
    [tutorial addActionStep:@"CylinderProjectSetupImageCenterValue" description:nil bounds:CGRectZero arrowDirection:UIPopoverArrowDirectionUp];
    
    //调整缩放比例
    [tutorial addActionStep:@"CylinderProjectSetupZoom" description:NSLocalizedString(@"CylinderProjectSetupZoomReversePaint", nil) bounds:CGRectMake(0, 0, TutorialGrid*6, TutorialGrid*2) arrowDirection:UIPopoverArrowDirectionUp];
    [tutorial addActionStep:@"CylinderProjectSetupZoomValue" description:nil bounds:CGRectZero arrowDirection:UIPopoverArrowDirectionUp];
    
    //开始绘制图片
    [tutorial addActionStep:@"CylinderProjectPaint" description:NSLocalizedString(@"CylinderProjectReversePaint", nil) bounds:CGRectMake(0, 0, TutorialGrid*6, TutorialGrid*2) arrowDirection:UIPopoverArrowDirectionDown];
    
    //完成教程
    [tutorial addPageStep:@"PaintScreenTutorialDone" description:nil pageBounds:CGRectMake(0, 0, TutorialNextButtonWidth, TutorialNextButtonHeight) pageImage:nil withNextButton:YES nextButtonName:NSLocalizedString(@"PaintScreenTutorialDone", nil)];
}

#pragma mark-
- (void)initTutorialManager{
    [ADSimpleTutorialManager initialize];
    
    //创建tutorial
    [self initTutorialAnaDrawBasic];
    
    [self initTutorialAdvancedSetup];
    
    [self initTutorialDrawReflection];
    
    [self initTutorialDrawAnamorphosis];
    
    [[ADSimpleTutorialManager current] activeTutorial:@"TutorialAnaDrawBasic"];
}

- (void)destoryTutorialManager{
    [ADSimpleTutorialManager destroy];
}

#pragma mark- 问答
- (void) initQuestionnaire{
    [[Questionnaire sharedInstance]addYesNoQuestion:@"BetaTestQuestion1"];
    [[Questionnaire sharedInstance]addYesNoQuestion:@"BetaTestQuestion2"];
    [[Questionnaire sharedInstance]addYesNoQuestion:@"BetaTestQuestion3"];
    [[Questionnaire sharedInstance]addYesNoQuestion:@"BetaTestQuestion4"];
    [[Questionnaire sharedInstance]addYesNoQuestion:@"BetaTestQuestion5"];
}


//- (void)other{
//    //选中图片
//    ADTutorialStep *step = [tutorial addActionStep:@"PaintCollectionPickImage" description:NSLocalizedString(@"PaintCollectionPickImage", nil) bounds:CGRectMake(0, 0, 256, 128) arrowDirection:UIPopoverArrowDirectionUp];
//    
//    //向后翻页
//    [tutorial addActionStep:@"CylinderProjectNextImage" description:NSLocalizedString(@"CylinderProjectNextImage", nil) bounds:CGRectMake(0, 0, 256, 128) arrowDirection:UIPopoverArrowDirectionUp];
//    
//    //向前翻页
//    //    [tutorial addActionStep:@"CylinderProjectPreviousImage" description:NSLocalizedString(@"CylinderProjectPreviousImage", nil) bounds:CGRectMake(0, 0, 256, 128) arrowDirection:UIPopoverArrowDirectionRight];
//    
//    //高级设置
//    //    step = [tutorial addPageStep:@"CylinderProjectSetup" description:nil pageBounds:CGRectMake(0, 0, 197, 223) pageImage:nil withNextButton:false];
//    //    inidcatorView = [[ADTutorialIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 256, 128)];
//    //    inidcatorView.arrowDirection = UIPopoverArrowDirectionDown;
//    //    [inidcatorView initWithTutorial:tutorial description:NSLocalizedString(@"CylinderProjectSetup", nil) bgImage:nil];
//    //    [step addIndicatorView:inidcatorView];
//    
//    //高级设置
//    [tutorial addActionStep:@"CylinderProjectSetup" description:NSLocalizedString(@"CylinderProjectSetup", nil) bounds:CGRectMake(0, 0, 256, 128) arrowDirection:UIPopoverArrowDirectionDown];
//    
//    //点击圆柱体，进入快捷参数选择
//    [tutorial addActionStep:@"CylinderProjectSetupScene" description:NSLocalizedString(@"CylinderProjectSetupScene", nil) bounds:CGRectMake(0, 0, 256, 128) arrowDirection:UIPopoverArrowDirectionUp];
//    
//    //点击圆柱体，进入快捷参数选择
//    [tutorial addActionStep:@"CylinderProjectSetupSceneDone" description:NSLocalizedString(@"CylinderProjectSetupSceneDone", nil) bounds:CGRectMake(0, 0, 256, 128) arrowDirection:UIPopoverArrowDirectionUp];
//    
//    //放置设备
//    //    step = [tutorial addPageStep:@"CylinderProjectPutDevice" description:nil pageBounds:CGRectMake(0, 0, 256, 256) pageImage:@"tutorial_putDevice.png" withNextButton:false];
//    //
//    //    inidcatorView = [[ADTutorialIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 256, 128)];
//    //    inidcatorView.arrowDirection = UIPopoverArrowDirectionDown;
//    //    [inidcatorView initWithTutorial:tutorial description:NSLocalizedString(@"CylinderProjectPutDevice", nil) bgImage:nil];
//    //    [step addIndicatorView:inidcatorView];
//    
//    [tutorial addActionStep:@"CylinderProjectPutDevice" description:NSLocalizedString(@"CylinderProjectPutDevice", nil) bounds:CGRectMake(0, 0, 256, 128) arrowDirection:UIPopoverArrowDirectionDown];
//    
//    //调整视线
//    //    step = [tutorial addPageStep:@"CylinderProjectViewDevice" description:nil pageBounds:CGRectMake(0, 0, 256, 198) pageImage:@"tutorial_viewDevice.png" withNextButton:false];
//    //    inidcatorView = [[ADTutorialIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 256, 192)];
//    //    inidcatorView.arrowDirection = UIPopoverArrowDirectionDown;
//    //    [inidcatorView initWithTutorial:tutorial description:NSLocalizedString(@"CylinderProjectViewDeviceDone", nil) bgImage:nil];
//    //    [step addIndicatorView:inidcatorView];
//    
//    step = [tutorial addActionStep:@"CylinderProjectViewDevice" description:NSLocalizedString(@"CylinderProjectViewDeviceDone", nil) bounds:CGRectMake(0, 0, 256, 192) arrowDirection:UIPopoverArrowDirectionDown];
//    
//    inidcatorView = [[ADTutorialIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 256, 368)];
//    inidcatorView.arrowDirection = UIPopoverArrowDirectionDown;
//    [inidcatorView initWithTutorial:tutorial description:NSLocalizedString(@"CylinderProjectViewDevice", nil) bgImage:[UIImage imageNamed:@"tutorial_viewDevice.png"]];
//    [step addIndicatorView:inidcatorView];
//    
//    
//    //顶视角绘画创作
//    [tutorial addActionStep:@"CylinderProjectTopViewForPaint" description:NSLocalizedString(@"CylinderProjectTopViewForPaint", nil) bounds:CGRectMake(0, 0, 256, 128) arrowDirection:UIPopoverArrowDirectionDown];
//    
//    //观察视角绘画创作
//    step = [tutorial addActionStep:@"CylinderProjectSideViewForPaint" description:NSLocalizedString(@"CylinderProjectSideViewForPaint", nil) bounds:CGRectMake(0, 0, 256, 128) arrowDirection:UIPopoverArrowDirectionDown];
//    
//    inidcatorView = [[ADTutorialIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 256, 128)];
//    inidcatorView.arrowDirection = UIPopoverArrowDirectionDown;
//    [inidcatorView initWithTutorial:tutorial description:NSLocalizedString(@"CylinderProjectTopViewForPaintDetail", nil) bgImage:nil];
//    [step addIndicatorView:inidcatorView];
//    
//    //开始绘制图片
//    [tutorial addActionStep:@"CylinderProjectPaint" description:NSLocalizedString(@"CylinderProjectPaint", nil) bounds:CGRectMake(0, 0, 256, 128) arrowDirection:UIPopoverArrowDirectionDown];
//}
@end
