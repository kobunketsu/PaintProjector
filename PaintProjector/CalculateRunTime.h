//
//  CalculateRunTime.h
//  PaintProjector
//
//  Created by 文杰 胡 on 12-11-24.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculateRunTime : NSObject

CGFloat BUNRTimeBlock (void (^block)(void));

@end
