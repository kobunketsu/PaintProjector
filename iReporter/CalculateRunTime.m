//
//  CalculateRunTime.m
//  iReporter
//
//  Created by 文杰 胡 on 12-11-24.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "CalculateRunTime.h"

#import <mach/mach_time.h>

@implementation CalculateRunTime

CGFloat BNRTimeBlock (void (^block)(void)) {
    mach_timebase_info_data_t info;
    if (mach_timebase_info(&info) != KERN_SUCCESS) return -1.0;
    
    uint64_t start = mach_absolute_time ();
    block ();
    uint64_t end = mach_absolute_time ();
    uint64_t elapsed = end - start;
    
    uint64_t nanos = elapsed * info.numer / info.denom;
    CGFloat result = (CGFloat)nanos / NSEC_PER_SEC;
        
    NSLog(@"isEqual: time: %f\n", result);    
    return result;
}
@end