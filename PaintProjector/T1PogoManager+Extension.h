//
//  T1PogoManager+Extension.h
//  PaintProjector
//
//  Created by 文杰 胡 on 2/12/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import "T1PogoManager.h"
#import <objc/runtime.h>

static char PenConnectedKey;
static char LastBatteryLevelKey;
@interface T1PogoManager (Extension)
@property(retain, nonatomic)T1PogoPen *penConnected;
@property(assign, nonatomic)NSInteger lastBatteryLevel;
@end
