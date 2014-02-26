//
//  AnaDrawIAPManager.h
//  PaintProjector
//
//  Created by kobunketsu on 14-2-24.
//  Copyright (c) 2014年 WenjiHu. All rights reserved.
//

#import "InAppPurchaseManager.h"
#import "Brush.h"

@interface AnaDrawIAPManager : InAppPurchaseManager
+(id)sharedInstance;

////解锁笔刷
//- (void)unlockBrush:(Brush*)brush;
////解锁图层数量限制
//- (void)unlockLayerQuantityLimitation;
////解锁调色板数量限制
//- (void)unlockPalleteQuantityLimitation;
@end
