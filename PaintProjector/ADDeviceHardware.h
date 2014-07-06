//
//  UIDeviceHardware.h
//
//  Used to determine EXACT version of device software is running on.

#import <Foundation/Foundation.h>

@interface ADDeviceHardware : NSObject 

- (NSString *) platform;
- (NSString *) platformString;

@end