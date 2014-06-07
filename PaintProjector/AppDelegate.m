//
//  AppDelegate.m
//  PaintProjector
//
//  Created by Marin Todorov on 09/02/2012.
//  Copyright (c) 2012 Marin Todorov. All rights reserved.
//

#import "AppDelegate.h"

#import <DBChooser/DBChooser.h>
#import "AnaDrawIAPManager.h"
#import "BBXBeeblex.h"
#import "iRate.h"


//#define DEBUG 1
@implementation AppDelegate

@synthesize window = _window;

+ (void)initialize
{
    //configure iRate
    [iRate sharedInstance].appStoreID = 885877961;
    [iRate sharedInstance].daysUntilPrompt = 5;
    [iRate sharedInstance].usesUntilPrompt = 15;
//    [iRate sharedInstance].previewMode = true;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    DebugLogSystem(@"applicationDidFinishLaunchingWithOptions");
    
    [BBXBeeblex initializeWithAPIKey:@"OWEwODU3ZWVjNzU3NmNkMjg2MDFiODg1ODE3NThjNTk2MTliYTE3ZDM5YTA2MDcwODI4YWRjN2FiMzgwNzAwMDc1YmI1ZDFkMTE0Njk2YzBhMDNkYzhhNTY1M2NiY2I1NGFjM2U2MDMyMzYxYTcyYjU5ZTRmNzBjMjU3ZWYzNWUsLS0tLS1CRUdJTiBQVUJMSUMgS0VZLS0tLS0KTUlJQklqQU5CZ2txaGtpRzl3MEJBUUVGQUFPQ0FROEFNSUlCQ2dLQ0FRRUE1cW5mN0hka29UZXRVeEYwOHM2Qwp2ME95NEtOd3F4bGVvcW5wd3pUa1orUXVQTWhkU0xXQ1NSUHhOUjNRYjlzeVEvVHhkS1hWTUt2VjJicldWZE42ClhnNUxQT2NjZ0l6ZWFQQWp2UXdjcGc2KzZmOFlKTFpEUGtudzAxeGhZZkRCajJqNzY3NFNRVmNVenB1QUZqYVEKeEV2Zm5DUkxIZUh5SnNWTm1YZGp1clZJOW9xTERVcnk5S3hEdkVXMENyKzBqK0NaYzlkMytxOXBBRXdVRUxlaApSY3g2cTdjMmxtL0c1NU9LTkw0NmVqcTgrK3VTTEJSL0pkWUF5MFR2MnY4bkdHQURhb2tjUG9XMUVVdjk1Z0gyCnBqTC8vSzNDY1dpZUo0U2d0NVRnZFBPNmhhS3NaTk5lZDVxNmZ6Vm9LWlB6WVdPcnk4dGluclNGSFZtckt1TTMKeXdJREFRQUIKLS0tLS1FTkQgUFVCTElDIEtFWS0tLS0t"];
    
    [Flurry setCrashReportingEnabled:NO];
    [Flurry startSession:@"M8DMDS5GW352GZQ4TN3B"];
    
    [TestFlight takeOff:@"d99fa9e3-3923-4f55-acea-0a1e077b133f"];
    
    [Crashlytics startWithAPIKey:@"c9088b1cc6c9d24318c5ed35da6d53c9457d0365"];
    
//    DBAccountManager* accountMgr =
//    [[DBAccountManager alloc] initWithAppKey:@"08yvvqxgb9k6jbl" secret:@"8sdk2e91z8nv2vy"];
//    [DBAccountManager setSharedManager:accountMgr];
//

    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"everLaunched"]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"everLaunched"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
    }
    else{
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"firstLaunch"];
    }
    
#if DEBUG
    //设置用户参数
    [[NSUserDefaults standardUserDefaults] setInteger:10 forKey:@"LayerQuantityLimitation"];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"ExpandedBrushPackageAvailable"];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"ExpandedSwatchManagerAvailable"];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"AnamorphosisSetup"];
    
#else
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"]) {
        //第一次启动时，将Collection内的contents拷贝入Documents,以后首页直接读取用户document目录下的文件结构
        [self copyCollectionFromMainBundleToUserDocument];

        //设置用户参数
        [[NSUserDefaults standardUserDefaults] setInteger:2 forKey:@"LayerQuantityLimitation"];
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"ExpandedBrushPackageAvailable"];
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"ExpandedSwatchManagerAvailable"];
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"AnamorphosisSetup"];

        // 這裡判斷是否第一次
//        UIAlertView * alert =[[UIAlertView alloc] initWithTitle:@"第一次"
//                                                        message:@"進入App"
//                                                       delegate:self
//                                              cancelButtonTitle:@"我知道了"
//                                              otherButtonTitles:nil];
//        [alert show];
    }
#endif
    
    //初始化IAP商店
    [[AnaDrawIAPManager sharedInstance] requestProductsWithCompletionHandler:nil];


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
//    NSLog(@"applicationWillEnterForeground");
    DebugLogSystem(@"applicationWillEnterForeground");
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
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *documentImagesFolderPath = [documentsDirectory stringByAppendingPathComponent:@"Collection"];
    success = [fileManager fileExistsAtPath:documentImagesFolderPath];
    
    if (success){
        return;
    }else{
        NSString *resourceDBFolderPath = [[[NSBundle mainBundle] resourcePath]
                                          stringByAppendingPathComponent:@"Collection"];

        [fileManager createDirectoryAtPath:documentImagesFolderPath withIntermediateDirectories:true attributes:nil error:nil];
        [fileManager copyItemAtPath:resourceDBFolderPath toPath:documentImagesFolderPath
                              error:&error];
    }
}
@end
