//
//  AppDelegate.h
//  PaintProjector
//
//  Created by 胡 文杰 on 09/02/2012.
//  Copyright (c) 2012 Hu Wenjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnaDrawTutorialManager.h"

@interface AppDelegate : UIResponder
<UIApplicationDelegate, UICollectionViewDataSource,
TutorialManagerDelegate>

@property (strong, nonatomic) UIWindow *window;
- (void)initTutorial;
- (void)copyCollectionFromMainBundleToUserDocument;
@end
