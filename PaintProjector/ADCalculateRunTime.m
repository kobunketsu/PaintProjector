//
//  CalculateRunTime.m
//  PaintProjector
//
//  Created by 文杰 胡 on 12-11-24.
//  Copyright (c) 2012年 Hu Wenjie. All rights reserved.
//

#import "ADCalculateRunTime.h"

#import <mach/mach_time.h>
#import "mach/mach.h"

@implementation ADCalculateRunTime
CGFloat BNRTimeBlock (void (^block)(void)) {
    mach_timebase_info_data_t info;
    if (mach_timebase_info(&info) != KERN_SUCCESS) return -1.0;
    
    uint64_t start = mach_absolute_time ();
    block ();
    uint64_t end = mach_absolute_time ();
    uint64_t elapsed = end - start;
    
    uint64_t nanos = elapsed * info.numer / info.denom;
    CGFloat result = (CGFloat)nanos / NSEC_PER_SEC;
    
//    DebugLogProfile(@"isEqual: time: %f\n", result);
    NSLog(@"isEqual: time: %f\n", result);
    
    return result;
}
-(void) report_memory {
    struct task_basic_info info;
    mach_msg_type_number_t size = sizeof(info);
    kern_return_t kerr = task_info(mach_task_self(),
                                   TASK_BASIC_INFO,
                                   (task_info_t)&info,
                                   &size);
    if( kerr == KERN_SUCCESS ) {
        DebugLogProfile(@"Memory in use (in bytes): %u", info.resident_size);
    } else {
        DebugLogProfile(@"Error with task_info(): %s", mach_error_string(kerr));
    }
}
@end